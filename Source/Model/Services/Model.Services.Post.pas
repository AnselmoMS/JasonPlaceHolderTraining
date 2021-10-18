unit Model.Services.Post;

interface

uses
  Model.Services.Interfaces,
  Model.POCO.Post,
  Model.SQL.Generic,
  Model.SQL.Interfaces,
  Model.Connections.Interfaces,
  Model.SQL.Types,
  Model.Logger,
  Model.Services.Post.List,
  Model.Services.Entity.Interfaces,
  Model.Services.Entity,
  Model.Services.Entity.List,
  Model.Logger.Interfaces;

type
  TPostEntity = class(TEntity<TPost>, ILoggerEntity<TPostEntity>, IDBEntity<TPostEntity>)
  private
   var
    FParent: IServices;
  protected
  public
    class function New(_AParent: IServices): TPostEntity;
    constructor Create(_AParent: IServices);
    //IDBEntity
    function WithConnection(_AConnection: IConnectorDB): TPostEntity;
    //ILoggerEntity
    function WithLogger(_ALogger: Ilogger): TPostEntity;
  end;

implementation

constructor TPostEntity.Create(_AParent: IServices);
begin
  inherited Create;
  FParent := _AParent
end;

class function TPostEntity.New(_AParent: IServices): TPostEntity;
begin
  Result := Self.Create(_AParent);
end;

function TPostEntity.WithConnection(_AConnection: IConnectorDB): TPostEntity;
begin
  FConnection := _AConnection;
  Result := Self;
end;

function TPostEntity.WithLogger(_ALogger: Ilogger): TPostEntity;
begin
  FLogger := _Alogger;
  Result := Self;
end;

end.
