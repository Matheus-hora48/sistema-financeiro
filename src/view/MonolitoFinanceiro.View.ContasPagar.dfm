inherited frmContasPagar: TfrmContasPagar
  Caption = 'Conta a pagar'
  ClientHeight = 676
  ClientWidth = 1101
  ExplicitLeft = 3
  ExplicitTop = -153
  ExplicitWidth = 1113
  ExplicitHeight = 714
  TextHeight = 28
  inherited PnlPrincipal: TCardPanel
    Width = 1101
    Height = 676
    ActiveCard = CardCadastro
    ExplicitWidth = 1101
    ExplicitHeight = 776
    inherited CardCadastro: TCard
      Width = 1099
      Height = 674
      ExplicitLeft = 2
      ExplicitWidth = 1099
      ExplicitHeight = 679
      object lblValorCompra: TLabel [0]
        Left = 24
        Top = 184
        Width = 120
        Height = 28
        Caption = 'Valor Compra'
      end
      object lblDesconto: TLabel [1]
        Left = 24
        Top = 268
        Width = 83
        Height = 28
        Caption = 'Desconto'
      end
      object lblDetalhes: TLabel [2]
        Left = 24
        Top = 352
        Width = 75
        Height = 28
        Caption = 'Detalhes'
      end
      object lblDataCompra: TLabel [3]
        Left = 24
        Top = 440
        Width = 113
        Height = 28
        Caption = 'Data compra'
      end
      object lblNDocumento: TLabel [4]
        Left = 24
        Top = 94
        Width = 163
        Height = 28
        Caption = 'N'#186' Do Documento'
      end
      object lblQTDParcelas: TLabel [5]
        Left = 592
        Top = 94
        Width = 112
        Height = 28
        Caption = 'QTD Parcelas'
      end
      object lblDataVencimento: TLabel [6]
        Left = 592
        Top = 178
        Width = 259
        Height = 28
        Caption = 'Data Do Primeiro Vencimento'
      end
      inherited Panel1: TPanel
        Top = 593
        Width = 1099
        TabOrder = 2
        ExplicitLeft = -16
        ExplicitTop = 598
        ExplicitWidth = 1099
        inherited btnCancelar: TButton
          Left = 983
          TabOrder = 1
          ExplicitLeft = 798
        end
        inherited btnSalvar: TButton
          Left = 867
          TabOrder = 0
          ExplicitLeft = 682
        end
      end
      object edtValorCompra: TEdit
        Left = 24
        Top = 218
        Width = 481
        Height = 36
        TabOrder = 1
      end
      object edtDesconto: TEdit
        Tag = 2
        Left = 24
        Top = 302
        Width = 481
        Height = 36
        TabOrder = 3
      end
      object edtDetalhes: TEdit
        Tag = 3
        Left = 24
        Top = 386
        Width = 481
        Height = 36
        TabOrder = 4
      end
      object dtpDataCompra: TDateTimePicker
        Tag = 4
        Left = 24
        Top = 474
        Width = 481
        Height = 36
        Date = 45230.000000000000000000
        Time = 0.598206273149116900
        TabOrder = 6
      end
      object RadioGroup: TRadioGroup
        Left = 24
        Top = 532
        Width = 481
        Height = 125
        Caption = 'Meio'
        Items.Strings = (
          'Dinheiro'
          'Cart'#227'o de credito'
          'Cart'#227'o de debito')
        TabOrder = 5
      end
      object Panel3: TPanel
        Left = 0
        Top = 0
        Width = 1099
        Height = 72
        Align = alTop
        BevelOuter = bvNone
        TabOrder = 7
        object Panel4: TPanel
          Left = 0
          Top = 0
          Width = 505
          Height = 72
          Align = alLeft
          BevelOuter = bvNone
          Caption = 'Contas a pagar'
          TabOrder = 0
        end
        object Panel5: TPanel
          Left = 592
          Top = 0
          Width = 507
          Height = 72
          Align = alRight
          BevelOuter = bvNone
          Caption = 'Parcelas'
          TabOrder = 1
        end
      end
      object edtNDocumento: TEdit
        Left = 24
        Top = 128
        Width = 481
        Height = 36
        TabOrder = 0
      end
      object dtpDataVencimento: TDateTimePicker
        Left = 592
        Top = 212
        Width = 481
        Height = 36
        Date = 45230.000000000000000000
        Time = 0.607125462964177100
        TabOrder = 9
      end
      object cbParcelas: TComboBox
        Left = 592
        Top = 128
        Width = 481
        Height = 36
        CanUndoSelText = True
        TabOrder = 10
      end
      object Panel6: TPanel
        Left = 592
        Top = 355
        Width = 481
        Height = 67
        BevelOuter = bvNone
        TabOrder = 11
        object lblValorParcela: TLabel
          Left = 440
          Top = 0
          Width = 41
          Height = 67
          Align = alRight
          Alignment = taRightJustify
          Caption = 'R$ '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -27
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          ParentFont = False
          Layout = tlCenter
          ExplicitHeight = 37
        end
        object lblParcela: TLabel
          Left = 0
          Top = 0
          Width = 153
          Height = 67
          Align = alLeft
          Caption = 'Valor por parcela:'
          Layout = tlCenter
          ExplicitHeight = 28
        end
      end
      object Panel7: TPanel
        Left = 592
        Top = 487
        Width = 481
        Height = 53
        BevelOuter = bvNone
        TabOrder = 12
        object Label2: TLabel
          Left = 0
          Top = 0
          Width = 137
          Height = 53
          Align = alLeft
          Caption = 'Qtd de parcelas'
          Layout = tlCenter
          ExplicitHeight = 28
        end
        object lblQtdPrarcelasValor: TLabel
          Left = 474
          Top = 0
          Width = 7
          Height = 53
          Align = alRight
          Alignment = taRightJustify
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -27
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          ParentFont = False
          Layout = tlCenter
          ExplicitHeight = 37
        end
      end
      object btnGerarParcelas: TButton
        Left = 592
        Top = 268
        Width = 481
        Height = 81
        Cancel = True
        Caption = 'Gerar parcelas'
        DisabledImageName = 'btnSalvar'
        ImageAlignment = iaTop
        ImageIndex = 7
        ImageMargins.Top = 10
        Images = ImageList1
        TabOrder = 8
        OnClick = btnGerarParcelasClick
      end
      object Panel8: TPanel
        Left = 592
        Top = 428
        Width = 481
        Height = 53
        BevelOuter = bvNone
        TabOrder = 13
        object Label3: TLabel
          Left = 0
          Top = 0
          Width = 92
          Height = 53
          Align = alLeft
          Caption = 'Valor Total'
          Layout = tlCenter
          ExplicitHeight = 28
        end
        object lblValorTotal: TLabel
          Left = 440
          Top = 0
          Width = 41
          Height = 53
          Align = alRight
          Alignment = taRightJustify
          Caption = 'R$ '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -27
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          ParentFont = False
          Layout = tlCenter
          ExplicitHeight = 37
        end
      end
    end
    inherited CardPesquisa: TCard
      Width = 1099
      Height = 674
      Caption = 'p'
      ExplicitWidth = 645
      ExplicitHeight = 620
      inherited pnlPesquisa: TPanel
        Width = 1099
        ExplicitWidth = 645
        inherited btnPesquisar: TButton
          Left = 983
          ExplicitLeft = 529
        end
      end
      inherited pnlPesquisaButoes: TPanel
        Top = 585
        Width = 1099
        ExplicitTop = 531
        ExplicitWidth = 645
        inherited btnFechar: TButton
          Left = 983
          ExplicitLeft = 529
        end
      end
      inherited pnlGrid: TPanel
        Width = 665
        Height = 496
        Align = alLeft
        Padding.Top = 40
        Padding.Right = 20
        Padding.Bottom = 20
        ExplicitWidth = 665
        ExplicitHeight = 501
        inherited DBGrid1: TDBGrid
          Top = 40
          Width = 645
          Height = 200
          Align = alTop
          DataSource = dmContasPagar.DataSource1
          Columns = <
            item
              Expanded = False
              FieldName = 'numero_documento'
              Title.Caption = 'N'#186' Documento'
              Width = 161
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'valor_compra'
              Title.Caption = 'Valor Compra'
              Width = 167
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'valor_abatido'
              Title.Caption = 'Valor Abatido'
              Width = 158
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'data_compra'
              Title.Caption = 'Data Compra'
              Width = 143
              Visible = True
            end>
        end
        object DBGrid2: TDBGrid
          Left = 0
          Top = 276
          Width = 645
          Height = 200
          Align = alBottom
          DataSource = dmContasPagar.DataSource2
          TabOrder = 1
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -20
          TitleFont.Name = 'Segoe UI'
          TitleFont.Style = []
          Columns = <
            item
              Expanded = False
              FieldName = 'detalhes'
              Title.Caption = 'Detalhes'
              Width = 345
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'usuario'
              Title.Caption = 'Usu'#225'rio'
              Width = 132
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'meio'
              Title.Caption = 'Meio'
              Width = 70
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'status'
              Title.Caption = 'Status'
              Width = 83
              Visible = True
            end>
        end
        object pnlDetalhes: TPanel
          Left = 0
          Top = 240
          Width = 645
          Height = 36
          Align = alClient
          BevelOuter = bvNone
          Caption = 'Detalhes'
          Padding.Left = 10
          TabOrder = 2
          ExplicitTop = 200
          ExplicitHeight = 42
        end
      end
      object pnlParcelas: TPanel
        Left = 661
        Top = 89
        Width = 438
        Height = 496
        Align = alRight
        BevelOuter = bvNone
        Padding.Bottom = 20
        TabOrder = 3
        ExplicitHeight = 501
        object DBGrid3: TDBGrid
          Left = 0
          Top = 41
          Width = 438
          Height = 435
          Align = alClient
          DataSource = dmContasPagar.DataSource3
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -20
          TitleFont.Name = 'Segoe UI'
          TitleFont.Style = []
          Columns = <
            item
              Expanded = False
              FieldName = 'valor'
              Title.Caption = 'Valor'
              Width = 71
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'data_vencimento'
              Title.Caption = 'Data Vencimento'
              Width = 172
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'data_recebimento'
              Title.Caption = 'Data Recebimento'
              Width = 176
              Visible = True
            end>
        end
        object Panel2: TPanel
          Left = 0
          Top = 0
          Width = 438
          Height = 41
          Align = alTop
          BevelOuter = bvNone
          Caption = 'Parcelas'
          TabOrder = 1
          ExplicitLeft = 7
          ExplicitTop = -7
          ExplicitWidth = 266
        end
      end
    end
  end
  inherited ImageList1: TImageList
    Left = 977
    Top = 530
  end
  inherited DataSource1: TDataSource
    DataSet = dmContasPagar.cdsContasPagar
    Enabled = False
    Left = 977
    Top = 458
  end
  object DataSource2: TDataSource
    DataSet = dmContasPagar.cdsContasPagarDetalhe
    Left = 913
    Top = 498
  end
end
