object frmPrincipal: TfrmPrincipal
  Left = 0
  Top = 0
  Caption = 'Monolito Financeiro'
  ClientHeight = 429
  ClientWidth = 633
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
  object StatusBar1: TStatusBar
    Left = 0
    Top = 410
    Width = 633
    Height = 19
    Panels = <
      item
        Width = 150
      end
      item
        Width = 300
      end>
    ExplicitTop = 401
    ExplicitWidth = 627
  end
  object MainMenu1: TMainMenu
    Left = 528
    Top = 288
    object mnuCadastros: TMenuItem
      Caption = 'Cadastros'
      Hint = 'Cadastro do sistema'
      object nmuCadastroPadrao: TMenuItem
        Caption = 'Usu'#225'rios'
        OnClick = nmuUsuariosClick
      end
    end
    object Financeiro1: TMenuItem
      Caption = 'Financeiro'
      object Caixa1: TMenuItem
        Caption = 'Caixa'
        OnClick = Caixa1Click
      end
    end
    object mnuRelatorios: TMenuItem
      Caption = 'Relat'#243'rios'
      Hint = 'Relat'#243'rios do sistema'
      object ResumoCaixa1: TMenuItem
        Caption = 'Resumo Caixa'
        ImageName = 'mnuResumoCaixa'
        OnClick = ResumoCaixa1Click
      end
    end
    object nmuAjuda: TMenuItem
      Caption = 'Ajuda'
      Hint = 'Ajuda do sistema'
    end
  end
  object Timer1: TTimer
    OnTimer = Timer1Timer
    Left = 408
    Top = 288
  end
end
