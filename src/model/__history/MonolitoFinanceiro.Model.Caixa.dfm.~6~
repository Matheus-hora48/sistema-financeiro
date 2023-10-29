object dmCaixa: TdmCaixa
  Height = 311
  Width = 590
  PixelsPerInch = 120
  object dspCaixa: TDataSetProvider
    DataSet = sqlCaixa
    Options = [poAllowCommandText, poUseQuoteChar]
    Left = 144
    Top = 32
  end
  object cdsCaixa: TClientDataSet
    Active = True
    Aggregates = <>
    Params = <>
    ProviderName = 'dspCaixa'
    Left = 248
    Top = 32
    object cdsCaixaid: TStringField
      FieldName = 'id'
      Origin = 'id'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      FixedChar = True
      Size = 36
    end
    object cdsCaixanumero_doc: TStringField
      FieldName = 'numero_doc'
      Origin = 'numero_doc'
      Required = True
    end
    object cdsCaixadescricao: TStringField
      FieldName = 'descricao'
      Origin = 'descricao'
      Size = 200
    end
    object cdsCaixavalor: TFMTBCDField
      FieldName = 'valor'
      Origin = 'valor'
      Required = True
      Precision = 18
      Size = 2
    end
    object cdsCaixatipo: TStringField
      FieldName = 'tipo'
      Origin = 'tipo'
      Required = True
      FixedChar = True
      Size = 1
    end
    object cdsCaixadata_cadastro: TDateField
      FieldName = 'data_cadastro'
      Origin = 'data_cadastro'
      Required = True
    end
  end
  object sqlCaixa: TFDQuery
    Active = True
    Connection = dmConexao.SQLConexao
    SQL.Strings = (
      'select * from caixa')
    Left = 40
    Top = 32
  end
end
