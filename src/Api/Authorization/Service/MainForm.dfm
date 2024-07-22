object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Pytho Bank Authorization Server'
  ClientHeight = 395
  ClientWidth = 679
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  OnCreate = FormCreate
  TextHeight = 15
  object SparkleHttpSysDispatcher1: TSparkleHttpSysDispatcher
    Left = 112
    Top = 80
  end
  object SphinxServer1: TSphinxServer
    BaseUrl = 'http://+:2001/tms/sphinx'
    Dispatcher = SparkleHttpSysDispatcher1
    Pool = XDataConnectionPool1
    Config = SphinxConfig1
    Left = 296
    Top = 88
  end
  object SphinxConfig1: TSphinxConfig
    Clients = <
      item
        ClientId = 'desktop'
        DisplayName = ''
        RedirectUris.Strings = (
          'http://127.0.0.1')
        RequireClientSecret = False
        AllowedGrantTypes = [gtAuthorizationCode]
        RequirePkce = False
        ValidScopes.Strings = (
          'openid'
          'email')
      end
      item
        ClientId = 'server'
        DisplayName = 'Pytho Authorization Server'
        RedirectUris.Strings = (
          'http://127.0.0.1')
        AllowedGrantTypes = [gtClientCredentials]
        ValidScopes.Strings = (
          'customers'
          'orders:read')
      end>
    LoginOptions.RequireConfirmedEmail = False
    OnGetSigningData = SphinxConfig1GetSigningData
    Left = 456
    Top = 96
  end
  object AureliusConnection1: TAureliusConnection
    DriverName = 'SQLite'
    Params.Strings = (
      'EnableForeignKeys=True')
    Left = 112
    Top = 184
  end
  object AureliusDBSchema1: TAureliusDBSchema
    Connection = AureliusConnection1
    ModelNames = 'Biz.Sphinx'
    Left = 280
    Top = 192
  end
  object XDataConnectionPool1: TXDataConnectionPool
    Connection = AureliusConnection1
    Left = 456
    Top = 192
  end
end
