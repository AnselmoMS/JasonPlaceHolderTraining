unit Model.Services.Post.Factory;

interface

uses
  Model.Services.Entity.Interfaces,
  Model.Services.Interfaces,
  Model.POCO.Post;

type
  TServicesPostFactory = class
    class function NewPost(_AParent: IServices): IEntity<TPost>;
    class function NewPostList(_AParent: IServices): IEntityList<TPost>;
  end;

implementation

uses
  Model.Services.Post,
  Model.Services.Post.List,
  Model.Connections.DB.Firedac.PostgreSQL,
  Model.Logger;

{ TServicesPostFactory }

class function TServicesPostFactory.NewPost(_AParent: IServices): IEntity<TPost>;
begin
  Result := TPostEntity
              .New(_AParent)
                .WithConnection(TConnectorDBFiredacPostgreSQL.GetInstance.WithLogger(TLogger.GetInstance))
                //.WithLogger(TLogger.GetInstance)
                .WithListActions( NewPostList(_AParent) );
end;

class function TServicesPostFactory.NewPostList(_AParent: IServices): IEntityList<TPost>;
begin
  Result := TPostListEntity.New
              .WithConnection(TConnectorDBFiredacPostgreSQL.GetInstance.WithLogger(TLogger.GetInstance))
              //.WithLogger(TLogger.GetInstance);
end;

end.
