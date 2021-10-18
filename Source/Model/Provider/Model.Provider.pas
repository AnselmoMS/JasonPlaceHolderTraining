unit Model.Provider;

interface

uses
  Model.Provider.Post.Interfaces;

type
  TProvider<T> = class(TInterfacedObject, IProvider<T>)
  private
    FParent: T;
    FPosts: IProviderPosts<T>;
  public
    constructor Create(_AParent: T);
    //
    function Parent: T;
    function Posts: IProviderPosts<T>;
  end;

implementation

uses
  Model.Provider.Post;

constructor TProvider<T>.Create(_AParent: T);
begin
  FParent:= _AParent
end;

function TProvider<T>.Parent: T;
begin
  Result := FParent
end;

function TProvider<T>.Posts: IProviderPosts<T>;
begin
  if not Assigned(FPosts) then
    FPosts:= TProviderPosts<T>.Create(FParent);

  Result := FPosts
end;

end.
