unit Model.Connections.Rest.Provider;

interface

uses
  Model.Connections.Rest.Interfaces,
  System.JSON;

type
  TRestProvider<T> = class(TInterfacedObject, IRestProvider<T>)
  private
    FAdapter: IRestAdapter<T>;
  protected
    FToken: String;
  public
    function FromJson(_JSonValue: TJsonValue): T;
    function GetURLBase: String; virtual; abstract;
    function WithAdapter(_Adapter: IRestAdapter<T>): IRestProvider<T>;
    function WithToken(_Token: string): IRestProvider<T>;
  end;

implementation

function TRestProvider<T>.FromJson(_JSonValue: TJsonValue): T;
begin
  Result := FAdapter.FromJson(_JSonValue);
end;

function TRestProvider<T>.WithAdapter(_Adapter: IRestAdapter<T>): IRestProvider<T>;
begin
  FAdapter:= _Adapter;
  Result := Self
end;

function TRestProvider<T>.WithToken(_Token: string): IRestProvider<T>;
begin
  FToken:= _Token;
  Result := Self
end;

end.
