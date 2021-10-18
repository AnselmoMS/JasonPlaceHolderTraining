unit Model.Services.Entity.List;

interface

uses
  Data.DB,
  System.Generics.Collections,
  Model.Services.Entity.Interfaces,
  Model.SQL.Types,
  Model.SQL.Interfaces,
  Model.Connections.Interfaces,
  Model.Logger.Interfaces,
  Model.Services.Entity;

type
  TEntityList<T: class, constructor> = class(TInterfacedObject, IEntityList<T>)
  private
    FList: TList<T>;
    procedure ExecuteDMLToList(_Operation: TDMLOperation);
  protected
    FConnection: IConnectorDB;
    FLogger: ILogger;
  public
    constructor Create;
    //
    function DeleteAll: IEntityList<T>;
    function GetDataSet: TDataSet;
    function InsertAll: IEntityList<T>;
    function LoadFromList(_SourceList: TList<T>): IEntityList<T>;
    function SelectAll: IEntityList<T>;
    function UpdateAll: IEntityList<T>;
  end;

implementation

uses
  System.SysUtils;

constructor TEntityList<T>.Create;
begin
  FList := TList<T>.Create;
end;

function TEntityList<T>.DeleteAll: IEntityList<T>;
begin
  ExecuteDMLToList(dmlDelete);
  Result := Self;
end;

procedure TEntityList<T>.ExecuteDMLToList(_Operation: TDMLOperation);
var
  aSQLStatment : string;
begin
  try
    if not Assigned(FConnection) then
      raise Exception.Create('Connection was not assigned!');

    FConnection.StartTransaction;

//    aSQLStatment := GetSQLBuilder.GetDML(_Operation);
    FConnection.ExecSQL(aSQLStatment);

    FConnection.Commit;
  except
    FConnection.Rollback;
    raise;
  end;
end;

function TEntityList<T>.GetDataSet: TDataSet;
begin

end;

function TEntityList<T>.InsertAll: IEntityList<T>;
begin
  ExecuteDMLToList(dmlInsert);
  Result := Self;
end;

function TEntityList<T>.LoadFromList(_SourceList: TList<T>): IEntityList<T>;
begin
  FList.Clear;
  FList.AddRange(_SourceList.ToArray);
end;

function TEntityList<T>.SelectAll: IEntityList<T>;
begin
  //select from DataModule
  Result := Self;
end;

function TEntityList<T>.UpdateAll: IEntityList<T>;
begin
  ExecuteDMLToList(dmlUpdate);
  Result := Self;
end;

end.
