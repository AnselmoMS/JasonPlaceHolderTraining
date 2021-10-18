unit Model.Connections.DB.Firedac.PostgreSQL;

interface

uses
  Model.Connections.Interfaces,
  System.SysUtils,
  System.Classes,
  //
  FireDAC.Stan.Intf,
  FireDAC.Stan.Option,
  FireDAC.Stan.Error,
  FireDAC.UI.Intf,
  FireDAC.Phys.Intf,
  FireDAC.Stan.Def,
  FireDAC.Stan.Pool,
  FireDAC.Stan.Async,
  FireDAC.Phys,
  FireDAC.Phys.PGDef,
  FireDAC.VCLUI.Wait,
  FireDAC.Comp.UI,
  FireDAC.Phys.PG,
  Data.DB,
  FireDAC.Comp.Client;

type
  TConnectorDBFiredacPostgreSQL = class(TInterfacedObject, IConnectorDB)
    private
      class var FInstance: IConnectorDB;
      class var FDConnection: TFDConnection;
      class var PgDriverLink: TFDPhysPgDriverLink;
      class var FDGUIxWaitCursor: TFDGUIxWaitCursor;
      //class var AsyncExecuteDialog: TFDGUIxAsyncExecuteDialog;
      class procedure FreeObjects;
      class procedure CreateObjects;
      class procedure ConfigureObjects;
      //constructor Create;
    public
      destructor Destroy; override;
      //
      class function NewInstance: TObject; override;
      class function GetInstance: IConnectorDB;
      function StartTransaction: IConnectorDB;
      function Commit: IConnectorDB;
      function ExecSQL(_SQL: String): IConnectorDB;
      function InTransaction: Boolean;
      function DisConnect: IConnectorDB;
      function Connect: IConnectorDB;
      function Rollback: IConnectorDB;
      function WithComponent(_AComponent: TComponent): IConnectorDB;
  end;

implementation

{ TConnectorDBPostgreSQL }

function TConnectorDBFiredacPostgreSQL.Commit: IConnectorDB;
begin
  FDConnection.Commit;
  Result := Self;
end;

class procedure TConnectorDBFiredacPostgreSQL.ConfigureObjects;
begin
  PgDriverLink.VendorLib := 'libpq.dll' ;//GetCurrentDir + '\pglib\libpq.dll'; { TODO -oansel -c : Load From Ini File 15/10/2021 22:11:14 }
  //
  FDGUIxWaitCursor.Name := 'FDGUIxWaitCursor';
  FDGUIxWaitCursor.Provider := 'Forms';
  //
  {
  AsyncExecuteDialog.Name := 'AsyncExecuteDialog';
  AsyncExecuteDialog.Provider := 'Forms';
  AsyncExecuteDialog.Caption := 'CM Application Test';
  AsyncExecuteDialog.Prompt := 'Aguarde enquanto carregamos os dados...';
  }
  //
  FDConnection.Params.Clear;
  FDConnection.Params.Add('DriverID=PG');
  FDConnection.Params.Add('ApplicationName=Application - Test');

  FDConnection.Params.Add('Database=db_cm_test');
  FDConnection.Params.Add('Password=postzeus2011');
  FDConnection.Params.Add('Server=localhost');
  FDConnection.Params.Add('User_Name=postgres');

  FDConnection.LoginPrompt := True;
end;

function TConnectorDBFiredacPostgreSQL.Connect: IConnectorDB;
begin
  FDConnection.Connected := True;
  Result := Self;
end;

class procedure TConnectorDBFiredacPostgreSQL.CreateObjects;
begin
  PgDriverLink := TFDPhysPgDriverLink.Create(nil);
  FDGUIxWaitCursor := TFDGUIxWaitCursor.Create(nil);
  //AsyncExecuteDialog := TFDGUIxAsyncExecuteDialog.Create(nil);
  FDConnection := TFDConnection.Create(nil);
end;

destructor TConnectorDBFiredacPostgreSQL.Destroy;
begin
  FreeObjects;
  inherited;
end;

function TConnectorDBFiredacPostgreSQL.DisConnect: IConnectorDB;
begin
  FDConnection.Connected := False
end;

function TConnectorDBFiredacPostgreSQL.ExecSQL(_SQL: String): IConnectorDB;
begin
  FDConnection.ExecSQL(_SQL);
  Result := Self;
end;

class procedure TConnectorDBFiredacPostgreSQL.FreeObjects;
begin
  FreeAndNil(FDConnection);
  FreeAndNil(PgDriverLink);
  FreeAndNil(FDGUIxWaitCursor);
//  AsyncExecuteDialog.Free;
end;

class function TConnectorDBFiredacPostgreSQL.GetInstance: IConnectorDB;
begin
  if not Assigned(FInstance) then
    FInstance := TConnectorDBFiredacPostgreSQL(NewInstance);
  Result := FInstance;
end;

function TConnectorDBFiredacPostgreSQL.InTransaction: Boolean;
begin
  Result := FDConnection.InTransaction
end;

class function TConnectorDBFiredacPostgreSQL.NewInstance: TObject;
begin
  if not Assigned(FInstance) then
  begin
    FInstance := TConnectorDBFiredacPostgreSQL(inherited NewInstance);
    ConfigureObjects;
  end;
  Result := TObject(FInstance);
end;

function TConnectorDBFiredacPostgreSQL.Rollback: IConnectorDB;
begin
  FDConnection.Rollback;
  Result := Self
end;

function TConnectorDBFiredacPostgreSQL.StartTransaction: IConnectorDB;
begin
  FDConnection.StartTransaction;
  Result := Self;
end;

function TConnectorDBFiredacPostgreSQL.WithComponent(_AComponent: TComponent): IConnectorDB;
begin
  FDConnection := TFDConnection(_AComponent);
  Result := Self;
end;

initialization
  TConnectorDBFiredacPostgreSQL.CreateObjects;
finalization
  TConnectorDBFiredacPostgreSQL.FreeObjects;

end.
