unit Model.Provider.Post;

interface

uses
  Model.Provider.Post.Interfaces,
  System.SysUtils,
  System.JSON,
  Model.Connections.Rest.Interfaces;

type
  TProviderPosts<T> = class(TInterfacedObject, IProviderPosts<T>)
  private
    FParent: T;
    FAfterGetProc: TProc<TJSONValue>;
    FLastResult: TJSONValue;
    FRestConnector: IRestConnector;
    procedure Configure;
    procedure DoAfterGet;
  public
    class function New(_AParent: T): IProviderPosts<T>;
    constructor Create(_AParent: T);
    //
    function GetAll: IProviderPosts<T>;
    function GetLastResult: TJSONValue;
    function OnAfterGet(_AProc: TProc<TJSONValue>): IProviderPosts<T>;
    function Parent: T;
  end;

implementation

uses
  Model.Connections.Rest.Connector.RR4D;

{ TProviderPosts<T> }

procedure TProviderPosts<T>.Configure;
begin
  FRestConnector:= TConnectorRestRR4D
                    .New
                      .WithURLBase('https://jsonplaceholder.typicode.com/posts')
                      .OnAfterGet(DoAfterGet);
end;

constructor TProviderPosts<T>.Create(_AParent: T);
begin
  FParent:= _AParent;
  Configure;
end;

procedure TProviderPosts<T>.DoAfterGet;
begin
  FLastResult := FRestConnector.GetResponseJson as TJSONArray;
  if Assigned(FAfterGetProc) then
    FAfterGetProc(FLastResult)
end;

function TProviderPosts<T>.GetAll: IProviderPosts<T>;
begin
  FRestConnector.ExecuteGet;
  Result := Self;
end;

function TProviderPosts<T>.GetLastResult: TJSONValue;
begin
  Result := FLastResult;
end;

class function TProviderPosts<T>.New(_AParent: T): IProviderPosts<T>;
begin
  Self.Create(_AParent)
end;

function TProviderPosts<T>.OnAfterGet(_AProc: TProc<TJSONValue>): IProviderPosts<T>;
begin
  FAfterGetProc := _AProc;
  Result := Self;
end;

function TProviderPosts<T>.Parent: T;
begin
  Result := FParent
end;

end.
