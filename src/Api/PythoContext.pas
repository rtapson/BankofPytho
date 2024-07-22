unit PythoContext;

interface

uses
  SysUtils, 
  Generics.Collections, 
  Aurelius.Mapping.Attributes, 
  Aurelius.Types.Blob, 
  Aurelius.Types.DynamicProperties, 
  Aurelius.Types.Nullable, 
  Aurelius.Types.Proxy, 
  Aurelius.Criteria.Dictionary;

type
  TAccountsTableDictionary = class;
  TAccountTypesTableDictionary = class;
  
  TDicDictionary = class
  private
    FAccounts: TAccountsTableDictionary;
    FAccountTypes: TAccountTypesTableDictionary;
    function GetAccounts: TAccountsTableDictionary;
    function GetAccountTypes: TAccountTypesTableDictionary;
  public
    destructor Destroy; override;
    property Accounts: TAccountsTableDictionary read GetAccounts;
    property AccountTypes: TAccountTypesTableDictionary read GetAccountTypes;
  end;
  
  TAccountsTableDictionary = class
  private
    FID: TDictionaryAttribute;
    FTenantID: TDictionaryAttribute;
    FAccountNumber: TDictionaryAttribute;
    FAccoiuntType: TDictionaryAttribute;
  public
    constructor Create;
    property ID: TDictionaryAttribute read FID;
    property TenantID: TDictionaryAttribute read FTenantID;
    property AccountNumber: TDictionaryAttribute read FAccountNumber;
    property AccoiuntType: TDictionaryAttribute read FAccoiuntType;
  end;
  
  TAccountTypesTableDictionary = class
  private
    FID: TDictionaryAttribute;
    FName: TDictionaryAttribute;
    FDesrciption: TDictionaryAttribute;
  public
    constructor Create;
    property ID: TDictionaryAttribute read FID;
    property Name: TDictionaryAttribute read FName;
    property Desrciption: TDictionaryAttribute read FDesrciption;
  end;
  
function Dic: TDicDictionary;

implementation

var
  __Dic: TDicDictionary;

function Dic: TDicDictionary;
begin
  if __Dic = nil then __Dic := TDicDictionary.Create;
  result := __Dic
end;

{ TDicDictionary }

destructor TDicDictionary.Destroy;
begin
  if FAccountTypes <> nil then FAccountTypes.Free;
  if FAccounts <> nil then FAccounts.Free;
  inherited;
end;

function TDicDictionary.GetAccounts: TAccountsTableDictionary;
begin
  if FAccounts = nil then FAccounts := TAccountsTableDictionary.Create;
  result := FAccounts;
end;

function TDicDictionary.GetAccountTypes: TAccountTypesTableDictionary;
begin
  if FAccountTypes = nil then FAccountTypes := TAccountTypesTableDictionary.Create;
  result := FAccountTypes;
end;

{ TAccountsTableDictionary }

constructor TAccountsTableDictionary.Create;
begin
  inherited;
  FID := TDictionaryAttribute.Create('ID');
  FTenantID := TDictionaryAttribute.Create('TenantID');
  FAccountNumber := TDictionaryAttribute.Create('AccountNumber');
  FAccoiuntType := TDictionaryAttribute.Create('AccoiuntType');
end;

{ TAccountTypesTableDictionary }

constructor TAccountTypesTableDictionary.Create;
begin
  inherited;
  FID := TDictionaryAttribute.Create('ID');
  FName := TDictionaryAttribute.Create('Name');
  FDesrciption := TDictionaryAttribute.Create('Desrciption');
end;

initialization

finalization
  if __Dic <> nil then __Dic.Free

end.
