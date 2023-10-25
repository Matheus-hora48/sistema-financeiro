object dmUsuarios: TdmUsuarios
  OnCreate = DataModuleCreate
  OnDestroy = DataModuleDestroy
  Height = 343
  Width = 655
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
    object cdsUsuariosid: TStringField
      FieldName = 'id'
      Size = 36
    end
    object cdsUsuariosnome: TStringField
      FieldName = 'nome'
      Size = 50
    end
    object cdsUsuarioslogin: TStringField
      FieldName = 'login'
    end
    object cdsUsuariossenha: TStringField
      FieldName = 'senha'
    end
    object cdsUsuariosstatus: TStringField
      FieldName = 'status'
      Size = 1
    end
    object cdsUsuariosdata_cadastro: TDateField
      FieldName = 'data_cadastro'
    end
  end
  object dspUsuarios: TDataSetProvider
    DataSet = sqlUsuarios
    Options = [poAllowCommandText, poUseQuoteChar]
    Left = 144
    Top = 32
  end
end
