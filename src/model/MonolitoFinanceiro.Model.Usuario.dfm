object dmUsuarios: TdmUsuarios
  Height = 343
  Width = 761
  PixelsPerInch = 120
  object sqlUsuarios: TFDQuery
    Connection = dmConexao.SQLConexao
    SQL.Strings = (
      'select * from usuarios')
    Left = 40
    Top = 32
  end
  object cdsUsuarios: TClientDataSet
    Aggregates = <>
    FileName = 'cdsUsuarios'
    Params = <>
    ProviderName = 'dspUsuarios'
    Left = 248
    Top = 32
  end
  object dspUsuarios: TDataSetProvider
    DataSet = sqlUsuarios
    Options = [poAllowCommandText, poUseQuoteChar]
    Left = 144
    Top = 32
  end
end
