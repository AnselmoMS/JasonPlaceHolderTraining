unit Model.Provider.Post.Factory;

interface
uses
  Model.Provider.Post.Interfaces;

type
  TProviderPostFactory<T> = class
  public
    class function ProviderPosts: IProviderPosts<T>;
  end;

implementation

{ TProviderPostFactory<T> }

class function TProviderPostFactory<T>.ProviderPosts: IProviderPosts<T>;
begin
//  Result := TProviderPosts<T>.Create;
end;

end.
