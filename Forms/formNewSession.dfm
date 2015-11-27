object fNewSession: TfNewSession
  Left = 0
  Top = 0
  BorderStyle = bsNone
  Caption = 'fNewSession'
  ClientHeight = 262
  ClientWidth = 464
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object grp1: TGroupBox
    Left = 8
    Top = 8
    Width = 447
    Height = 57
    Caption = 'Nome da Sess'#227'o'
    TabOrder = 0
    object edt1: TEdit
      Left = 3
      Top = 24
      Width = 430
      Height = 21
      Hint = 
        'Escreva um nome para a sess'#227'o. Deixar em branco n'#227'o comprometer'#225 +
        ' a execu'#231#227'o da sess'#227'o.'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
    end
  end
  object grp2: TGroupBox
    Left = 8
    Top = 71
    Width = 447
    Height = 57
    Caption = 'Pasta de Est'#237'mulos'
    TabOrder = 1
    object edt2: TEdit
      Left = 3
      Top = 24
      Width = 430
      Height = 21
      Hint = 
        'Escreva o nome da pasta que cont'#233'm os arquivos de est'#237'mulo da se' +
        'ss'#227'o. ('#39'%\Files Settings\Est'#237'mulos'#39' '#233' o padr'#227'o)'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
      OnDblClick = edt2DblClick
    end
  end
  object grp3: TGroupBox
    Left = 8
    Top = 134
    Width = 447
    Height = 57
    Caption = 'Pasta de Dados'
    TabOrder = 2
    object edt3: TEdit
      Left = 3
      Top = 24
      Width = 430
      Height = 21
      Hint = 
        'Escreva o nome da pasta que o programa utilizar'#225' para armazenar ' +
        'os arquivos de relat'#243'rio da sess'#227'o. ('#39'%\Files Settings'#39' '#233' o padr' +
        #227'o)'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
      OnDblClick = edt2DblClick
    end
  end
  object grp4: TGroupBox
    Left = 8
    Top = 197
    Width = 113
    Height = 57
    Caption = 'N'#250'mero de Blocos'
    TabOrder = 3
    object se1: TSpinEdit
      Left = 3
      Top = 24
      Width = 107
      Height = 22
      Hint = 
        #201' poss'#237'vel configurar um crit'#233'rio de acertos ou erros consecutiv' +
        'os para cada bloco de tentativas.'
      MaxValue = 1000
      MinValue = 1
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
      Value = 1
    end
  end
  object btnOk: TBitBtn
    Left = 366
    Top = 219
    Width = 75
    Height = 25
    Caption = 'Avan'#231'ar'
    Default = True
    ModalResult = 1
    TabOrder = 4
    OnClick = btnOkClick
  end
  object btnCancel: TBitBtn
    Left = 285
    Top = 219
    Width = 75
    Height = 25
    Caption = 'Retornar'
    ModalResult = 2
    TabOrder = 5
  end
  object rgType: TRadioGroup
    Left = 127
    Top = 197
    Width = 152
    Height = 57
    Hint = 
      'Se o crit'#233'rio de ACERTOS for alcan'#231'ado, avan'#231'ar para o bloco seg' +
      'uinte e, se n'#227'o, terminar a sess'#227'o ap'#243's todas as tentativas do b' +
      'loco serem processadas.'#13#10'Se n'#227'o importa, avan'#231'ar para o bloco se' +
      'guinte atingindo ou n'#227'o o crit'#233'rio.'
    Caption = 'Avan'#231'ar Blocos somente se'
    ItemIndex = 0
    Items.Strings = (
      'Crit'#233'rio de Acertos'
      'N'#227'o Importa ')
    ParentShowHint = False
    ShowHint = True
    TabOrder = 6
  end
  object dlgDialog: TJvBrowseForFolderDialog
    Left = 224
    Top = 128
  end
end
