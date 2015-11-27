object fPositionGetter: TfPositionGetter
  Left = 396
  Top = 285
  ActiveControl = btnMostrarMatriz
  AlphaBlend = True
  AlphaBlendValue = 100
  BorderIcons = []
  BorderStyle = bsSingle
  Caption = 'Gerar Posi'#231#245'es'
  ClientHeight = 244
  ClientWidth = 362
  Color = clBtnFace
  DockSite = True
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  FormStyle = fsStayOnTop
  OldCreateOrder = False
  Position = poScreenCenter
  Visible = True
  OnClose = FormClose
  OnCreate = FormCreate
  OnKeyDown = FormKeyDown
  OnKeyUp = FormKeyUp
  PixelsPerInch = 96
  TextHeight = 13
  object btnRetornar: TButton
    Left = 201
    Top = 217
    Width = 70
    Height = 20
    Hint = 'Retornar'
    Cancel = True
    Caption = 'Re&tornar'
    TabOrder = 7
    OnClick = btnRetornarClick
  end
  object grpMatriz: TGroupBox
    Left = 8
    Top = 8
    Width = 181
    Height = 50
    Hint = 
      'Para cada resolu'#231#227'o, quanto maior a matriz, menor o tamanho dos ' +
      'est'#237'mulos.'
    Caption = 'Linhas X Colunas da Matriz'
    ParentBackground = False
    ParentShowHint = False
    ShowHint = True
    TabOrder = 0
    object _x: TLabel
      Left = 45
      Top = 20
      Width = 8
      Height = 19
      Caption = 'x'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object edtRow: TEdit
      Left = 3
      Top = 20
      Width = 36
      Height = 21
      Hint = 'Linhas.'
      Alignment = taCenter
      NumbersOnly = True
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
      Text = '1'
      OnChange = edtRowChange
    end
    object edtCol: TEdit
      Left = 59
      Top = 20
      Width = 36
      Height = 21
      Hint = 'Colunas.'
      Alignment = taCenter
      NumbersOnly = True
      ParentShowHint = False
      ShowHint = True
      TabOrder = 1
      Text = '1'
      OnChange = edtRowChange
    end
    object Quadrada: TCheckBox
      Left = 101
      Top = 22
      Width = 65
      Height = 18
      Hint = 
        'Marque esta caixa para que o n'#250'mero de colunas permane'#231'a igual a' +
        'o n'#250'mero de linhas.'
      Caption = 'Quadrada'
      TabOrder = 2
      OnClick = QuadradaClick
    end
  end
  object grpDim: TGroupBox
    Left = 8
    Top = 64
    Width = 181
    Height = 50
    Caption = 'Comprimento X Altura'
    TabOrder = 1
    object Label1: TLabel
      Left = 45
      Top = 20
      Width = 8
      Height = 19
      Caption = 'x'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object edtWidth: TEdit
      Left = 3
      Top = 20
      Width = 36
      Height = 21
      Hint = 'Comprimento do est'#237'mulo, em pixels.'
      Alignment = taCenter
      NumbersOnly = True
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
      Text = '100'
      OnChange = edtWidthChange
    end
    object edtHeight: TEdit
      Left = 59
      Top = 20
      Width = 36
      Height = 21
      Hint = 'Altura, do est'#237'mulo, em pixels.'
      Alignment = taCenter
      NumbersOnly = True
      ParentShowHint = False
      ShowHint = True
      TabOrder = 1
      Text = '100'
      OnChange = edtWidthChange
    end
    object Quadrado: TCheckBox
      Left = 101
      Top = 22
      Width = 65
      Height = 17
      Hint = 
        'Marque esta caixa para que a altura permane'#231'a igual ao comprimen' +
        'to.'
      Caption = 'Quadrado'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 2
      OnClick = QuadradoClick
    end
  end
  object lbCoordenadas: TListBox
    Left = 195
    Top = 8
    Width = 159
    Height = 127
    Ctl3D = True
    DragKind = dkDock
    DragMode = dmAutomatic
    ItemHeight = 13
    ParentCtl3D = False
    TabOrder = 9
    OnEndDock = lbCoordenadasEndDock
  end
  object grpCfg: TGroupBox
    Left = 195
    Top = 141
    Width = 159
    Height = 70
    Caption = 'Defini'#231#245'es Gerais'
    TabOrder = 3
    object lblLeftTop: TLabel
      Left = 76
      Top = 39
      Width = 8
      Height = 19
      Caption = 'x'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object chkCustomResolution: TCheckBox
      Left = 12
      Top = 16
      Width = 121
      Height = 17
      Hint = 
        'Selecione esta op'#231#227'o para visualizar o tamanho real do est'#237'mulo.' +
        #13#10'A resolu'#231#227'o atual do monitor '#233' utilizada como refer'#234'ncia.'
      Caption = 'Usar esta resolu'#231#227'o:'
      TabOrder = 0
    end
    object edtLeft: TEdit
      Left = 3
      Top = 39
      Width = 62
      Height = 21
      TabOrder = 1
      Text = '1024'
      OnChange = edtLeftChange
    end
    object edtTop: TEdit
      Left = 94
      Top = 39
      Width = 62
      Height = 21
      TabOrder = 2
      Text = '768'
    end
  end
  object btnMostrarMatriz: TButton
    Left = 8
    Top = 217
    Width = 48
    Height = 20
    Hint = 'Mostrar Est'#237'mulos.'
    Caption = '&Mostrar'
    ParentShowHint = False
    ShowHint = True
    TabOrder = 4
    OnClick = btnMostrarMatrizClick
  end
  object btnLimparTudo: TButton
    Left = 62
    Top = 217
    Width = 48
    Height = 20
    Hint = 'Limpar tela e lista de coordenadas.'
    Caption = '&Limpar'
    TabOrder = 5
    OnClick = btnLimparTudoClick
  end
  object btnOK: TButton
    Left = 279
    Top = 217
    Width = 70
    Height = 20
    Hint = 'Salvar coordenadas.'
    Caption = 'Ava&n'#231'ar'
    Default = True
    TabOrder = 8
    OnClick = btnOKClick
  end
  object grpDist: TGroupBox
    Left = 8
    Top = 120
    Width = 181
    Height = 91
    Caption = 'Dist'#226'ncia entre Est'#237'mulos'
    TabOrder = 2
    object lbl1: TLabel
      Left = 45
      Top = 20
      Width = 8
      Height = 19
      Caption = 'x'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object edtDisty: TEdit
      Left = 59
      Top = 20
      Width = 36
      Height = 21
      Hint = 
        'Dist'#226'ncia vertical, em pixels, entre a borda inferior de um est'#237 +
        'mulo e a superior de outro.'
      Alignment = taCenter
      NumbersOnly = True
      ParentShowHint = False
      ShowHint = True
      TabOrder = 1
      Text = '100'
      OnChange = edtDistxChange
    end
    object edtDistx: TEdit
      Left = 3
      Top = 20
      Width = 36
      Height = 21
      Hint = 
        'Dist'#226'ncia horizontal, em pixels, entre a borda direita de um est' +
        #237'mulo e a esquerda de outro.'
      Alignment = taCenter
      NumbersOnly = True
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
      Text = '100'
      OnChange = edtDistxChange
    end
    object chkIgual: TCheckBox
      Left = 101
      Top = 44
      Width = 65
      Height = 17
      Hint = 'Igualar a dist'#226'ncia vertical '#224' horizontal.'
      Caption = 'Igualar'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 3
      OnClick = chkIgualClick
    end
    object chkDistribuir: TCheckBox
      Left = 101
      Top = 22
      Width = 65
      Height = 17
      Hint = 
        'Distribuir os est'#237'mulos no monitor de acordo com a resolu'#231#227'o. Di' +
        'vide-se o comprimento pelo n'#250'mero de linhas e a altura pelo n'#250'me' +
        'ro de colunas.'
      Caption = 'Distribuir'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 2
      OnClick = chkDistribuirClick
    end
  end
  object btnRand: TButton
    Left = 116
    Top = 217
    Width = 73
    Height = 21
    Caption = '&Randomizar'
    TabOrder = 6
    OnClick = btnRandClick
  end
end
