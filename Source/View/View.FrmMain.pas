unit View.FrmMain;

interface

uses
  Winapi.Windows,
  Winapi.Messages,
  System.SysUtils,
  System.Variants,
  System.Classes,
  Vcl.Graphics,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Dialogs,
  Vcl.StdCtrls,
  Data.DB,
  Vcl.Grids,
  Vcl.DBGrids,
  System.JSON,
  Rest.Json,
  //
  Controller,
  Controller.Interfaces,
  Model.POCO.Post,
  System.Generics.Collections,
  Vcl.ExtCtrls;

type
  TForm1 = class(TForm)
    btnImportData: TButton;
    btnDownloadPosts: TButton;
    dbgrdPostList: TDBGrid;
    btnListPosts: TButton;
    dsList: TDataSource;
    Memo1: TMemo;
    edtTitle: TEdit;
    memBody: TMemo;
    btDelete: TButton;
    lblID: TLabel;
    lblUserId: TLabel;
    btEdit: TButton;
    btSave: TButton;
    btShow: TButton;
    lblTitleError: TLabel;
    lblBodyError: TLabel;
    btnLoadFromFile: TButton;
    btnLoadListObject: TButton;
    Panel1: TPanel;
    procedure FormCreate(Sender: TObject);
    procedure btnDownloadPostsClick(Sender: TObject);
    procedure btnImportDataClick(Sender: TObject);
    procedure btnListPostsClick(Sender: TObject);
    procedure btShowClick(Sender: TObject);
    procedure btDeleteClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure btEditClick(Sender: TObject);
    procedure btSaveClick(Sender: TObject);
    procedure btnLoadFromFileClick(Sender: TObject);
    procedure btnLoadListObjectClick(Sender: TObject);
  private
    FState : TDataSetState;
    FController: IController;
    FResultList: TList<TPost>;
    FJsonFileString: TJsonValue;
    { Private declarations }
    procedure LoadPostObjectList(_AJsonValue: TJsonValue);
    procedure FillControls(_APost: TPost);
    function GetPostFromControls: TPost;
    procedure ConfigureValidators;
    procedure ConfigureStateControl;
    procedure SetState(const Value: TdatasetState);
    procedure LocalLog(_AText: string);
  public
    { Public declarations }
    property State: TdatasetState read FState write SetState;
  end;

var
  Form1: TForm1;

implementation
uses
  DataSet.Serialize,
  Model.Connections.Rest.Interfaces,

  IOUtils, Model.Services.Post, Model.Services.Entity.Interfaces;

type
  TPostAdapter = class
    class function FromJsonArray(_ResponseJson: TJSONValue): TList<TPost>;
    class function FromJson(_ResponseJson: TJSONValue): TPost;
  end;

type
  TDataSetStatePostHelper = record helper for TDataSetState
    procedure Save(_AController: IController; _APost: TPost);
    procedure SetStateControls(_AController: IController);
  end;

{$R *.dfm}

procedure TForm1.btDeleteClick(Sender: TObject);
var
  aPost: TPost;
begin
  aPost:= GetPostFromControls;
  try
    FController
      .Services
        .Post
          .LoadFrom(APost)
        .Delete
        //.AfterDelete(SetBrowseState) //To-Do
        ;
    State := dsBrowse;
  finally
    aPost.Free;
  end;
end;

procedure TForm1.btEditClick(Sender: TObject);
begin
  State := dsEdit;
end;

procedure TForm1.btnDownloadPostsClick(Sender: TObject);
begin
  FController
    .Provider
      .Posts
        .GetAll
end;

procedure TForm1.btnImportDataClick(Sender: TObject);
var
  aPostE: IEntityList<TPost>;
begin
  FController
    .Services
      .Post
        .ListActions
          .LoadFromList(FResultList)
            .InsertAll;
end;

procedure TForm1.btnListPostsClick(Sender: TObject);
begin
  dsList.dataset:= FController
                      .Services
                        .Post
                          .ListActions
                            .SelectAll //it can delay
                            .GetDataSet;
end;

procedure TForm1.btnLoadFromFileClick(Sender: TObject);
begin
  FJsonFileString:= TJSONObject.ParseJSONValue(TFile.ReadAllText('posts.json'));
  LocalLog('Arquivo json carregado!');
end;

