inherited frmUsuarios: TfrmUsuarios
  Caption = 'Cadastro Usu'#225'rios'
  ClientWidth = 758
  TextHeight = 28
  inherited PnlPrincipal: TCardPanel
    Width = 758
    ExplicitWidth = 752
    inherited CardCadastro: TCard
      Height = 502
      ExplicitLeft = 1
      ExplicitTop = 1
      ExplicitWidth = 756
      ExplicitHeight = 502
      inherited Panel1: TPanel
        Top = 421
        ExplicitTop = 421
        inherited btnSalvar: TButton
          ExplicitLeft = 524
        end
      end
    end
    inherited CardPesquisa: TCard
      Height = 502
      ExplicitHeight = 502
      inherited pnlPesquisa: TPanel
        inherited btnPesquisar: TButton
          OnClick = btnPesquisarClick
        end
      end
      inherited pnlPesquisaButoes: TPanel
        Top = 413
        ExplicitTop = 413
      end
      inherited pnlGrid: TPanel
        Height = 324
        ExplicitHeight = 324
        inherited DBGrid1: TDBGrid
          Height = 324
          DataSource = DataSource1
        end
      end
    end
  end
  inherited ImageList1: TImageList
    Left = 577
    Top = 354
  end
  object DataSource1: TDataSource
    DataSet = dmConexao.FDQuery1
    Left = 657
    Top = 354
  end
end