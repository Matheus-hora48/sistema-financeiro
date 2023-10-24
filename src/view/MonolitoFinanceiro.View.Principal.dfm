object frmPrincipal: TfrmPrincipal
  Left = 0
  Top = 0
  Caption = 'Monolito Financeiro'
  ClientHeight = 442
  ClientWidth = 628
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Menu = MainMenu1
  Position = poScreenCenter
  WindowState = wsMaximized
  OnCreate = FormCreate
  TextHeight = 15
  object MainMenu1: TMainMenu
    Left = 328
    Top = 184
    object mnuCadastros: TMenuItem
      Caption = 'Cadastros'
      Hint = 'Cadastro do sistema'
      object nmuCadastroPadrao: TMenuItem
        Caption = 'Usu'#225'rios'
        OnClick = nmuUsuariosClick
      end
    end
    object mnuRelatorios: TMenuItem
      Caption = 'Relat'#243'rios'
      Hint = 'Relat'#243'rios do sistema'
    end
    object nmuAjuda: TMenuItem
      Caption = 'Ajuda'
      Hint = 'Ajuda do sistema'
    end
  end
end
