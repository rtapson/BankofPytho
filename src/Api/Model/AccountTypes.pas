unit AccountTypes;

interface

uses
  SysUtils, 
  Generics.Collections, 
  Aurelius.Mapping.Attributes, 
  Aurelius.Types.Blob, 
  Aurelius.Types.DynamicProperties, 
  Aurelius.Types.Nullable, 
  Aurelius.Types.Proxy;

type
  TAccountType = class;
  
  [Entity]
  [Table('AccountTypes')]
  [Id('FID', TIdGenerator.IdentityOrSequence)]
  TAccountType = class
  private
    [Column('ID', [TColumnProp.Required, TColumnProp.NoInsert, TColumnProp.NoUpdate])]
    FID: Integer;
    
    [Column('Name', [TColumnProp.Required], 128)]
    FName: string;
    
    [Column('Desrciption', [TColumnProp.Lazy])]
    [DBTypeWideMemo]
    FDesrciption: TBlob;
  public
    property ID: Integer read FID write FID;
    property Name: string read FName write FName;
    property Desrciption: TBlob read FDesrciption write FDesrciption;
  end;
  
implementation

initialization
  RegisterEntity(TAccountType);

end.
