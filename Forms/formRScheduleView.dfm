object fRScheduleView: TfRScheduleView
  Left = 0
  Top = 0
  Caption = 'Esquemas de Refor'#231'amento'
  ClientHeight = 269
  ClientWidth = 589
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
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  DesignSize = (
    589
    269)
  PixelsPerInch = 96
  TextHeight = 13
  object Edit1: TEdit
    Left = 8
    Top = 111
    Width = 65
    Height = 21
    TabOrder = 0
  end
  object ListBox1: TListBox
    Left = 143
    Top = 8
    Width = 58
    Height = 95
    IntegralHeight = True
    ItemHeight = 13
    Items.Strings = (
      'CRF'
      'DRH'
      'DRL'
      'EXT'
      'FI'
      'FR'
      'FT'
      'VI'
      'VR'
      'VT'
      'FRFT'
      'FRVT'
      'VRFT'
      'VRVT')
    TabOrder = 1
    OnClick = ListBox1Click
  end
  object btnTest: TButton
    Left = 79
    Top = 108
    Width = 58
    Height = 27
    Caption = 'Testar'
    TabOrder = 2
    OnClick = btnTestClick
  end
  object GroupBox1: TGroupBox
    Left = 8
    Top = 8
    Width = 129
    Height = 97
    Caption = #193'rea de Teste'
    TabOrder = 3
  end
  object Panel1: TPanel
    Left = 214
    Top = 8
    Width = 359
    Height = 253
    Anchors = [akLeft, akTop, akRight, akBottom]
    BevelOuter = bvLowered
    BorderStyle = bsSingle
    Color = clTeal
    ParentBackground = False
    TabOrder = 4
    OnResize = Panel1Resize
  end
  object Button1: TButton
    Left = 143
    Top = 108
    Width = 58
    Height = 27
    Caption = 'Ajuda'
    TabOrder = 5
    OnClick = Button1Click
  end
  object GroupBox2: TGroupBox
    Left = 8
    Top = 138
    Width = 57
    Height = 57
    Caption = 'Contador'
    TabOrder = 6
    object Label1: TLabel
      Left = 24
      Top = 23
      Width = 7
      Height = 16
      Caption = '0'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
  end
  object GroupBox3: TGroupBox
    Left = 71
    Top = 201
    Width = 57
    Height = 57
    Hint = 'Tempo entre a primeira e '#250'ltima resposta.'
    Caption = 'Dura'#231#227'o'
    ParentShowHint = False
    ShowHint = True
    TabOrder = 7
    object lblDuration: TLabel
      Left = 13
      Top = 21
      Width = 7
      Height = 16
      Caption = '0'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
  end
  object GroupBox4: TGroupBox
    Left = 134
    Top = 201
    Width = 57
    Height = 57
    Hint = 'Lat'#234'ncia + Dura'#231#227'o'
    Caption = 'Total'
    TabOrder = 8
    object lblTotal: TLabel
      Left = 10
      Top = 21
      Width = 7
      Height = 16
      Caption = '0'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
  end
  object GroupBox5: TGroupBox
    Left = 8
    Top = 201
    Width = 57
    Height = 57
    Hint = 'Tempo entre o in'#237'cio do contador e a primeira resposta.'
    Caption = 'Lat'#234'ncia'
    TabOrder = 9
    object lblLatency: TLabel
      Left = 13
      Top = 21
      Width = 7
      Height = 16
      Caption = '0'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
  end
  object GroupBox6: TGroupBox
    Left = 71
    Top = 141
    Width = 120
    Height = 54
    Caption = 'Intervalo'
    TabOrder = 10
    object Label2: TLabel
      Left = 83
      Top = 20
      Width = 17
      Height = 16
      Caption = 'ms'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object SpinEdit1: TSpinEdit
      Left = 15
      Top = 18
      Width = 57
      Height = 22
      MaxValue = 1000
      MinValue = 1
      TabOrder = 0
      Value = 1000
      OnKeyDown = SpinEdit1KeyDown
    end
  end
  object Timer: TTimer
    Interval = 100
    OnTimer = TimerTimer
    Left = 104
    Top = 24
  end
end
