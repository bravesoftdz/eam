object fShowCursor: TfShowCursor
  Left = 0
  Top = 0
  ActiveControl = se1
  BorderStyle = bsToolWindow
  Caption = 'Descubra o curso'
  ClientHeight = 157
  ClientWidth = 160
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
  Visible = True
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object lbl1: TLabel
    Left = 8
    Top = 8
    Width = 78
    Height = 13
    Caption = 'Valor do Cursor:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Orientation = 1
    Font.Style = []
    ParentFont = False
  end
  object grp1: TGroupBox
    Left = 8
    Top = 33
    Width = 144
    Height = 113
    Cursor = 2
    Caption = 'Passe o mouse nesta '#225'rea'
    TabOrder = 0
  end
  object se1: TSpinEdit
    Left = 92
    Top = 5
    Width = 60
    Height = 22
    MaxValue = 2
    MinValue = -30
    TabOrder = 1
    Value = 0
    OnChange = se1Change
  end
end
