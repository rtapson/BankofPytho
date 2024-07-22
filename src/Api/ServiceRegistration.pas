unit ServiceRegistration;

interface

uses
  MVCFramework.Container;

procedure RegisterServices(Container: IMVCServiceContainer);

implementation

uses
  AccountService;

procedure RegisterServices(Container: IMVCServiceContainer);
begin
  Container.RegisterType(TAccountService, IAccountService, TRegistrationType.SingletonPerRequest);

end;


end.
