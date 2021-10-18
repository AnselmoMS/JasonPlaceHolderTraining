unit Model.Services.Post.List;

interface

uses
  Data.DB,
  System.Generics.Collections,
  Model.Services.Entity.Interfaces,
  Model.POCO.Post,
  Model.Services.Entity.List,
  Model.Connections.Interfaces,
  Model.Logger.Interfaces;

type
  TPostListEntity = class(TEntityList<TPost>, IDBEntity<TPostListEntity>, ILoggerEntity<TPostListEntity>)
  protected
    FLogger: ILogger;
    FConnection: IConnectorDB;
  public
    class function New: TPostListEntity;
    //IDBEntity
    function WithConnection(_AConnection: IConnectorDB): TPostListEntity;
    //ILoggerEntity
    function WithLogger(_ALogger: ILogger): TPostListEntity;
  end;

implementation

class function TPostListEntity.New: TPostListEntity;
begin
  Result := Self.Create;
end;

function TPostListEntity.WithConnection(_AConnection: IConnectorDB): TPostListEntity;
begin
  FConnection := _AConnection;
  Result := Self;
end;

function TPostListEntity.WithLogger(_ALogger: ILogger): TPostListEntity;
begin
  FLogger := _Alogger;
  Result := Self;
end;

end.
