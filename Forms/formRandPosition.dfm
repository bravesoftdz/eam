object fRandPosition: TfRandPosition
  Left = 0
  Top = 0
  Width = 823
  Height = 256
  ActiveControl = btnRand
  AutoScroll = True
  Caption = 'Aleatorizar posi'#231#245'es'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  FormStyle = fsStayOnTop
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
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object lbl2: TLabel
    Left = 358
    Top = 13
    Width = 33
    Height = 13
    Caption = 'e Pular'
  end
  object lbl3: TLabel
    Left = 218
    Top = 13
    Width = 52
    Height = 13
    Caption = 'Aleatorizar'
  end
  object Label1: TLabel
    Left = 218
    Top = 41
    Width = 57
    Height = 13
    Caption = 'Come'#231'ar na'
  end
  object Label2: TLabel
    Left = 347
    Top = 41
    Width = 57
    Height = 13
    Caption = 'Terminar na'
  end
  object lbLine: TLabel
    Left = 479
    Top = 13
    Width = 31
    Height = 13
    Caption = 'linhas.'
  end
  object lblNumPos: TLabel
    Left = 78
    Top = 44
    Width = 60
    Height = 13
    Caption = 'N'#186' Posi'#231#245'es:'
  end
  object lblTrial: TLabel
    Left = 479
    Top = 41
    Width = 48
    Height = 13
    Caption = 'tentativa.'
  end
  object btnApp: TButton
    Left = 8
    Top = 39
    Width = 64
    Height = 25
    Caption = 'Aplicar'
    PopupMenu = pmApp
    TabOrder = 0
    OnClick = btnAppClick
  end
  object btnImport: TButton
    Left = 78
    Top = 8
    Width = 64
    Height = 25
    Caption = 'Importar'
    TabOrder = 1
  end
  object seGap: TSpinEdit
    Left = 412
    Top = 10
    Width = 56
    Height = 22
    Hint = 'Valor salto'
    MaxValue = 0
    MinValue = 0
    ParentShowHint = False
    ShowHint = True
    TabOrder = 2
    Value = 0
    OnChange = seGapChange
    OnKeyPress = seGapKeyPress
  end
  object btnExport: TButton
    Left = 148
    Top = 8
    Width = 64
    Height = 25
    Caption = 'Exportar'
    TabOrder = 3
  end
  object seSeqToWrite: TSpinEdit
    Left = 285
    Top = 10
    Width = 56
    Height = 22
    Hint = 'Valor n.'
    MaxValue = 0
    MinValue = 0
    ParentShowHint = False
    ShowHint = True
    TabOrder = 4
    Value = 0
    OnKeyPress = seGapKeyPress
  end
  object btnRand: TButton
    Left = 8
    Top = 8
    Width = 64
    Height = 25
    Hint = 'CLIQUE BOT'#195'O DIREITO para selecionar o tipo.'
    Caption = 'Aleatorizar'
    ParentShowHint = False
    PopupMenu = pmRand
    ShowHint = True
    TabOrder = 5
    OnClick = btnRandClick
  end
  object chkAllDifferent: TCheckBox
    Left = 536
    Top = 12
    Width = 133
    Height = 17
    Hint = 'Marque se quiser n sequ'#234'ncias diferentes ao aleatorizar. '
    Caption = 'Sequ'#234'ncias diferentes'
    ParentShowHint = False
    ShowHint = True
    TabOrder = 6
    OnClick = chkAllDifferentClick
  end
  object seBeginAt: TSpinEdit
    Left = 285
    Top = 38
    Width = 56
    Height = 22
    Hint = 'Primeira tentativa.'
    MaxValue = 0
    MinValue = 0
    ParentShowHint = False
    ShowHint = True
    TabOrder = 7
    Value = 0
    OnKeyPress = seGapKeyPress
  end
  object seEndAt: TSpinEdit
    Left = 412
    Top = 38
    Width = 56
    Height = 22
    Hint = #218'ltima tentativa.'
    MaxValue = 0
    MinValue = 0
    ParentShowHint = False
    ShowHint = True
    TabOrder = 8
    Value = 0
    OnChange = seGapChange
    OnKeyPress = seGapKeyPress
  end
  object pnlNumPos: TPanel
    Left = 148
    Top = 39
    Width = 64
    Height = 25
    BevelOuter = bvLowered
    TabOrder = 9
  end
  object pmApp: TPopupMenu
    OnPopup = pmRandPopup
    Left = 344
    Top = 112
    object N1: TMenuItem
      Caption = '-'
      Enabled = False
    end
    object appBlocoUnd: TMenuItem
      Caption = 'ao bloco sublinhado'
      Checked = True
    end
    object N2: TMenuItem
      Caption = '-'
    end
  end
  object pmRand: TPopupMenu
    OnPopup = pmRandPopup
    Left = 416
    Top = 112
    object pRand: TMenuItem
      Caption = 'Random'
      Checked = True
      OnClick = pRandClick
    end
    object pSpan: TMenuItem
      Caption = 'Span'
      OnClick = pRandClick
    end
    object pBalanced: TMenuItem
      Caption = 'Balanceado'
      OnClick = pRandClick
    end
  end
end
