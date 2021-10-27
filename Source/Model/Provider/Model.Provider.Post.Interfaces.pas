unit Model.Provider.Post.Interfaces;

interface

uses
  System.Json,
  System.SysUtils;

type
  IProviderPosts = interface;

  IProvider = interface
    ['{DC219DBE-DAE2-47F0-8BA6-718F35C6512A}']
    function Posts: IProviderPosts;
  end;

  IProviderPosts = interface
    ['{4C400967-2828-401B-8FCE-769FF1138BA1}']
    function OnAfterGet(_AResult: TProc<TJSONValue>): IProviderPosts;
    function GetAll: IProviderPosts;
    function GetLastResult: TJSONValue;
  end;

implementation

end.
