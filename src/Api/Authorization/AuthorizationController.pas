unit AuthorizationController;

interface

uses
  MVCFramework, MVCFramework.Commons, MVCFramework.Nullables, AuthorizationDto,
  MVCFramework.Serializer.Commons, System.Generics.Collections;

type
  [MVCPath('/api')]
  TAuthorizationController = class(TMVCController)
  public
    [MVCPath('/authorize')]
    [MVCHTTPMethod([httpPOST])]
    function CreateAuthorization([MVCFromBody] AuthDto: TAuthorizationDto): IMVCResponse;

  end;

implementation

uses
  System.StrUtils, System.SysUtils, MVCFramework.Logger;


function TAuthorizationController.CreateAuthorization([MVCFromBody] AuthDto: TAuthorizationDto): IMVCResponse;
begin
  //LogI('Created ' + Person.FirstName + ' ' + Person.LastName);
  Result := CreatedResponse('', 'Person created');
end;

end.
