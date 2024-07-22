object PythoConnection: TPythoConnection
  Height = 396
  Width = 564
  PixelsPerInch = 192
  object AureliusConnection1: TAureliusConnection
    DriverName = 'MSSQL'
    Params.Strings = (
      'Server=.'
      'Database=PythoBank'
      'TrustedConnection=True')
    Left = 64
    Top = 64
  end
end
