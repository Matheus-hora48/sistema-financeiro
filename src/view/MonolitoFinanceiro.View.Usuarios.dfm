inherited frmUsuarios: TfrmUsuarios
  Caption = 'Cadastro Usu'#225'rios'
  ExplicitLeft = 3
  ExplicitTop = 3
  TextHeight = 28
  inherited PnlPrincipal: TCardPanel
    inherited CardCadastro: TCard
      ExplicitLeft = 2
      object lblName: TLabel [0]
        Left = 16
        Top = 40
        Width = 54
        Height = 28
        Caption = 'Nome'
      end
      object lblLogin: TLabel [1]
        Left = 16
        Top = 82
        Width = 49
        Height = 28
        Caption = 'Login'
      end
      object lblSenha: TLabel [2]
        Left = 16
        Top = 124
        Width = 53
        Height = 28
        Caption = 'Senha'
      end
      object lblStatus: TLabel [3]
        Left = 17
        Top = 158
        Width = 53
        Height = 28
        Caption = 'Status'
      end
      inherited Panel1: TPanel
        inherited btnSalvar: TButton
          OnClick = btnSalvarClick
          ExplicitLeft = 518
        end
      end
      object edtNome: TEdit
        Left = 103
        Top = 37
        Width = 378
        Height = 36
        TabOrder = 1
      end
      object edtLogin: TEdit
        Left = 103
        Top = 79
        Width = 378
        Height = 36
        TabOrder = 2
      end
      object edtSenha: TEdit
        Left = 103
        Top = 121
        Width = 378
        Height = 36
        TabOrder = 3
      end
      object ToggleStatus: TToggleSwitch
        Left = 103
        Top = 163
        Width = 178
        Height = 30
        StateCaptions.CaptionOn = 'Ativo'
        StateCaptions.CaptionOff = 'Bloqueado'
        TabOrder = 4
        ThumbColor = clHotLight
      end
    end
    inherited CardPesquisa: TCard
      inherited pnlPesquisa: TPanel
        inherited btnPesquisar: TButton
          OnClick = btnPesquisarClick
        end
      end
      inherited pnlPesquisaButoes: TPanel
        inherited btnExcluir: TButton
          OnClick = btnExcluirClick
        end
      end
      inherited pnlGrid: TPanel
        inherited DBGrid1: TDBGrid
          DataSource = DataSource1
          Columns = <
            item
              Expanded = False
              FieldName = 'nome'
              Title.Caption = 'Nome'
              Width = 347
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'login'
              Title.Caption = 'Login'
              Width = 328
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'status'
              Title.Caption = 'Status'
              Visible = True
            end>
        end
      end
    end
  end
  inherited ImageList1: TImageList
    Left = 577
    Top = 354
  end
  object DataSource1: TDataSource
    DataSet = dmUsuarios.cdsUsuarios
    Left = 657
    Top = 354
  end
end
