unit Model.POCO.Post;

interface

uses
  Model.SQL.RTTI,
  Model.SQL.RTTI.Types,
  REST.Json.Types;

type
  [Entity('post')]
  TPost = class
  private
    FBody: string;
    FId: Integer;
    FTitle: string;
    FUserId: Integer;
  public
    [PKey, FieldType(tpInteger), FieldCaption('ID')]
    property Id: Integer read FId write FId;

    [UpdateField, FieldType(tpInteger), FieldCaption('UserId')]
    property UserId: Integer read FUserId write FUserId;

    [UpdateField, FieldType(tpString), FieldCaption('Title')]
    property Title: string read FTitle write FTitle;

    [UpdateField, FieldType(tpString), FieldCaption('Body')]
    property Body: string read FBody write FBody;
  end;

implementation

end.
