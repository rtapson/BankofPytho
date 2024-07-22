object Form2: TForm2
  Left = 0
  Top = 0
  Caption = 'Form2'
  ClientHeight = 501
  ClientWidth = 724
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  DesignSize = (
    724
    501)
  TextHeight = 15
  object Button1: TButton
    Left = 0
    Top = 8
    Width = 75
    Height = 25
    Caption = 'Button1'
    TabOrder = 0
    OnClick = Button1Click
  end
  object Memo1: TMemo
    Left = 0
    Top = 48
    Width = 721
    Height = 445
    Anchors = [akLeft, akTop, akRight, akBottom]
    Lines.Strings = (
      'Memo1')
    TabOrder = 1
  end
  object SphinxLogin1: TSphinxLogin
    Authority = 'http://localhost:2001/tms/sphinx'
    ClientId = 'desktop'
    Scope = 'openid email'
    OnUserLoggedIn = SphinxLogin1UserLoggedIn
    Left = 408
    Top = 184
  end
end
