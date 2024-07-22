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
  TAccountTableDictionary = class;
  TAccountTypeTableDictionary = class;
  
  TDicDictionary = class
  private
    FAccount: TAccountTableDictionary;
    FAccountType: TAccountTypeTableDictionary;
    function GetAccount: TAccountTableDictionary;
    function GetAccountType: TAccountTypeTableDictionary;
  public
    destructor Destroy; override;
    property Account: TAccountTableDictionary read GetAccount;
    property AccountType: TAccountTypeTableDictionary read GetAccountType;
  end;
  
  TAccountTableDictionary = class
  private
    FID: TDictionaryAttribute;
    FTenantID: TDictionaryAttribute;
    FNumber: TDictionaryAttribute;
    FType_: TDictionaryAttribute;
  public
    constructor Create;
    property ID: TDictionaryAttribute read FID;
    property TenantID: TDictionaryAttribute read FTenantID;
    property Number: TDictionaryAttribute read FNumber;
    property Type_: TDictionaryAttribute read FType_;
  end;
  
  TAccountTypeTableDictionary = class
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
  if FAccountType <> nil then FAccountType.Free;
  if FAccount <> nil then FAccount.Free;
  inherited;
end;

function TDicDictionary.GetAccount: TAccountTableDictionary;
begin
  if FAccount = nil then FAccount := TAccountTableDictionary.Create;
  result := FAccount;
end;

function TDicDictionary.GetAccountType: TAccountTypeTableDictionary;
begin
  if FAccountType = nil then FAccountType := TAccountTypeTableDictionary.Create;
  result := FAccountType;
end;

{ TAccountTableDictionary }

constructor TAccountTableDictionary.Create;
begin
  inherited;
  FID := TDictionaryAttribute.Create('ID');
  FTenantID := TDictionaryAttribute.Create('TenantID');
  FNumber := TDictionaryAttribute.Create('Number');
  FType_ := TDictionaryAttribute.Create('Type_');
end;

{ TAccountTypeTableDictionary }

constructor TAccountTypeTableDictionary.Create;
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
