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
  TAccounts = class;
  
  [Entity]
  [Table('Accounts')]
  [Id('FID', TIdGenerator.None)]
  TAccounts = class
  private
    [Column('ID', [TColumnProp.Required])]
    FID: Integer;
    
    [Column('TenantID', [TColumnProp.Required])]
    FTenantID: Integer;
    
    [Column('AccountNumber', [TColumnProp.Lazy])]
    [DBTypeWideMemo]
    FAccountNumber: TBlob;
    
    [Column('AccoiuntType', [TColumnProp.Required, TColumnProp.NoInsert, TColumnProp.NoUpdate])]
    FAccoiuntType: Integer;
  public
    property ID: Integer read FID write FID;
    property TenantID: Integer read FTenantID write FTenantID;
    property AccountNumber: TBlob read FAccountNumber write FAccountNumber;
    property AccoiuntType: Integer read FAccoiuntType write FAccoiuntType;
  end;
  
implementation

initialization
  RegisterEntity(TAccounts);

end.
