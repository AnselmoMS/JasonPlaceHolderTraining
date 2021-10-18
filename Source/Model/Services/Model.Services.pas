unit Model.Services;

interface
uses
  Model.Services.Interfaces,
  Model.Services.Entity.Interfaces,
  Model.POCO.Post,
  Controller.Interfaces;

type
  TServices = class(TInterfacedObject, IServices)
  private
    var
      FParent: IController;
      FPost: IEntity<TPost>;
  public
    class function New(_AParent: IController): IServices;
    //
    constructor Create(_AParent: IController);
    //
    function Post: IEntity<TPost>;
    //
    //function Parent: T;
  end;

implementation

uses
  Model.Services.Post.Factory;

{ TServices }

function TServices.Post: IEntity<TPost>;
begin
  if not Assigned(FPost) then
    FPost := TServicesPostFactory.NewPost(Self);
  Result := FPost;
end;

constructor TServices.Create(_AParent: IController);
begin
  inherited Create;
  FPost := nil;
  FParent:= _AParent
end;

class function TServices.New(_AParent: IController): IServices;
begin
  Result:= Self.Create(_AParent);
end;

end.
