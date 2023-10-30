object dmContasPagar: TdmContasPagar
  Height = 338
  Width = 636
  PixelsPerInch = 120
  object sqlContasPagar: TFDQuery
    Active = True
    IndexFieldNames = 'id'
    Connection = dmConexao.SQLConexao
    SQL.Strings = (
      'select * from contas_pagar')
    Left = 88
    Top = 40
  end
  object cdsContasPagar: TClientDataSet
    Active = True
    Aggregates = <>
    Params = <>
    ProviderName = 'dspContasPagar'
    Left = 496
    Top = 40
    object cdsContasPagarid: TStringField
      FieldName = 'id'
      Origin = 'id'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      FixedChar = True
      Size = 36
    end
    object cdsContasPagarnumero_documento: TStringField
      FieldName = 'numero_documento'
      Origin = 'numero_documento'
      Required = True
    end
    object cdsContasPagarvalor_compra: TFMTBCDField
      FieldName = 'valor_compra'
      Origin = 'valor_compra'
      Required = True
      Precision = 18
      Size = 2
    end
    object cdsContasPagarvalor_abatido: TFMTBCDField
      FieldName = 'valor_abatido'
      Origin = 'valor_abatido'
      Required = True
      Precision = 18
      Size = 2
    end
    object cdsContasPagardata_compra: TDateField
      FieldName = 'data_compra'
      Origin = 'data_compra'
      Required = True
    end
    object cdsContasPagardata_cadastro: TDateField
      FieldName = 'data_cadastro'
      Origin = 'data_cadastro'
      Required = True
    end
  end
  object dspContasPagar: TDataSetProvider
    DataSet = sqlContasPagar
    Options = [poAllowCommandText, poUseQuoteChar]
    Left = 288
    Top = 40
  end
  object sqlContasPagarDetalhe: TFDQuery
    Active = True
    IndexFieldNames = 'id_conta_pagar'
    Connection = dmConexao.SQLConexao
    SQL.Strings = (
      'select * from contas_pagar_detalhes')
    Left = 88
    Top = 128
  end
  object dspContasPagarDetalhe: TDataSetProvider
    DataSet = sqlContasPagarDetalhe
    Options = [poAllowCommandText, poUseQuoteChar]
    Left = 288
    Top = 128
  end
  object cdsContasPagarDetalhe: TClientDataSet
    Active = True
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'id'
        Attributes = [faRequired, faFixed]
        DataType = ftString
        Size = 36
      end
      item
        Name = 'id_conta_pagar'
        Attributes = [faRequired, faFixed]
        DataType = ftString
        Size = 36
      end
      item
        Name = 'detalhes'
        Attributes = [faRequired]
        DataType = ftString
        Size = 200
      end
      item
        Name = 'usuario'
        Attributes = [faRequired]
        DataType = ftString
        Size = 50
      end
      item
        Name = 'meio'
        Attributes = [faRequired, faFixed]
        DataType = ftString
        Size = 1
      end
      item
        Name = 'status'
        Attributes = [faRequired, faFixed]
        DataType = ftString
        Size = 1
      end>
    IndexDefs = <>
    Params = <>
    ProviderName = 'dspContasPagarDetalhe'
    StoreDefs = True
    Left = 496
    Top = 128
    object cdsContasPagarDetalheid: TStringField
      FieldName = 'id'
      Origin = 'id'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      FixedChar = True
      Size = 36
    end
    object cdsContasPagarDetalheid_conta_pagar: TStringField
      FieldName = 'id_conta_pagar'
      Origin = 'id_conta_pagar'
      Required = True
      FixedChar = True
      Size = 36
    end
    object cdsContasPagarDetalhedetalhes: TStringField
      FieldName = 'detalhes'
      Origin = 'detalhes'
      Required = True
      Size = 200
    end
    object cdsContasPagarDetalheusuario: TStringField
      FieldName = 'usuario'
      Origin = 'usuario'
      Required = True
      Size = 50
    end
    object cdsContasPagarDetalhemeio: TStringField
      FieldName = 'meio'
      Origin = 'meio'
      Required = True
      FixedChar = True
      Size = 1
    end
    object cdsContasPagarDetalhestatus: TStringField
      FieldName = 'status'
      Origin = 'status'
      Required = True
      FixedChar = True
      Size = 1
    end
  end
  object sqlContasPagarParcela: TFDQuery
    Active = True
    IndexFieldNames = 'id_conta_pagar'
    Connection = dmConexao.SQLConexao
    SQL.Strings = (
      'select * from contas_pagar_parcelas')
    Left = 88
    Top = 224
  end
  object dspContasPagarParcela: TDataSetProvider
    DataSet = sqlContasPagarParcela
    Options = [poAllowCommandText, poUseQuoteChar]
    Left = 288
    Top = 224
  end
  object cdsContasPagarParcela: TClientDataSet
    Active = True
    Aggregates = <>
    Params = <>
    ProviderName = 'dspContasPagarParcela'
    Left = 496
    Top = 224
    object cdsContasPagarParcelaid: TStringField
      FieldName = 'id'
      Origin = 'id'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      FixedChar = True
      Size = 36
    end
    object cdsContasPagarParcelaid_conta_pagar: TStringField
      FieldName = 'id_conta_pagar'
      Origin = 'id_conta_pagar'
      Required = True
      FixedChar = True
      Size = 36
    end
    object cdsContasPagarParceladata_vencimento: TDateField
      FieldName = 'data_vencimento'
      Origin = 'data_vencimento'
      Required = True
    end
    object cdsContasPagarParcelavalor: TFMTBCDField
      FieldName = 'valor'
      Origin = 'valor'
      Required = True
      Precision = 18
      Size = 2
    end
    object cdsContasPagarParceladata_recebimento: TDateField
      FieldName = 'data_recebimento'
      Origin = 'data_recebimento'
    end
  end
end
