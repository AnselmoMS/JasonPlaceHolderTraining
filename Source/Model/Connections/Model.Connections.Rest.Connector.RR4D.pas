unit Model.Connections.Rest.Connector.RR4D;

interface

uses
  Model.Connections.Rest.Interfaces,
  Model.Connections.Rest.Connector,
  RESTRequest4D;

   type
   TConnectorRestRR4D = class(TRestConnector)
   private
   public
     constructor Create;
     //
     class function New: IRestConnector;
     //
     function ExecuteGet: IRestConnector; override;
   end;

implementation

uses
  System.SysUtils,
  System.Classes,
  Winapi.Windows,
  System.JSON;

{ TConnectorRestRR4D }

function TConnectorRestRR4D.ExecuteGet: IRestConnector;
begin
  TThread.CreateAnonymousThread(
    procedure
    var
      FRequest: IRequest;
      FResponse: IResponse;
    begin
      FRequest := TRequest
                    .New
                      .Accept('application/json');

      FResponse := FRequest
                     .BaseURL(GetFullURL)
                       .Get;

      TThread.Synchronize(TThread.Current,
      procedure
      begin
        FResponseJson := FResponse.JSONValue;
        OutputDebugString(Pchar(FResponseJson.ToString));
        DoAfterGet;
      end)
    end).Start;

  Result := Self;
end;

class function TConnectorRestRR4D.New: IRestConnector;
begin
  Result := Self.Create
end;

end.
