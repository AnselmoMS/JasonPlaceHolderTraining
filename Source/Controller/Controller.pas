unit Controller;

interface

uses
  Controller.Interfaces,
  Model.Services.Interfaces,
  Model.Services,
  Model.Provider.Post.Interfaces,
  Model.Provider,
  Model.Validator.Interfaces,
  Model.Validator;

type
  TController = class(TInterfacedObject, IController)
  private
    FProvider : IProvider<IController>;
    [weak]
    FServices : IServices;
    [weak]
    FValidator: IValidator;
  public
    function Provider: IProvider<IController>;
    function Services: IServices;
    function Validator: IValidator;
    class function New: IController;
  end;

implementation

{ TController }

class function TController.New: IController;
begin
  Result := Self.Create
end;

function TController.Provider: IProvider<IController>;
begin
  if not Assigned(FProvider) then
    FProvider := TProvider<IController>.Create(Self);
  Result := FProvider;
end;

function TController.Services: IServices;
begin
  if not Assigned(FServices) then
    FServices := TServices.Create(Self);
  Result := FServices;
end;

function TController.Validator: IValidator;
begin
  if not Assigned(FValidator) then
    FValidator := TValidator.New;
  Result := FValidator;
end;

end.