procedure TForm1.btnLoadListObjectClick(Sender: TObject);
begin
  LoadPostObjectList(FJsonFileString);
end;

procedure TForm1.btSaveClick(Sender: TObject);
var
  aPost: TPost;
begin
  aPost:= GetPostFromControls;
  try
    State.Save(FController, aPost);
    State := dsBrowse;
  finally
    aPost.Free;
  end;
end;

procedure TForm1.btShowClick(Sender: TObject);
var
  APost : TPost;
begin
  APost := TPostAdapter
             .FromJson(
                        dsList
                          .dataset
                            .ToJSONObject()
                        );
  try
    FillControls(APost);
  finally
    APost.Free;
  end;
end;

procedure TForm1.FillControls(_APost: TPost);
begin
  lblID.Caption := _APost.Id.ToString;
  lblUserId.Caption := _APost.UserId.ToString;
  edtTitle.Text := _APost.Title;
  memBody.Lines.Text := _APost.Body
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  FController := TController.New;

  FController
    .Provider
      .Posts
        .OnAfterGet(LoadPostObjectList);

  ConfigureValidators;
end;

procedure TForm1.FormDestroy(Sender: TObject);
begin
  if FResultList <> nil then
    FResultList.Free
end;

function TForm1.GetPostFromControls: TPost;
begin
  Result := TPost.Create;
  //
  Result.Id:= StrToInt(lblID.Caption);
  Result.UserId := StrToInt(lblUserId.Caption);
  Result.Title := edtTitle.Text;
  Result.Body := memBody.Lines.Text;
end;

procedure TForm1.ConfigureStateControl;
begin
  {
  FController
    .StateControls
      .Enabled
        .Add(Integer(dsInsert), )
      //.EndUpdate
      //.Visible(Integer(dsInsert),)
  }
end;

procedure TForm1.ConfigureValidators;
begin
  FController
    .Validator
      .EditLabel(edtTitle, lblTitleError)
        .NonEmpty
      .EndUpdate
        .MinLength(4)   //get from model
          .ErrorMessage('Limite mínimo de 5 caracteres permitido')
          .EndUpdate
        .MaxLength(100) //get from model
          .ErrorMessage('Limite máximo de 100 caracteres permitido')
          .EndUpdate
        .EndUpdate
      .EditLabel(memBody, lblBodyError)
        .NonEmpty
          .EndUpdate
        .MinLength(10)   //get from model   ...get default message
          .EndUpdate
        .MaxLength(500) //get from model;   ...get default message
          .EndUpdate;
end;

procedure TForm1.LoadPostObjectList(_AJsonValue: TJsonValue);
begin
  FResultList := TPostAdapter.FromJsonArray(_AJsonValue);
end;

procedure TForm1.LocalLog(_AText: string);
begin
  Memo1.Lines.Add(_AText);
end;

procedure TForm1.SetState(const Value: TdatasetState);
begin
  FState := Value;
  FState.SetStateControls(FController);
end;

{ TPostCollectionAdapter }

class function TPostAdapter.FromJson(_ResponseJson: TJSONValue): TPost;
begin
  Result := TJson.JsonToObject<TPost>(_ResponseJson.ToJSON);
end;

class function TPostAdapter.FromJsonArray(_ResponseJson: TJSONValue): TList<TPost>;
var
  jsArray: TJSONArray;
  jsItem: TJsonValue;
  aPost: TPost;
begin
  Result := TObjectList<TPost>.Create;

  jsArray := _ResponseJson as TJSONArray;

  for jsItem in jsArray do
  begin
    aPost := TJson.JsonToObject<TPost>(jsItem.ToJSON);
    Result.Add(aPost);
  end;
end;

{ TDataSetStatePostHelper }

procedure TDataSetStatePostHelper.Save(_AController: IController; _APost: TPost);
begin
  case self of
    dsEdit: _AController
              .Services
                  .Post
                    .LoadFrom(_APost)
                    .Update;

    dsInsert: _AController
                .Services
                  .Post
                    .LoadFrom(_APost)
                    .Insert;
  else
    raise Exception.Create('Wrong State to Save');
  end;
end;

procedure TDataSetStatePostHelper.SetStateControls(_AController: IController);
begin
  //_AController.StateControls.Set(Integer(Self))
end;

end.
