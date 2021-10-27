unit Model.Provider.Post;

interface

uses
  Model.Provider.Post.Interfaces,
  System.SysUtils,
  System.JSON,
  Model.Connections.Rest.Interfaces;

type
  TProviderPosts = class(TInterfacedObject, IProviderPosts)
  private
    FAfterGetProc: TProc<TJSONValue>;
    FLastResult: TJSONValue;
    FRestConnector: IRestConnector;
    procedure Configure;
    procedure DoAfterGet;
  public
    constructor Create;
    class function New: IProviderPosts;
    //
    function GetAll: IProviderPosts;
    function GetLastResult: TJSONValue;
    function OnAfterGet(_AProc: TProc<TJSONValue>): IProviderPosts;
  end;

implementation

uses
  Model.Connections.Rest.Connector.Native;

{ TProviderPosts<T> }

procedure TProviderPosts.Configure;
begin
    FRestConnector:=
    TConnectorRestNative
      .New
        .WithURLBase('https://jsonplaceholder.typicode.com/posts')
        .OnAfterGet(DoAfterGet);
end;

constructor TProviderPosts.Create;
begin
  Configure;
end;

procedure TProviderPosts.DoAfterGet;
begin
  FLastResult := FRestConnector.GetResponseJson as TJSONArray;
  if Assigned(FAfterGetProc) then
    FAfterGetProc(FLastResult)
end;

function TProviderPosts.GetAll: IProviderPosts;
begin
  FRestConnector.ExecuteGet;
  Result := Self;
end;

function TProviderPosts.GetLastResult: TJSONValue;
begin
  Result := FLastResult;
end;

class function TProviderPosts.New: IProviderPosts;
begin
  Self.Create
end;

function TProviderPosts.OnAfterGet(_AProc: TProc<TJSONValue>): IProviderPosts;
begin
  FAfterGetProc := _AProc;
  Result := Self;
end;

end.
