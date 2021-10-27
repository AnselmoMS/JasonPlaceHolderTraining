unit Model.Provider;

interface

uses
  Model.Provider.Post.Interfaces;

type
  TProvider = class(TInterfacedObject, IProvider)
  private
    FPosts: IProviderPosts;
  public
    function Posts: IProviderPosts;
  end;

implementation

uses
  Model.Provider.Post;

function TProvider.Posts: IProviderPosts;
begin
  if not Assigned(FPosts) then
    FPosts:= TProviderPosts.Create;

  Result := FPosts
end;

end.
