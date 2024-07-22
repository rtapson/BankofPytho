unit MainForm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Sphinx.Login;

type
  TForm2 = class(TForm)
    SphinxLogin1: TSphinxLogin;
    Button1: TButton;
    Memo1: TMemo;
    procedure SphinxLogin1UserLoggedIn(Args: TUserLoggedInArgs);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form2: TForm2;

implementation

{$R *.dfm}

procedure TForm2.Button1Click(Sender: TObject);
begin
  SphinxLogin1.Login;
end;

procedure TForm2.SphinxLogin1UserLoggedIn(Args: TUserLoggedInArgs);
begin
  Memo1.Lines.Add('User ' + Args.LoginResult.Profile.Email + ' logged in.');
end;

end.
