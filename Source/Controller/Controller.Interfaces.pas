unit Controller.Interfaces;

interface
  uses
    Model.Services.Interfaces,
    Model.Provider.Post.Interfaces,
    Model.Validator.Interfaces;

  type
    IController = interface
      ['{F4EC0EE8-BD1E-4DC9-8A47-C44AAFF60F3C}']
      function Services: IServices;
      function Provider: IProvider<IController>;
      function Validator: IValidator;//<IController>; { TODO -oansel -c : implement generic fluent API to back to controller 17/10/2021 07:24:52 }
      //function StateControls: IEnabler; //
    end;

implementation

end.
