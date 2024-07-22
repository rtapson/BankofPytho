unit AuthorizationDto;

interface

type
  TAuthorizationDto = class
  private
    FClientId: string;
    FClientSecret: string;
  public
    property ClientId: string read FClientId write FClientId;
    property ClientSecret: string read FClientSecret write FClientSecret;
  end;

implementation

end.
