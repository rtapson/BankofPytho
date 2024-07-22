unit MainForm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Sparkle.HttpServer.Module,
  Sparkle.HttpServer.Context, Sphinx.Server.Module, Sphinx.Comp.Config,
  Sparkle.Comp.Server, XData.Comp.Server, Sphinx.Comp.Server,
  Sparkle.Comp.HttpSysDispatcher, Aurelius.Engine.DatabaseManager,
  Aurelius.Drivers.Interfaces, XData.Comp.ConnectionPool,
  Aurelius.Comp.DBSchema, Aurelius.Comp.Connection, Aurelius.Drivers.SQLite;

type
  TForm1 = class(TForm)
    SparkleHttpSysDispatcher1: TSparkleHttpSysDispatcher;
    SphinxServer1: TSphinxServer;
    SphinxConfig1: TSphinxConfig;
    AureliusConnection1: TAureliusConnection;
    AureliusDBSchema1: TAureliusDBSchema;
    XDataConnectionPool1: TXDataConnectionPool;
    procedure FormCreate(Sender: TObject);
    procedure SphinxConfig1GetSigningData(Sender: TObject;
      Args: TGetSigningDataArgs);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.FormCreate(Sender: TObject);
begin
  AureliusConnection1.Params.Values['Database'] := ChangeFileExt(ParamStr(0), '.db');
  AureliusDBSchema1.UpdateDatabase;

  //SphinxConfig1.Clients[1].AddSha256Secret(THashSHA2.GetHashBytes(ClientSecret));

  SparkleHttpSysDispatcher1.Active := True;
end;

procedure TForm1.SphinxConfig1GetSigningData(Sender: TObject; Args: TGetSigningDataArgs);
begin
  Args.Data.Key := TEncoding.UTF8.GetBytes('This is the secret for JWT signing');
end;

end.
