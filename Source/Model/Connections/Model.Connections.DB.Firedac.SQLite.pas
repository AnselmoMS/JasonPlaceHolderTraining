unit Model.Connections.DB.Firedac.SQLite;

interface

uses
  System.SysUtils,
  System.Classes,
  Firedac.Comp.Client,
  Model.Connections.Interfaces;
type
  TConnectorDBFiredacSQLite = class(TInterfacedObject, IConnectorDB)
  var
    FConnection: TFDConnection;
    FAfterCommit: TProc;
  public
    class function New: IConnectorDB;
    //
    function StartTransaction: IConnectorDB;
    function Commit: IConnectorDB;
    function ExecSQL(_SQL: string): IConnectorDB;
    function OnAfterCommit(_AProc: TProc): IConnectorDB;
    function InTransaction: Boolean;
    function DisConnect: IConnectorDB;
    function Connect: IConnectorDB;
    function Rollback: IConnectorDB;
    function WithComponent(_AComponent: TComponent): IConnectorDB;
  end;

implementation

{ TConnectorDBFiredacPostgres }

function TConnectorDBFiredacSQLite.Commit: IConnectorDB;
begin
  FConnection.Commit;
  Result := Self;
end;

function TConnectorDBFiredacSQLite.Connect: IConnectorDB;
begin
  FConnection.Connected := True;
  Result := Self;
end;

function TConnectorDBFiredacSQLite.DisConnect: IConnectorDB;
begin
  FConnection.Connected := False;
  Result := Self;
end;

function TConnectorDBFiredacSQLite.ExecSQL(_SQL: string): IConnectorDB;
begin
  FConnection.ExecSQL(_SQL);
  Result := Self;
end;

function TConnectorDBFiredacSQLite.InTransaction: Boolean;
begin
  Result := FConnection.InTransaction
end;

class function TConnectorDBFiredacSQLite.New: IConnectorDB;
begin
  Result := Self.Create
end;

function TConnectorDBFiredacSQLite.OnAfterCommit(_AProc: TProc): IConnectorDB;
begin
  FAfterCommit := _Aproc;
  Result := Self;
end;

function TConnectorDBFiredacSQLite.Rollback: IConnectorDB;
begin
  FConnection.Rollback;
end;

function TConnectorDBFiredacSQLite.StartTransaction: IConnectorDB;
begin
  FConnection.StartTransaction;
  Result := Self;
end;

function TConnectorDBFiredacSQLite.WithComponent(_AComponent: TComponent): IConnectorDB;
begin
  FConnection := TFDConnection(_AComponent);
  Result := Self;
end;

end.
