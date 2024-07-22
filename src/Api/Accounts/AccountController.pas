unit AccountController;

interface

uses
  MVCFramework, MVCFramework.Commons, MVCFramework.Nullables,
  MVCFramework.Serializer.Commons, System.Generics.Collections;

type
  [MVCPath('/api')]
  TAccountsController = class(TMVCController)
  protected
    procedure OnBeforeAction(Context: TWebContext; const AActionName: string; var Handled: Boolean); override;
    procedure OnAfterAction(Context: TWebContext; const AActionName: string); override;
  public

  end;

implementation

uses
  System.StrUtils, System.SysUtils, MVCFramework.Logger;


procedure TAccountsController.OnAfterAction(Context: TWebContext; const AActionName: string);
begin
  { Executed after each action }
  inherited;
end;

procedure TAccountsController.OnBeforeAction(Context: TWebContext; const AActionName: string; var Handled: Boolean);
begin
  { Executed before each action
    if handled is true (or an exception is raised) the actual
    action will not be called }
  inherited;
end;


end.
