object fInterfaceTest: TfInterfaceTest
  Left = 0
  Top = 0
  ActiveControl = se1
  BorderStyle = bsSingle
  Caption = 'Testar Interfaces'
  ClientHeight = 203
  ClientWidth = 358
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
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
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object grp1: TGroupBox
    Left = 8
    Top = 115
    Width = 342
    Height = 80
    Caption = 'USB-Serial (RS232)'
    TabOrder = 0
    object rg1: TRadioGroup
      Left = 12
      Top = 20
      Width = 237
      Height = 45
      BiDiMode = bdLeftToRight
      Caption = 'Dispensador:'
      Columns = 4
      Items.Strings = (
        'D1'
        'D2'
        'D3'
        'D4')
      ParentBiDiMode = False
      TabOrder = 0
    end
    object btn1: TButton
      Left = 255
      Top = 28
      Width = 75
      Height = 36
      Caption = 'On->Off'
      TabOrder = 1
      OnClick = btn1Click
    end
  end
  object grp2: TGroupBox
    Left = 8
    Top = 8
    Width = 342
    Height = 101
    Caption = 'Porta Paralela (LPT)'
    TabOrder = 1
    object lbt1: TLabel
      Left = 12
      Top = 22
      Width = 63
      Height = 13
      Caption = 'Dispensador:'
    end
    object btn2: TButton
      Left = 174
      Top = 36
      Width = 75
      Height = 34
      Caption = 'On->Off'
      TabOrder = 0
      OnClick = btn2Click
    end
    object btn3: TButton
      Left = 255
      Top = 12
      Width = 75
      Height = 36
      Caption = 'On'
      Enabled = False
      TabOrder = 1
      OnClick = btn2Click
    end
    object btn4: TButton
      Left = 255
      Top = 54
      Width = 75
      Height = 36
      Caption = 'Off'
      Enabled = False
      TabOrder = 2
      OnClick = btn2Click
    end
    object se1: TSpinEdit
      Left = 80
      Top = 19
      Width = 88
      Height = 22
      MaxValue = 255
      MinValue = 0
      TabOrder = 3
      Value = 0
    end
    object rg2: TRadioGroup
      Left = 12
      Top = 47
      Width = 156
      Height = 43
      Caption = 'On->Off'
      Columns = 2
      ItemIndex = 0
      Items.Strings = (
        'True'
        'False')
      TabOrder = 4
      OnClick = rg2Click
    end
  end
end
