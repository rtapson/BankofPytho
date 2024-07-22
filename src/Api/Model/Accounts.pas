unit Accounts;

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
  TAccount = class;
  
  [Entity]
  [Table('Accounts')]
  [Id('FID', TIdGenerator.None)]
  TAccount = class
  private
    [Column('ID', [TColumnProp.Required])]
    FID: Integer;
    
    [Column('TenantID', [TColumnProp.Required])]
    FTenantID: Integer;
    
    [Column('Number', [TColumnProp.Lazy])]
    [DBTypeWideMemo]
    FNumber: TBlob;
    
    [Column('Type', [TColumnProp.Required, TColumnProp.NoInsert, TColumnProp.NoUpdate])]
    FType_: Integer;
  public
    property ID: Integer read FID write FID;
    property TenantID: Integer read FTenantID write FTenantID;
    property Number: TBlob read FNumber write FNumber;
    property Type_: Integer read FType_ write FType_;
  end;
  
implementation

initialization
  RegisterEntity(TAccount);

end.
