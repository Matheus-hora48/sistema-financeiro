object frmRedefinirSenha: TfrmRedefinirSenha
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Redefinir Senha'
  ClientHeight = 442
  ClientWidth = 832
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -20
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poScreenCenter
  OnShow = FormShow
  TextHeight = 28
  object pnlPrincipal: TPanel
    Left = 0
    Top = 0
    Width = 832
    Height = 442
    Align = alClient
    TabOrder = 0
    ExplicitLeft = -104
    ExplicitWidth = 732
    object Panel1: TPanel
      Left = 1
      Top = 1
      Width = 830
      Height = 152
      Margins.Top = 30
      Align = alTop
      Alignment = taLeftJustify
      BevelOuter = bvNone
      Padding.Top = 30
      TabOrder = 0
      ExplicitWidth = 730
      object lblNameAplicacao: TLabel
        Left = 0
        Top = 92
        Width = 830
        Height = 37
        Align = alTop
        Alignment = taCenter
        Caption = 'Informe sua nova senha'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clMenuText
        Font.Height = -27
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        ExplicitWidth = 280
      end
      object lblUsuario: TLabel
        Left = 0
        Top = 30
        Width = 830
        Height = 62
        Align = alTop
        Alignment = taCenter
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clHighlight
        Font.Height = -47
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        ExplicitWidth = 13
      end
    end
    object Panel2: TPanel
      Left = 1
      Top = 153
      Width = 830
      Height = 288
      Align = alClient
      BevelOuter = bvNone
      Padding.Left = 60
      Padding.Right = 60
      TabOrder = 1
      ExplicitWidth = 730
      object Panel3: TPanel
        Left = 60
        Top = 81
        Width = 710
        Height = 112
        Margins.Top = 30
        Align = alTop
        Alignment = taLeftJustify
        BevelOuter = bvNone
        TabOrder = 0
        object lblConfirmarSenha: TLabel
          Left = 0
          Top = 0
          Width = 710
          Height = 28
          Align = alTop
          Caption = 'Confirme sua senha'
          ExplicitWidth = 169
        end
        object edtConfirmarSenha: TEdit
          Left = 0
          Top = 28
          Width = 710
          Height = 36
          Align = alTop
          ImeName = 'Portuguese (Brazilian ABNT)'
          PasswordChar = '*'
          TabOrder = 0
        end
      end
      object Panel4: TPanel
        Left = 60
        Top = 0
        Width = 710
        Height = 81
        Margins.Top = 30
        Align = alTop
        Alignment = taLeftJustify
        BevelOuter = bvNone
        TabOrder = 1
        object lblSenha: TLabel
          Left = 0
          Top = 0
          Width = 710
          Height = 28
          Align = alTop
          Caption = 'Senha'
          ExplicitTop = 6
        end
        object edtSenha: TEdit
          Left = 0
          Top = 28
          Width = 710
          Height = 36
          Align = alTop
          PasswordChar = '*'
          TabOrder = 0
        end
      end
      object Panel5: TPanel
        Left = 60
        Top = 193
        Width = 710
        Height = 64
        Align = alTop
        BevelOuter = bvNone
        TabOrder = 2
        ExplicitTop = 169
        object btnConfirmar: TButton
          Left = 544
          Top = 0
          Width = 166
          Height = 64
          Align = alRight
          Caption = 'Confirmar'
          TabOrder = 0
          OnClick = btnConfirmarClick
          ExplicitHeight = 48
        end
        object Button1: TButton
          Left = 0
          Top = 0
          Width = 166
          Height = 64
          Align = alLeft
          Caption = 'Cancelar'
          TabOrder = 1
          OnClick = Button1Click
        end
      end
    end
  end
end
