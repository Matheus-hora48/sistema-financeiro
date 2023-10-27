inherited frmCaixa: TfrmCaixa
  Caption = 'Caixa'
  ClientWidth = 758
  TextHeight = 28
  inherited PnlPrincipal: TCardPanel
    Width = 758
    inherited CardCadastro: TCard
      Height = 502
      inherited Panel1: TPanel
        Top = 421
      end
    end
    inherited CardPesquisa: TCard
      Height = 502
      inherited pnlPesquisaButoes: TPanel
        Top = 413
      end
      inherited pnlGrid: TPanel
        Height = 324
        inherited DBGrid1: TDBGrid
          Height = 324
          Columns = <
            item
              Expanded = False
              FieldName = 'data_cadastro'
              Title.Caption = 'Data'
              Width = 145
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'numero_doc'
              Title.Caption = 'N'#186' Documento'
              Width = 151
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'descricao'
              Title.Caption = 'Descri'#231#227'o'
              Width = 292
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'tipo'
              Title.Caption = 'Tipo'
              Width = 61
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'valor'
              Title.Caption = 'Valor'
              Width = 86
              Visible = True
            end>
        end
      end
    end
  end
  inherited DataSource1: TDataSource
    DataSet = dmCaixa.cdsCaixa
  end
end
