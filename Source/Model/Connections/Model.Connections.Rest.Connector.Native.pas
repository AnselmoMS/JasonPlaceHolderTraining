unit Model.Connections.Rest.Connector.Native;

interface

uses
  REST.Types,
  REST.Client,
  Data.Bind.Components,
  Data.Bind.ObjectScope,
  //
  Model.Connections.Rest.Interfaces,
  Model.Connections.Rest.Connector;

   type
   TConnectorRestNative = class(TRestConnector)
   private
    var
      FRESTClient: TRESTClient;
      FRESTRequest: TRESTRequest;
      FRESTResponse: TRESTResponse;
   public
     constructor Create;
     destructor Destroy; override;
     class function New: IRestConnector;
     //
     function ExecuteGet: IRestConnector; override;
   end;


implementation

uses
  System.Classes, System.JSON;

{ TConnectorRestNative }

constructor TConnectorRestNative.Create;
begin
  FRESTClient := TRESTClient.Create(nil);
  FRESTRequest := TRESTRequest.Create(nil);
  FRESTResponse := TRESTResponse.Create(nil);
  //
  FRESTRequest.ConnectTimeout := 3000;
  FRESTRequest.ReadTimeout := 3000;
  FRESTRequest.Client := FRESTClient;
  FRESTRequest.Response := FRESTResponse;
end;

destructor TConnectorRestNative.Destroy;
begin
  FRESTClient.Free;
  FRESTRequest.Free;
  FRESTResponse.Free;
  //
  inherited;
end;

function TConnectorRestNative.ExecuteGet: IRestConnector;
begin
  TThread.CreateAnonymousThread(
    procedure
    begin
      FRESTClient.BaseURL := GetFullURL;
      FRestRequest.Execute;
      //
      TThread.Synchronize(TThread.Current,
      procedure
      begin
        FResponseJson:= TJsonObject.ParseJSONValue(FRESTResponse.Content);
        DoAfterGet;
      end)
    end).Start;

  Result := Self;

end;

class function TConnectorRestNative.New: IRestConnector;
begin
  Result := Self.Create
end;

end.
