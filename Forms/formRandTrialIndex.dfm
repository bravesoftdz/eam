object fRandTrialIndex: TfRandTrialIndex
  Left = 0
  Top = 0
  ActiveControl = btnRand
  Caption = 'Aleatorizar Ordem das Tentativas'
  ClientHeight = 353
  ClientWidth = 729
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
  OnDestroy = FormDestroy
  OnMouseWheelDown = FormMouseWheelDown
  OnMouseWheelUp = FormMouseWheelUp
  DesignSize = (
    729
    353)
  PixelsPerInch = 96
  TextHeight = 13
  object btnRand: TButton
    Left = 8
    Top = 8
    Width = 64
    Height = 25
    Caption = 'Aleatorizar'
    TabOrder = 0
    OnClick = btnRandClick
  end
  object btnApp: TButton
    Left = 8
    Top = 39
    Width = 64
    Height = 25
    Caption = 'Aplicar'
    TabOrder = 1
    OnClick = btnAppClick
  end
  object strngrd1: TStringGrid
    Left = 8
    Top = 70
    Width = 713
    Height = 275
    Anchors = [akLeft, akTop, akRight, akBottom]
    Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goRowMoving, goRowSelect, goFixedColClick]
    ParentShowHint = False
    ShowHint = True
    TabOrder = 2
    OnDrawCell = strngrd1DrawCell
    ColWidths = (
      64
      64
      64
      64
      64)
    RowHeights = (
      24
      24
      24
      24
      24)
  end
  object rgConditionalFormat: TRadioGroup
    Left = 248
    Top = 8
    Width = 162
    Height = 56
    Hint = 'Revisar par'#226'metros com realces (Em desenvolvimento.) '
    Caption = 'Real'#231'ar'
    Columns = 2
    Items.Strings = (
      'Nomes'
      'HIT em C1'
      'MISS em C1')
    ParentShowHint = False
    ShowHint = True
    TabOrder = 3
    OnClick = rgConditionalFormatClick
  end
  object clbTrialNames: TCheckListBox
    Left = 416
    Top = 8
    Width = 137
    Height = 56
    OnClickCheck = clbTrialNamesClickCheck
    ItemHeight = 13
    Sorted = True
    TabOrder = 4
    Visible = False
  end
  object pnlFormatColor: TPanel
    Left = 183
    Top = 8
    Width = 59
    Height = 56
    ParentCustomHint = False
    Caption = 'Cor'
    Ctl3D = True
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentBackground = False
    ParentCtl3D = False
    ParentFont = False
    ParentShowHint = False
    ShowHint = False
    TabOrder = 5
    OnDblClick = pnlFormatColorDblClick
  end
  object chkShortNames: TCheckBox
    Left = 78
    Top = 8
    Width = 99
    Height = 17
    Caption = 'Abreviar Nomes'
    Checked = True
    State = cbChecked
    TabOrder = 6
  end
  object chkCellEditing: TCheckBox
    Left = 78
    Top = 31
    Width = 97
    Height = 17
    Caption = 'Manter Realce'
    Checked = True
    State = cbChecked
    TabOrder = 7
  end
  object pmRand: TPopupMenu
    Left = 656
    Top = 256
    object pRand: TMenuItem
      Caption = 'Random'
      Checked = True
    end
    object pSpan: TMenuItem
      Caption = 'Span'
    end
  end
  object dlgColor1: TColorDialog
    Options = [cdAnyColor]
    Left = 584
    Top = 216
  end
end
