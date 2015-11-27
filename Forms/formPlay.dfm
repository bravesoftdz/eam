object fPlay: TfPlay
  Left = 223
  Top = 178
  ActiveControl = BitBtn1
  BorderStyle = bsNone
  Caption = 'fPlay'
  ClientHeight = 199
  ClientWidth = 396
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 20
    Width = 35
    Height = 13
    Caption = 'Sujeito:'
  end
  object Label2: TLabel
    Left = 8
    Top = 54
    Width = 38
    Height = 13
    Caption = 'Sess'#227'o:'
  end
  object Label3: TLabel
    Left = 8
    Top = 87
    Width = 88
    Height = 13
    Caption = 'Arquivo de Dados:'
  end
  object lblCounterString: TLabel
    Left = 8
    Top = 112
    Width = 85
    Height = 13
    Caption = 'Estilo do contador'
    Enabled = False
  end
  object BitBtn2: TBitBtn
    Left = 224
    Top = 162
    Width = 75
    Height = 25
    Kind = bkCancel
    NumGlyphs = 2
    TabOrder = 4
  end
  object Edit1: TEdit
    Left = 48
    Top = 17
    Width = 340
    Height = 21
    TabOrder = 0
  end
  object Edit2: TEdit
    Left = 49
    Top = 51
    Width = 339
    Height = 21
    TabOrder = 1
  end
  object Edit3: TEdit
    Left = 100
    Top = 84
    Width = 288
    Height = 21
    TabStop = False
    TabOrder = 2
    Text = 'Dados_001.txt'
  end
  object CheckBox1: TCheckBox
    Left = 24
    Top = 138
    Width = 103
    Height = 17
    Caption = 'Modo de Teste'
    TabOrder = 3
  end
  object chkFeedBack: TCheckBox
    Left = 151
    Top = 138
    Width = 113
    Height = 17
    Caption = 'Criar janela auxiliar'
    TabOrder = 5
  end
  object BitBtn1: TBitBtn
    Left = 100
    Top = 162
    Width = 75
    Height = 25
    Caption = 'OK'
    Default = True
    Glyph.Data = {
      DE010000424DDE01000000000000760000002800000024000000120000000100
      0400000000006801000000000000000000001000000000000000000000000000
      80000080000000808000800000008000800080800000C0C0C000808080000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
      3333333333333333333333330000333333333333333333333333F33333333333
      00003333344333333333333333388F3333333333000033334224333333333333
      338338F3333333330000333422224333333333333833338F3333333300003342
      222224333333333383333338F3333333000034222A22224333333338F338F333
      8F33333300003222A3A2224333333338F3838F338F33333300003A2A333A2224
      33333338F83338F338F33333000033A33333A222433333338333338F338F3333
      0000333333333A222433333333333338F338F33300003333333333A222433333
      333333338F338F33000033333333333A222433333333333338F338F300003333
      33333333A222433333333333338F338F00003333333333333A22433333333333
      3338F38F000033333333333333A223333333333333338F830000333333333333
      333A333333333333333338330000333333333333333333333333333333333333
      0000}
    ModalResult = 1
    NumGlyphs = 2
    TabOrder = 6
  end
  object chkCounter: TCheckBox
    Left = 288
    Top = 138
    Width = 97
    Height = 17
    Caption = 'Contador'
    TabOrder = 7
    OnClick = chkCounterClick
  end
  object edtCounterString: TEdit
    Left = 100
    Top = 109
    Width = 288
    Height = 21
    TabStop = False
    Enabled = False
    TabOrder = 8
    Text = 'HIT'
  end
end
