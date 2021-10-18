unit Model.Connections.Interfaces;

interface

uses
  System.JSON,
  System.SysUtils,
  System.Classes;

type
  IConnector = interface {Rest, DataBase, ...}
  ['{94C2072D-AE4D-43EE-8A34-F31E602D9643}']
  end;

  IConnectorDB = interface(IConnector)
  ['{6081AF0F-0068-4C93-AF3C-D943D72C99D5}']
  function Commit: IConnectorDB;
  function Component: TComponent;
  function ExecSQL(_SQL: string): IConnectorDB;
  function InTransaction: Boolean;
  function DisConnect: IConnectorDB;
  function Connect: IConnectorDB;
  function Rollback: IConnectorDB;
  function StartTransaction: IConnectorDB;
  function WithComponent(_AComponent: TComponent): IConnectorDB;
  end;

implementation

end.
