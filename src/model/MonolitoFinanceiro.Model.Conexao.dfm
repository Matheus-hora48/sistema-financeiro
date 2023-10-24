object dmConexao: TdmConexao
  OnCreate = DataModuleCreate
  Height = 283
  Width = 566
  PixelsPerInch = 120
  object FDQuery1: TFDQuery
    SQL.Strings = (
      'select * from usuarios')
    Left = 40
    Top = 128
  end
  object SQLConexao: TFDConnection
    Params.Strings = (
      'DriverID=SQLite')
    Left = 40
    Top = 40
  end
end
