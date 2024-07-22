unit AccountService;

interface

uses
  Generics.Collections,
  Accounts;

type
  IAccountService = interface
    ['{2A1F8D9F-97D4-495E-9161-9B5A38BEB88F}']
    function CreateAccount(const Account: TAccount): Integer;
    function GetAll: TObjectList<TAccount>;
  end;

  TAccountService = class(TInterfacedObject, IAccountService)
  public
    function GetAll: TObjectList<TAccount>;
    function CreateAccount(const Account: TAccount): Integer;
  end;

implementation

uses
  Aurelius.Engine.ObjectManager,
  ConnectionModule,
  PythoContext;

{ TAccountService }

function TAccountService.CreateAccount(const Account: TAccount): Integer;
var
  OM : TObjectManager;
begin
  OM := TObjectManager.Create(TPythoConnection.CreateConnection);
  try
    OM.Save(Account);
    Result := Account.Id;
  finally
    OM.Free;
  end;
end;

function TAccountService.GetAll: TObjectList<TAccount>;
var
  OM : TObjectManager;
begin
  OM := TObjectManager.Create(TPythoConnection.CreateConnection);
  try
    Result := OM.Find<TAccount>.List;
  finally
    OM.Free;
  end;
end;


end.
