object fmHelp: TfmHelp
  Left = 0
  Top = 0
  ActiveControl = edt17
  BorderStyle = bsSingle
  Caption = 'Sobre o Preview de Esquemas de Refor'#231'o do EAM'
  ClientHeight = 473
  ClientWidth = 590
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
  PixelsPerInch = 96
  TextHeight = 13
  object pgcl1: TPageControl
    Left = 0
    Top = 0
    Width = 590
    Height = 473
    ActivePage = tbsht4
    Align = alClient
    TabOrder = 0
    object tbsht3: TTabSheet
      Caption = 'Introdu'#231#227'o'
      ImageIndex = 2
      object lbl1: TLabel
        Left = 114
        Top = 184
        Width = 351
        Height = 76
        Alignment = taCenter
        Caption = 
          'Este guia pode ajudar voc'#234' a usar os par'#226'metros'#13#10'que controlam o' +
          ' funcionamento dos Esquemas de'#13#10'Refor'#231'o em um Arquivo de Configu' +
          'ra'#231#227'o deste'#13#10'programa.'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -16
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
    end
    object tbsht1: TTabSheet
      Caption = 'Esquemas Simples'
      object lbl2: TLabel
        Left = 61
        Top = 225
        Width = 457
        Height = 38
        Alignment = taCenter
        Caption = 
          'Para a configura'#231#227'o de alguns esquemas (CRF e EXT) apenas um'#13#10'no' +
          'me '#233' necess'#225'rio ao lado direito da chave de um est'#237'mulo.'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -16
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object lbl5: TLabel
        Left = 90
        Top = 89
        Width = 387
        Height = 114
        Alignment = taCenter
        Caption = 
          'Um est'#237'mulo, seja ele um modelo ou uma compara'#231#227'o,'#13#10'pode possuir' +
          ' um esquema de resfor'#231'o. Esse esquema'#13#10'determinar'#225' como as respo' +
          'stas ao est'#237'mulo produzir'#227'o'#13#10'o acionamento de uma consequ'#234'ncia. ' +
          'As chaves deste'#13#10'par'#226'metro no arquivo de configura'#231#227'o s'#227'o finali' +
          'zadas'#13#10'com '#39'Sch='#39'.'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -16
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object grp2: TGroupBox
        Left = 290
        Top = 281
        Width = 147
        Height = 75
        Caption = 'Exemplo'
        TabOrder = 0
        object lbl9: TLabel
          Left = 98
          Top = 15
          Width = 26
          Height = 13
          Caption = 'nome'
        end
        object lbl19: TLabel
          Left = 26
          Top = 15
          Width = 29
          Height = 13
          Caption = 'chave'
        end
        object edt4: TEdit
          Left = 11
          Top = 34
          Width = 62
          Height = 27
          Alignment = taCenter
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 0
          Text = 'C1Sch='
        end
        object edt5: TEdit
          Left = 90
          Top = 34
          Width = 39
          Height = 27
          Alignment = taCenter
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 1
          Text = 'CRF'
        end
      end
      object grp5: TGroupBox
        Left = 137
        Top = 281
        Width = 147
        Height = 75
        Caption = 'Exemplo'
        TabOrder = 1
        object lbl14: TLabel
          Left = 98
          Top = 15
          Width = 26
          Height = 13
          Caption = 'nome'
        end
        object lbl21: TLabel
          Left = 26
          Top = 15
          Width = 29
          Height = 13
          Caption = 'chave'
        end
        object edt11: TEdit
          Left = 11
          Top = 34
          Width = 62
          Height = 27
          Alignment = taCenter
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 0
          Text = 'SSch='
        end
        object edt16: TEdit
          Left = 90
          Top = 34
          Width = 39
          Height = 27
          Alignment = taCenter
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 1
          Text = 'CRF'
        end
      end
    end
    object tbsht2: TTabSheet
      Caption = 'Valores e Desvios'
      ImageIndex = 1
      object lbl6: TLabel
        Left = 17
        Top = 260
        Width = 544
        Height = 57
        Alignment = taCenter
        Caption = 
          'O DRH necessita de dois valores e aceita dois desvios, forne'#231'a o' +
          's par'#226'metros'#13#10'da seguinte forma: "nome valor1 valor2 desvio1 des' +
          'vio2", onde o valor1 '#233' o'#13#10'n'#250'mero de respostas e o valor2 '#233' o tem' +
          'po (em segundos).'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object lbl3: TLabel
        Left = 19
        Top = 3
        Width = 456
        Height = 57
        Caption = 
          'Os esquemas FI, FR e FT exigem um nome e um valor num'#233'rico.'#13#10'O v' +
          'alor '#233' um n'#250'mero inteiro, seja um n'#250'mero'#13#10'de respostas ou um tem' +
          'po (segundos).'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object lbl4: TLabel
        Left = 20
        Top = 108
        Width = 541
        Height = 57
        Alignment = taCenter
        Caption = 
          'Os esquemas vari'#225'veis (VI, VR e VT) e o DRL, adicionalmente, pod' +
          'em incluir'#13#10'um desvio. Este desvio determinar'#225' a amplitude de va' +
          'ria'#231#227'o do valor'#13#10'fornecido. O desvio n'#227'o deve ser maior do que o' +
          ' valor.'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object grp4: TGroupBox
        Left = 110
        Top = 323
        Width = 339
        Height = 75
        Caption = 'Exemplo'
        TabOrder = 0
        object lbl15: TLabel
          Left = 132
          Top = 16
          Width = 33
          Height = 13
          Caption = 'valor 1'
        end
        object lbl16: TLabel
          Left = 237
          Top = 16
          Width = 40
          Height = 13
          Caption = 'desvio 1'
        end
        object lbl17: TLabel
          Left = 182
          Top = 16
          Width = 33
          Height = 13
          Caption = 'valor 2'
        end
        object lbl18: TLabel
          Left = 291
          Top = 16
          Width = 40
          Height = 13
          Caption = 'desvio 2'
        end
        object edt10: TEdit
          Left = 7
          Top = 35
          Width = 104
          Height = 27
          Alignment = taCenter
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 0
          Text = 'DRH 20 4 5 2'
        end
        object edt12: TEdit
          Left = 136
          Top = 35
          Width = 25
          Height = 27
          Alignment = taCenter
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 1
          Text = '20'
        end
        object edt13: TEdit
          Left = 242
          Top = 35
          Width = 25
          Height = 27
          Alignment = taCenter
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 3
          Text = '5'
        end
        object edt14: TEdit
          Left = 187
          Top = 35
          Width = 25
          Height = 27
          Alignment = taCenter
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 2
          Text = '4'
        end
        object edt15: TEdit
          Left = 298
          Top = 35
          Width = 25
          Height = 27
          Alignment = taCenter
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 4
          Text = '4'
        end
      end
      object grp1: TGroupBox
        Left = 360
        Top = 26
        Width = 201
        Height = 76
        Caption = 'Exemplo'
        TabOrder = 1
        object lbl7: TLabel
          Left = 90
          Top = 10
          Width = 26
          Height = 13
          Caption = 'nome'
        end
        object lbl8: TLabel
          Left = 153
          Top = 10
          Width = 24
          Height = 13
          Caption = 'valor'
        end
        object edt1: TEdit
          Left = 11
          Top = 29
          Width = 41
          Height = 27
          Alignment = taCenter
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 0
          Text = 'FR 5'
        end
        object edt2: TEdit
          Left = 90
          Top = 29
          Width = 25
          Height = 27
          Alignment = taCenter
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 1
          Text = 'FR'
        end
        object edt3: TEdit
          Left = 153
          Top = 29
          Width = 25
          Height = 27
          Alignment = taCenter
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 2
          Text = '5'
        end
      end
      object grp3: TGroupBox
        Left = 110
        Top = 171
        Width = 339
        Height = 75
        Caption = 'Exemplo'
        TabOrder = 2
        object lbl10: TLabel
          Left = 90
          Top = 10
          Width = 26
          Height = 13
          Caption = 'nome'
        end
        object lbl11: TLabel
          Left = 141
          Top = 10
          Width = 24
          Height = 13
          Caption = 'valor'
        end
        object lbl12: TLabel
          Left = 192
          Top = 11
          Width = 31
          Height = 13
          Caption = 'desvio'
        end
        object lbl13: TLabel
          Left = 249
          Top = 20
          Width = 87
          Height = 39
          Alignment = taCenter
          Caption = '5 + 4 = 9'#13#10'5 - 4 = 1'#13#10'Varia'#231#227'o de 1 a 9.'
        end
        object edt6: TEdit
          Left = 11
          Top = 29
          Width = 54
          Height = 27
          Alignment = taCenter
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 0
          Text = 'VI 5 4'
        end
        object edt7: TEdit
          Left = 90
          Top = 29
          Width = 25
          Height = 27
          Alignment = taCenter
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 1
          Text = 'VI'
        end
        object edt8: TEdit
          Left = 141
          Top = 29
          Width = 25
          Height = 27
          Alignment = taCenter
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 2
          Text = '5'
        end
        object edt9: TEdit
          Left = 197
          Top = 29
          Width = 25
          Height = 27
          Alignment = taCenter
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 3
          Text = '4'
        end
      end
    end
    object tbsht4: TTabSheet
      Caption = 'Esquemas Especiais'
      ImageIndex = 3
      object lbl25: TLabel
        Left = 16
        Top = 18
        Width = 547
        Height = 114
        Alignment = taCenter
        Caption = 
          'Esquemas FRFT, FRVT, VRFT e VRVT s'#227'o esquemas especiais que perm' +
          'item'#13#10'programar um esquema de raz'#227'o e outro de tempo para um mes' +
          'mo est'#237'mulo.'#13#10'Duas consequ'#234'ncias podem ser definidas, uma para c' +
          'ada esquema.'#13#10'Apenas o esquema que for cumprido primeiro produz ' +
          'a sua consequ'#234'ncia'#13#10'definida se houver o ecerramento da tentativ' +
          'a (Tentativas Discretas).'#13#10'No formato de Operante Livre, ambas a' +
          's consequ'#234'ncias podem ocorrer.'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object lbl22: TLabel
        Left = 40
        Top = 314
        Width = 483
        Height = 38
        Alignment = taCenter
        Caption = 
          'No arquivo de configura'#231#227'o, o nome das chaves da consequ'#234'ncia do' +
          #13#10'esquema de tempo s'#227'o '#39'K+USB='#39', '#39'K+Csq='#39', '#39'K+Nxt'#39', etc. '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object grp6: TGroupBox
        Left = 155
        Top = 152
        Width = 256
        Height = 75
        Caption = 'Exemplo'
        TabOrder = 0
        object lbl20: TLabel
          Left = 160
          Top = 16
          Width = 33
          Height = 13
          Caption = 'valor 1'
        end
        object lbl23: TLabel
          Left = 210
          Top = 16
          Width = 33
          Height = 13
          Caption = 'valor 2'
        end
        object edt17: TEdit
          Left = 7
          Top = 35
          Width = 130
          Height = 27
          Alignment = taCenter
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 0
          Text = 'FRFT 6 10'
        end
        object edt18: TEdit
          Left = 164
          Top = 35
          Width = 25
          Height = 27
          Alignment = taCenter
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 1
          Text = '6'
        end
        object edt20: TEdit
          Left = 215
          Top = 35
          Width = 25
          Height = 27
          Alignment = taCenter
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 2
          Text = '10'
        end
      end
      object grp7: TGroupBox
        Left = 80
        Top = 233
        Width = 404
        Height = 75
        Caption = 'Exemplo'
        TabOrder = 1
        object lbl26: TLabel
          Left = 160
          Top = 16
          Width = 33
          Height = 13
          Caption = 'valor 1'
        end
        object lbl27: TLabel
          Left = 265
          Top = 16
          Width = 40
          Height = 13
          Caption = 'desvio 1'
        end
        object lbl28: TLabel
          Left = 210
          Top = 16
          Width = 33
          Height = 13
          Caption = 'valor 2'
        end
        object lbl29: TLabel
          Left = 319
          Top = 16
          Width = 40
          Height = 13
          Caption = 'desvio 2'
        end
        object edt22: TEdit
          Left = 7
          Top = 35
          Width = 130
          Height = 27
          Alignment = taCenter
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 0
          Text = 'VRVT 20 4 5 2'
        end
        object edt23: TEdit
          Left = 164
          Top = 35
          Width = 25
          Height = 27
          Alignment = taCenter
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 1
          Text = '20'
        end
        object edt24: TEdit
          Left = 270
          Top = 35
          Width = 25
          Height = 27
          Alignment = taCenter
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 3
          Text = '5'
        end
        object edt25: TEdit
          Left = 215
          Top = 35
          Width = 25
          Height = 27
          Alignment = taCenter
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 2
          Text = '4'
        end
        object edt26: TEdit
          Left = 326
          Top = 35
          Width = 25
          Height = 27
          Alignment = taCenter
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 4
          Text = '2'
        end
      end
    end
  end
end
