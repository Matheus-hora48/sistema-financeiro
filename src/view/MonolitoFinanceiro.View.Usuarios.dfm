inherited frmUsuarios: TfrmUsuarios
  Caption = 'Cadastro Usu'#225'rios'
  TextHeight = 28
  inherited PnlPrincipal: TCardPanel
    inherited CardCadastro: TCard
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
      object lblStatus: TLabel [2]
        Left = 17
        Top = 121
        Width = 53
        Height = 28
        Caption = 'Status'
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
      object ToggleStatus: TToggleSwitch
        Left = 103
        Top = 121
        Width = 151
        Height = 30
        StateCaptions.CaptionOn = 'Ativo'
        StateCaptions.CaptionOff = 'Bloqueado'
        TabOrder = 3
        ThumbColor = clHotLight
      end
    end
    inherited CardPesquisa: TCard
      inherited pnlGrid: TPanel
        inherited DBGrid1: TDBGrid
          PopupMenu = PopupMenu1
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
    Left = 569
    Top = 330
  end
  object PopupMenu1: TPopupMenu [2]
    Left = 625
    Top = 274
    object mnuLimparSenha: TMenuItem
      Caption = 'Limpar Senha'
      OnClick = mnuLimparSenhaClick
    end
  end
  inherited DataSource1: TDataSource
    DataSet = dmUsuarios.cdsUsuarios
    Left = 697
    Top = 322
  end
end
