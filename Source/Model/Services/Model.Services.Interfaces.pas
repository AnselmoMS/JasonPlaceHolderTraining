unit Model.Services.Interfaces;

interface

uses
  Model.Services.Entity.Interfaces,
  Model.POCO.Post;

  type
    IServices = interface
      ['{619B3437-7C57-49A3-B51C-F2EAD6B65F77}']
      function Post: IEntity<TPost>;
    end;

implementation

end.
