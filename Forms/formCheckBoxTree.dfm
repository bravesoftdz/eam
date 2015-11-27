object fCheckBoxTree: TfCheckBoxTree
  Left = 0
  Top = 0
  Width = 311
  Height = 299
  ActiveControl = grpChk
  AutoScroll = True
  Caption = 'Estrutura da sess'#227'o'
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
  ShowHint = True
  Visible = True
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnMouseEnter = FormMouseEnter
  OnMouseWheelDown = FormMouseWheelDown
  OnMouseWheelUp = FormMouseWheelUp
  PixelsPerInch = 96
  TextHeight = 13
  object Label3: TLabel
    Left = 182
    Top = 13
    Width = 33
    Height = 13
    Caption = 'e Pular'
  end
  object Label1: TLabel
    Left = 8
    Top = 40
    Width = 95
    Height = 13
    Caption = 'Come'#231'ar a partir de'
  end
  object Label2: TLabel
    Left = 161
    Top = 40
    Width = 66
    Height = 13
    Caption = 'e terminar em'
  end
  object grpBlocos: TGroupBox
    Left = 8
    Top = 104
    Width = 85
    Height = 126
    Hint = 'Clique + TECLA CTRL para selecionar (sublinhar).'
    Caption = 'Blocos'
    TabOrder = 0
  end
  object grpTrial: TGroupBox
    Left = 99
    Top = 104
    Width = 85
    Height = 126
    Hint = 'Clique + TECLA CTRL para selecionar (sublinhar).'
    Caption = 'Tentativas'
    TabOrder = 1
  end
  object grpStm: TGroupBox
    Left = 190
    Top = 104
    Width = 85
    Height = 126
    Hint = 'Clique + TECLA CTRL para selecionar (sublinhar).'
    Caption = 'Est'#237'mulos'
    TabOrder = 2
  end
  object grpChk: TGroupBox
    Left = 8
    Top = 59
    Width = 267
    Height = 42
    Hint = 'Selecione o conjunto alvo do "Marcar / Desmarcar".'
    TabOrder = 3
    OnClick = grpChkClick
    object rbStm: TRadioButton
      Tag = 2
      Left = 170
      Top = 12
      Width = 73
      Height = 17
      Caption = 'Est'#237'mulos'
      TabOrder = 2
    end
    object rbTrial: TRadioButton
      Tag = 1
      Left = 91
      Top = 12
      Width = 73
      Height = 17
      Caption = 'Tentativas'
      TabOrder = 1
    end
    object rbBlc: TRadioButton
      Left = 12
      Top = 12
      Width = 73
      Height = 17
      Caption = 'Blocos'
      Checked = True
      TabOrder = 0
      TabStop = True
    end
  end
  object chkBox1: TCheckBox
    Left = 8
    Top = 12
    Width = 113
    Height = 17
    Hint = 
      'Selecione o conjunto alvo (Blocos, Tentativas, Est'#237'mulos) abaixo' +
      '.'
    Caption = 'Marcar / Desmarcar'
    TabOrder = 4
    OnClick = chkBox1Click
  end
  object seN: TSpinEdit
    Left = 128
    Top = 10
    Width = 44
    Height = 22
    MaxValue = 10000
    MinValue = 1
    TabOrder = 5
    Value = 1
    OnKeyPress = seNKeyPress
  end
  object seGap: TSpinEdit
    Left = 231
    Top = 10
    Width = 44
    Height = 22
    MaxValue = 9999
    MinValue = 0
    TabOrder = 6
    Value = 0
    OnKeyPress = seNKeyPress
  end
  object seBeginAt: TSpinEdit
    Left = 112
    Top = 37
    Width = 44
    Height = 22
    MaxValue = 10000
    MinValue = 1
    TabOrder = 7
    Value = 1
    OnKeyPress = seNKeyPress
  end
  object seEndAt: TSpinEdit
    Left = 231
    Top = 37
    Width = 44
    Height = 22
    Hint = 'DUPLO CLIQUE para o m'#225'ximo.'
    MaxValue = 10000
    MinValue = 1
    TabOrder = 8
    Value = 1
    OnDblClick = seEndAtDblClick
    OnKeyPress = seNKeyPress
  end
end
