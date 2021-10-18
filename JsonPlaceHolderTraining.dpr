program JsonPlaceHolderTraining;

uses
  Vcl.Forms,
  Model.Provider in 'Source\Model\Provider\Model.Provider.pas',
  Model.Provider.Post.Interfaces in 'Source\Model\Provider\Model.Provider.Post.Interfaces.pas',
  Model.Services.Post.Factory in 'Source\Model\Services\Model.Services.Post.Factory.pas',
  Model.Provider.Post.Factory in 'Source\Model\Provider\Model.Provider.Post.Factory.pas',
  Model.Connections.DB.Firedac.PostgreSQL in 'Source\Model\Connections\Model.Connections.DB.Firedac.PostgreSQL.pas',
  Model.POCO.Post in 'Source\Model\POCO\Model.POCO.Post.pas',
  Model.Services.Interfaces in 'Source\Model\Services\Model.Services.Interfaces.pas',
  Model.Services in 'Source\Model\Services\Model.Services.pas',
  Model.Connections.Interfaces in 'Source\Model\Connections\Model.Connections.Interfaces.pas',
  Model.Logger in 'Source\Model\Logger\Model.Logger.pas',
  Model.Provider.Post in 'Source\Model\Provider\Model.Provider.Post.pas',
  Model.Utils.StringHelper in 'Source\Model\Utils\Model.Utils.StringHelper.pas',
  Model.Connections.Rest.Connector in 'Source\Model\Connections\Model.Connections.Rest.Connector.pas',
  Model.Connections.Rest.Provider in 'Source\Model\Connections\Model.Connections.Rest.Provider.pas',
  Model.Connections.Rest.Connector.RR4D in 'Source\Model\Connections\Model.Connections.Rest.Connector.RR4D.pas',
  Model.Connections.Rest.Interfaces in 'Source\Model\Connections\Model.Connections.Rest.Interfaces.pas',
  View.FrmMain in 'Source\View\View.FrmMain.pas' {Form1},
  Controller.Interfaces in 'Source\Controller\Controller.Interfaces.pas',
  Controller in 'Source\Controller\Controller.pas',
  Model.Validator.Interfaces in 'Source\Model\Validator\Model.Validator.Interfaces.pas',
  Model.Validator in 'Source\Model\Validator\Model.Validator.pas',
  Model.Validator.Text.Constraints in 'Source\Model\Validator\Model.Validator.Text.Constraints.pas',
  Model.Validator.Text.Properties.MaxLength in 'Source\Model\Validator\Model.Validator.Text.Properties.MaxLength.pas',
  Model.Validator.Text.Properties.MinLength in 'Source\Model\Validator\Model.Validator.Text.Properties.MinLength.pas',
  Model.Validator.Text.Properties.NonEmpty in 'Source\Model\Validator\Model.Validator.Text.Properties.NonEmpty.pas',
  Model.Validator.Text.Properties in 'Source\Model\Validator\Model.Validator.Text.Properties.pas',
  Model.Services.Post.List in 'Source\Model\Services\Model.Services.Post.List.pas',
  Model.Services.Post in 'Source\Model\Services\Model.Services.Post.pas',
  Model.Services.Entity.Interfaces in 'Source\Model\Services\Model.Services.Entity.Interfaces.pas',
  Model.Services.Entity in 'Source\Model\Services\Model.Services.Entity.pas',
  Model.Logger.Interfaces in 'Source\Model\Logger\Model.Logger.Interfaces.pas',
  Model.Services.Entity.List in 'Source\Model\Services\Model.Services.Entity.List.pas',
  Model.SQL.Generic in 'Source\Model\SQL\Model.SQL.Generic.pas',
  Model.SQL.Interfaces in 'Source\Model\SQL\Model.SQL.Interfaces.pas',
  Model.SQL.RTTI.Adapter in 'Source\Model\SQL\Model.SQL.RTTI.Adapter.pas',
  Model.SQL.RTTI in 'Source\Model\SQL\Model.SQL.RTTI.pas',
  Model.SQL.RTTI.StringUtils in 'Source\Model\SQL\Model.SQL.RTTI.StringUtils.pas',
  Model.SQL.RTTI.Types in 'Source\Model\SQL\Model.SQL.RTTI.Types.pas',
  Model.SQL.Types in 'Source\Model\SQL\Model.SQL.Types.pas',
  Model.Services.Post.DataModule in 'Source\Model\Services\Model.Services.Post.DataModule.pas' {dmEntityQuery: TDataModule};

{$R *.res}

begin
  ReportMemoryLeaksOnShutdown := DebugHook <> 0;
  //
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
