object fTools: TfTools
  Left = 0
  Top = 0
  ActiveControl = btnNewSession
  BorderStyle = bsSingle
  Caption = 'Ferramentas'
  ClientHeight = 224
  ClientWidth = 313
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  FormStyle = fsMDIChild
  Icon.Data = {
    0000010001001010100000000000280100001600000028000000100000002000
    00000100040000000000C0000000000000000000000000000000000000000000
    0000000080000080000000808000800000008000800080800000C0C0C0008080
    80000000FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF000000
    00AAA000FF000000000AA00F00F0000000A0A00F000000000A00E00F00F00000
    0E0E0000FF0000000EE0000A00A0F00F0EEE000A0AAAF00F0000000A00A0FFFF
    0EEE000A00A0F00F0EE000AAA0A00FF00E0E000A00A000000000E00FFF000000
    0A00000F00F0000000A0A00FFF000000000AA00F00F0000000AAA00FFF00FC73
    0000FE6D0000FD6F0000FB6D0000FAF30000F9ED000068E800006FED000008ED
    000069C500009AED0000FF630000FBED0000FD630000FE6D0000FC630000}
  OldCreateOrder = False
  Visible = True
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnMouseEnter = FormMouseEnter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object grpMain: TGroupBox
    Left = 8
    Top = 102
    Width = 297
    Height = 114
    Caption = 'Controle de Exibi'#231#227'o'
    ParentShowHint = False
    ShowHint = True
    TabOrder = 1
    object grpBlc: TGroupBox
      Left = 3
      Top = 12
      Width = 291
      Height = 98
      Caption = 'Bloco'
      TabOrder = 0
      object grpTrial: TGroupBox
        Left = 64
        Top = 11
        Width = 224
        Height = 83
        Caption = 'Tentativa'
        TabOrder = 1
        object seTrial: TSpinEdit
          Left = 3
          Top = 24
          Width = 57
          Height = 29
          Color = clWhite
          EditorEnabled = False
          Enabled = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          MaxValue = 0
          MinValue = 0
          ParentFont = False
          TabOrder = 0
          Value = 0
          OnChange = seTrialChange
        end
        object grpStm: TGroupBox
          Left = 66
          Top = 9
          Width = 155
          Height = 47
          Caption = 'Compara'#231#227'o'
          TabOrder = 1
          object edtStimulus: TEdit
            Left = 3
            Top = 15
            Width = 149
            Height = 27
            BevelInner = bvNone
            BevelOuter = bvNone
            Color = clWhite
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -16
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
            ParentShowHint = False
            ShowHint = True
            TabOrder = 0
            TextHint = 'Vazio'
            OnKeyPress = edtStimulusKeyPress
          end
        end
      end
      object seBlc: TSpinEdit
        Left = 4
        Top = 35
        Width = 55
        Height = 29
        Color = clWhite
        Ctl3D = True
        EditorEnabled = False
        Enabled = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -16
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        MaxValue = 0
        MinValue = 0
        ParentCtl3D = False
        ParentFont = False
        TabOrder = 0
        Value = 0
        OnChange = seBlcChange
      end
    end
  end
  object btnNewSession: TButton
    Left = 8
    Top = 8
    Width = 127
    Height = 25
    Hint = 
      'Iniciar o processo de cria'#231#227'o de  um novo arquivo de configura'#231#227 +
      'o.'
    Caption = 'Nova Sess'#227'o'
    ParentShowHint = False
    ShowHint = True
    TabOrder = 0
    OnClick = btnNewSessionClick
  end
  object btnGerarPosicoes: TButton
    Left = 8
    Top = 37
    Width = 127
    Height = 25
    Hint = 
      'Gerar uma matriz de posi'#231#245'es na tela para a apresenta'#231#227'o dos est' +
      #237'mulos ao longo da sess'#227'o.'
    Caption = 'Gerar Posi'#231#245'es'
    Enabled = False
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
    TabOrder = 2
    OnClick = btnGerarPosicoesClick
  end
end
