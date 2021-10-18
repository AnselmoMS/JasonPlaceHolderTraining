unit Model.Provider.Post.Interfaces;

interface

uses
  System.Json,
  System.SysUtils;

type
  IProviderPosts<T> = interface;

  IProvider<T> = interface
    ['{DC219DBE-DAE2-47F0-8BA6-718F35C6512A}']
    function Posts: IProviderPosts<T>;
    function Parent: T;
  end;

  IProviderPosts<T> = interface
    ['{4C400967-2828-401B-8FCE-769FF1138BA1}']
    function OnAfterGet(_AResult: TProc<TJSONValue>): IProviderPosts<T>;
    function GetAll: IProviderPosts<T>;
    function GetLastResult: TJSONValue;
    function Parent: T;
  end;

implementation

end.
