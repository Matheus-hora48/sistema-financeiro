object dmUsuarios: TdmUsuarios
  OnCreate = DataModuleCreate
  OnDestroy = DataModuleDestroy
  Height = 343
  Width = 655
  PixelsPerInch = 120
  object sqlUsuarios: TFDQuery
    Active = True
    Connection = dmConexao.SQLConexao
    SQL.Strings = (
      'select * from usuarios')
    Left = 40
    Top = 32
  end
  object cdsUsuarios: TClientDataSet
    Active = True
    Aggregates = <>
    Params = <>
    ProviderName = 'dspUsuarios'
    Left = 248
    Top = 32
    object cdsUsuariosid: TStringField
      FieldName = 'id'
      Origin = 'id'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Size = 36
    end
    object cdsUsuariosnome: TStringField
      FieldName = 'nome'
      Origin = 'nome'
      Size = 50
    end
    object cdsUsuarioslogin: TStringField
      FieldName = 'login'
      Origin = 'login'
    end
    object cdsUsuariossenha: TStringField
      FieldName = 'senha'
      Origin = 'senha'
      Size = 64
    end
    object cdsUsuariosstatus: TStringField
      FieldName = 'status'
      Origin = 'status'
      Size = 1
    end
    object cdsUsuariosdata_cadastro: TDateField
      FieldName = 'data_cadastro'
      Origin = 'data_cadastro'
    end
    object cdsUsuariossenha_temporaria: TStringField
      FieldName = 'senha_temporaria'
      Origin = 'senha_temporaria'
      FixedChar = True
      Size = 1
    end
  end
  object dspUsuarios: TDataSetProvider
    DataSet = sqlUsuarios
    Options = [poAllowCommandText, poUseQuoteChar]
    Left = 144
    Top = 32
  end
end
