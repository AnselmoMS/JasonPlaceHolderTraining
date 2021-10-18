unit Model.Services.Entity.Interfaces;

interface

uses
  Data.DB,
  System.Generics.Collections,
  Model.Connections.Interfaces,
  Model.logger.Interfaces;

type
  IEntity<T: class> = interface;
  IEntityList<T: class> = interface;

  IDBEntity<T> = interface
    ['{423470FD-03A6-4D17-8DF7-5BBBCC4A4608}']
    function WithConnection(_AConnection: IConnectorDB): T;
  end;

  ILoggerEntity<T> = interface
    ['{75C0D8CC-AD63-426C-A16E-4AC7B2E3B70D}']
    function WithLogger(_ALogger: ILogger): T;
  end;

  IEntityList<T: class> = interface //T is a POCO Class
    ['{96125D08-8D94-45BF-9597-711944188BF6}']
    function GetDataSet: TDataSet;
    function SelectAll: IEntityList<T>;
    function LoadFromList(_SourceList: TList<T>): IEntityList<T>;
    function InsertAll: IEntityList<T>;
    function UpdateAll: IEntityList<T>;
    function DeleteAll: IEntityList<T>;
  end;

  IEntity<T: class> = interface //T is a POCO Class
    ['{3A164546-127D-4824-AAEB-A582092DA325}']
    function Delete: IEntity<T>;
    function EntityData: T;
    function Insert: IEntity<T>;
    function ListActions: IEntityList<T>;
    function LoadFrom(_AEntityData: T): IEntity<T>;
    function Update: IEntity<T>;
  end;

implementation

end.
