object fTrials: TfTrials
  Left = 0
  Top = 0
  ActiveControl = seNumComp
  BorderStyle = bsSingle
  Caption = 'Tentativas'
  ClientHeight = 488
  ClientWidth = 1167
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
  Visible = True
  OnClose = FormClose
  OnCreate = FormCreate
  OnMouseEnter = FormMouseEnter
  PixelsPerInch = 96
  TextHeight = 13
  object pnl1: TPanel
    Left = 8
    Top = 8
    Width = 379
    Height = 472
    ParentShowHint = False
    ShowHint = True
    TabOrder = 0
    OnMouseEnter = pnl1MouseEnter
    object ToolBar1: TToolBar
      Left = 1
      Top = 1
      Width = 377
      Height = 29
      Caption = 'ToolBar1'
      EdgeBorders = [ebBottom]
      Images = fMain.ImageList1
      Indent = 6
      TabOrder = 0
      object btnParameters: TToolButton
        Left = 6
        Top = 0
        Hint = 'Aplica'#231#227'o '#224's Tentativas.'
        CustomHint = BalloonHint1
        Caption = 'Par'#226'metros'
        DropdownMenu = pmParameters
        ImageIndex = 12
        Style = tbsDropDown
        OnClick = btnAplicarClick
      end
      object btnStm: TToolButton
        Left = 44
        Top = 0
        Hint = 'Aplica'#231#227'o '#224's Configura'#231#245'es de Compara'#231#245'es e Modelo'
        CustomHint = BalloonHint1
        Caption = 'Configura'#231#245'es'
        DropdownMenu = pmStm
        ImageIndex = 11
        Style = tbsDropDown
        OnClick = btnAplicarClick
      end
      object btnWrite: TToolButton
        Left = 82
        Top = 0
        Hint = 'Ferramentas para escrita no editor de texto.'
        CustomHint = BalloonHint1
        Caption = 'Escrita'
        DropdownMenu = pmWrite
        ImageIndex = 13
        Style = tbsDropDown
        OnClick = btnAplicarClick
      end
      object s1: TToolButton
        Left = 120
        Top = 0
        Width = 8
        Caption = 's1'
        ImageIndex = 3
        Style = tbsSeparator
      end
      object btnAplicar: TBitBtn
        Left = 128
        Top = 0
        Width = 62
        Height = 22
        Caption = 'Aplicar'
        Glyph.Data = {
          36030000424D3603000000000000360000002800000010000000100000000100
          1800000000000003000000000000000000000000000000000000FFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD1BDA9D0A0
          76BCB8B6D0D0D0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFD1C6BDD39F72E3B78DE9C297CF9A6AC0C0C0FFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD7D4D0CA9D76DAA87CF2DEC7EECFADF3DD
          C4D5935BB8B6B6D8D8D8FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDFDFDEC6A186CF
          9365EAC9A6E9C69BE2AE74E1A96BE6B785E3B17FBE9574C8C8C8FFFFFFFFFFFF
          FFFFFFFFFFFFC6B09DC38556DCAE7FE3B783DDA767DDA565DC9E5ADC9C58DC9C
          58E4B480C48450C2C2C2FFFFFFFFFFFFCBBFB8BB7E54CF945FDFAB6FD99C55D9
          9B52D99B52D99851D89146D89145D89145DB9953C0783EC0C0C0FFFFFFBF8A65
          BF7A45D89B55D49042D48F40D48F40D48F3FD48E3FD48B3CD38533D38532D385
          32D38533BC6D2FBFBFBFD6B39DCF8F53E0AF78D28936D0842DD0842DD0832CD0
          832CD0832CCE7D26CC771ECC771ECC771ECC761EB5611ABBB7B7E0C8C1C17D4A
          F6E6D6EFD5B8DDA669CF7F27CC781ACC781ACC781AC97214C56909C56809C568
          09C56809AA500FBFBFBFFFFFFFDFC6BAB06C42DAAF8EF2DDC6EBC9A4DCA262CF
          8027CC7718CA7214C26506C26506C26506C26709A65015C4C4C4FFFFFFFFFFFF
          FFFFFFCDA28EB46E44E5C3A4EED2B3E5BB8BDA9C58CE7E27BF6204BF6204BF62
          04C46E17A25320CECECEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC0896CBB794EEB
          D0B4E9C69FE0AC73CD853DC0660EBD5F03C3701FA25E39FFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFB4754FC48A60EFD6BAE2B688CD8948C474
          28AC5415B6A29AFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFDEC8BDAE663DD3A17AEBD0B6DCAE82954010D9D9D9FFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCFA894A55321A044
          02BB8E75FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFE9DCD8FFFFFFFFFFFFFFFFFF}
        TabOrder = 0
        OnClick = btnAplicarClick
      end
      object ToolButton1: TToolButton
        Left = 190
        Top = 0
        Width = 9
        Caption = 'ToolButton1'
        ImageIndex = 17
        Style = tbsSeparator
      end
      object btnAutoStm: TToolButton
        Left = 199
        Top = 0
        Caption = 'btnAutoStm'
        ImageIndex = 24
        OnClick = btnAutoStmClick
      end
      object btnRand2: TToolButton
        Left = 222
        Top = 0
        Hint = 'Aleatorizar Posi'#231#245'es dos Est'#237'mulos'
        Caption = 'btnRand2'
        ImageIndex = 16
        OnClick = btnRandClick
      end
      object btnTrialOrder: TToolButton
        Left = 245
        Top = 0
        Hint = 'Aleatorizar Ordem de Apresenta'#231#227'o das Tentativas'
        Caption = 'btnTrialOrder'
        ImageIndex = 17
        OnClick = btnTrialOrderClick
      end
      object btn1: TToolButton
        Left = 268
        Top = 0
        Width = 8
        Caption = 'btn1'
        ImageIndex = 19
        Style = tbsSeparator
      end
      object pnlSaved: TPanel
        Left = 276
        Top = 0
        Width = 45
        Height = 22
        BevelInner = bvLowered
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentBackground = False
        ParentFont = False
        TabOrder = 1
      end
      object chkAutoSave: TCheckBox
        Left = 321
        Top = 0
        Width = 76
        Height = 22
        Hint = 
          'Marque para salvar automaticamente ao modificar e sair de um par' +
          #226'metro ou configura'#231#227'o.'
        Caption = 'Salvar'
        Checked = True
        State = cbChecked
        TabOrder = 2
      end
    end
    object grp1: TGroupBox
      Left = 7
      Top = 36
      Width = 360
      Height = 431
      Caption = 'Par'#226'metros da Tentativa'
      Color = 12311547
      ParentBackground = False
      ParentColor = False
      TabOrder = 1
      OnMouseEnter = grp1MouseEnter
      object grpTrialName: TGroupBox
        Left = 16
        Top = 14
        Width = 183
        Height = 57
        Caption = 'Nome'
        TabOrder = 0
        object edtName: TEdit
          Left = 14
          Top = 20
          Width = 152
          Height = 21
          Hint = 'Um nome permite a identifica'#231#227'o da tentativa no relat'#243'rio.'
          ParentShowHint = False
          ShowHint = True
          TabOrder = 0
          TextHint = 'Vazio'
          OnExit = edtNameExit
        end
      end
      object grpStmC: TGroupBox
        Left = 205
        Top = 57
        Width = 139
        Height = 42
        Hint = 'Quantas escolhas?'
        Caption = 'N'#250'mero de Compara'#231#245'es'
        TabOrder = 5
        object seNumComp: TSpinEdit
          Left = 3
          Top = 14
          Width = 133
          Height = 22
          EditorEnabled = False
          MaxValue = 1
          MinValue = 1
          TabOrder = 0
          Value = 1
          OnChange = seNumCompChange
          OnExit = edtNameExit
        end
      end
      object grpTrialShow: TGroupBox
        Left = 16
        Top = 159
        Width = 183
        Height = 264
        Caption = 'Apresenta'#231#227'o'
        ParentBackground = False
        TabOrder = 2
        object lblmilisegundos: TLabel
          Left = 98
          Top = 86
          Width = 60
          Height = 13
          Caption = 'milisegundos'
        end
        object lblCursor: TLabel
          Left = 14
          Top = 182
          Width = 36
          Height = 13
          Caption = 'Cursor:'
          Color = clBtnFace
          ParentColor = False
        end
        object edtCustomNxtValue: TEdit
          Left = 14
          Top = 83
          Width = 78
          Height = 21
          Hint = 'Tempo para o encerramento da tentativa em "Operante Livre".'
          Color = clWhite
          Enabled = False
          NumbersOnly = True
          TabOrder = 1
          TextHint = 'Vazio'
          OnExit = edtNameExit
          OnKeyPress = edtCustomNxtValueKeyPress
        end
        object rgAutoNxt: TRadioGroup
          Left = 14
          Top = 20
          Width = 144
          Height = 57
          Hint = 
            'Em "Operante Livre", uma "tentativa" '#233' encerrada ap'#243's um tempo. ' +
            '(em desenvolvimento)'#13#10'Em "Tentativa Discreta", uma tentativa '#233' e' +
            'ncerrada ap'#243's a apresenta'#231#227'o das consequ'#234'ncias.'
          Caption = 'Formato'
          ItemIndex = 0
          Items.Strings = (
            'Tentativa Discreta'
            'Operante Livre')
          TabOrder = 0
          OnClick = rgAutoNxtClick
          OnExit = edtNameExit
        end
        object pnlBkGnd: TPanel
          Left = 45
          Top = 121
          Width = 95
          Height = 40
          Hint = 'Duplo clique para escolher a cor da tela do IET.'
          Caption = 'Cor do Fundo'
          Ctl3D = True
          ParentBackground = False
          ParentCtl3D = False
          TabOrder = 2
          OnDblClick = pnlBkGndDblClick
          OnExit = edtNameExit
        end
        object grp6: TGroupBox
          Left = 14
          Top = 207
          Width = 158
          Height = 42
          Caption = 'Ver Cursor'
          TabOrder = 4
        end
        object seCursor: TSpinEdit
          Left = 56
          Top = 179
          Width = 110
          Height = 22
          MaxValue = 2
          MinValue = -30
          TabOrder = 3
          Value = 0
          OnChange = seCursorChange
          OnExit = edtNameExit
        end
      end
      object rgKind: TRadioGroup
        Left = 16
        Top = 83
        Width = 183
        Height = 70
        Caption = 'Tipo de Tentativa'
        Columns = 2
        ItemIndex = 0
        Items.Strings = (
          'Mensagem'
          'Simples'
          'Condicional')
        TabOrder = 1
        OnClick = rgKindClick
        OnExit = edtNameExit
      end
      object rgCorrection: TRadioGroup
        Left = 205
        Top = 14
        Width = 138
        Height = 37
        Hint = 
          'Se "Sim", a tentativa seguinte '#233' automaticamente configurada.'#13#10'O' +
          ' par'#226'metro '#39'Nxt='#39' de cada compara'#231#227'o recebe o valor "CRT".'#13#10'O n'#250 +
          'mero m'#225'ximo de corre'#231#245'es pode ser configurado na janela "Blocos"' +
          '.'
        Caption = 'Corre'#231#227'o'
        Columns = 2
        ItemIndex = 0
        Items.Strings = (
          'N'#227'o'
          'Sim')
        TabOrder = 3
        OnClick = edtNameExit
      end
      object grpStmControl: TGroupBox
        Left = 205
        Top = 101
        Width = 139
        Height = 39
        Hint = 'Selecione o est'#237'mulo de compara'#231#227'o a ser configurado.'
        Caption = 'Compara'#231#245'es'
        TabOrder = 6
        object cbbStimulus: TComboBox
          Left = 3
          Top = 14
          Width = 133
          Height = 21
          Hint = 'Selecione o est'#237'mulo para configur'#225'-lo'
          TabOrder = 0
          Text = 'Est'#237'mulo'
          OnChange = cbbStimulusChange
        end
      end
      object grpComparison: TGroupBox
        Left = 205
        Top = 146
        Width = 138
        Height = 136
        Hint = 'DUPLO CLIQUE para escolher o est'#237'mulo.'
        Caption = 'Figura da Compara'#231#227'o'
        Color = 6022098
        ParentBackground = False
        ParentColor = False
        TabOrder = 4
        OnDblClick = grpPicDblClick
        OnMouseEnter = grpComparisonMouseEnter
        OnMouseLeave = grpComparisonMouseLeave
        object btnPlayStopPreview: TBitBtn
          Left = 0
          Top = 103
          Width = 33
          Height = 33
          Glyph.Data = {
            1A0D0000424D1A0D000000000000360000002800000021000000210000000100
            180000000000E40C0000C40E0000C40E00000000000000000000FFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FF00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFF00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFF00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFF00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FFFFFFFFFFFFFFFFFFFF
            FFFF000000000000000000000000000000000000FFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FFFFFFFFFFFF
            FFFFFFFFFFFF000000000000000000000000000000000000FFFFFFFFFFFFFFFF
            FFFFFFFF000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FFFF
            FFFFFFFFFFFFFFFFFFFF000000000000000000000000000000000000FFFFFFFF
            FFFFFFFFFFFFFFFF000000000000000000000000FFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FF00FFFFFFFFFFFFFFFFFFFFFFFF000000000000000000000000000000000000
            FFFFFFFFFFFFFFFFFFFFFFFF000000000000000000000000000000000000FFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFF00FFFFFFFFFFFFFFFFFFFFFFFF0000000000000000000000000000
            00000000FFFFFFFFFFFFFFFFFFFFFFFF00000000000000000000000000000000
            0000000000707070FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFF00FFFFFFFFFFFFFFFFFFFFFFFF00000000000000000000
            0000000000000000FFFFFFFFFFFFFFFFFFFFFFFF000000000000000000000000
            000000000000000000000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFF00FFFFFFFFFFFFFFFFFFFFFFFF000000000000
            000000000000000000000000FFFFFFFFFFFFFFFFFFFFFFFF0000000000000000
            00000000000000000000000000000000000000000000000000FFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FFFFFFFFFFFFFFFFFFFFFFFF0000
            00000000000000000000000000000000FFFFFFFFFFFFFFFFFFFFFFFF00000000
            0000000000000000000000000000000000000000000000000000000000000000
            000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FFFFFFFFFFFFFFFFFFFF
            FFFF000000000000000000000000000000000000FFFFFFFFFFFFFFFFFFFFFFFF
            0000000000000000000000000000000000000000000000000000000000000000
            00000000000000000000000000FFFFFFFFFFFFFFFFFFFFFFFF00FFFFFFFFFFFF
            FFFFFFFFFFFF000000000000000000000000000000000000FFFFFFFFFFFFFFFF
            FFFFFFFF00000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000FFFFFFFFFFFF00FFFF
            FFFFFFFFFFFFFFFFFFFF000000000000000000000000000000000000FFFFFFFF
            FFFFFFFFFFFFFFFF000000000000000000000000000000000000000000000000
            000000000000000000000000000000000000000000FFFFFFFFFFFFFFFFFFFFFF
            FF00FFFFFFFFFFFFFFFFFFFFFFFF000000000000000000000000000000000000
            FFFFFFFFFFFFFFFFFFFFFFFF0000000000000000000000000000000000000000
            00000000000000000000000000000000000000FFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFF00FFFFFFFFFFFFFFFFFFFFFFFF0000000000000000000000000000
            00000000FFFFFFFFFFFFFFFFFFFFFFFF00000000000000000000000000000000
            0000000000000000000000000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFF00FFFFFFFFFFFFFFFFFFFFFFFF00000000000000000000
            0000000000000000FFFFFFFFFFFFFFFFFFFFFFFF000000000000000000000000
            000000000000000000000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFF00FFFFFFFFFFFFFFFFFFFFFFFF000000000000
            000000000000000000000000FFFFFFFFFFFFFFFFFFFFFFFF0000000000000000
            00000000000000000000000000707070FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FFFFFFFFFFFFFFFFFFFFFFFF0000
            00000000000000000000000000000000FFFFFFFFFFFFFFFFFFFFFFFF00000000
            0000000000000000000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FFFFFFFFFFFFFFFFFFFF
            FFFF000000000000000000000000000000000000FFFFFFFFFFFFFFFFFFFFFFFF
            000000000000000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FFFFFFFFFFFF
            FFFFFFFFFFFF000000000000000000000000000000000000FFFFFFFFFFFFFFFF
            FFFFFFFF000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FFFF
            FFFFFFFFFFFFFFFFFFFF000000000000000000000000000000000000FFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FF00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFF00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFF00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFF00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00}
          TabOrder = 0
          Visible = False
          OnClick = btnPlayStopPreviewClick
          OnMouseEnter = btnPlayStopPreviewMouseEnter
          OnMouseLeave = btnPlayStopPreviewMouseLeave
        end
      end
      object grpConseqPic: TGroupBox
        Left = 205
        Top = 288
        Width = 138
        Height = 136
        Hint = 'DUPLO CLIQUE para escolher o est'#237'mulo.'
        Caption = 'Figura da Consequ'#234'ncia'
        Color = 6022098
        ParentBackground = False
        ParentColor = False
        TabOrder = 7
        OnDblClick = grpPicDblClick
        OnMouseEnter = grpComparisonMouseEnter
        OnMouseLeave = grpComparisonMouseLeave
      end
    end
  end
  object pnlMTS: TPanel
    Left = 780
    Top = 8
    Width = 379
    Height = 233
    TabOrder = 3
    object grp5: TGroupBox
      Left = 9
      Top = 6
      Width = 360
      Height = 222
      Caption = 'Configura'#231#245'es do Modelo'
      Color = 6022098
      ParentBackground = False
      ParentColor = False
      TabOrder = 0
      OnMouseEnter = grp1MouseEnter
      object lbl3: TLabel
        Left = 179
        Top = 142
        Width = 13
        Height = 13
        Caption = 'ms'
      end
      object rgHasDelay: TRadioGroup
        Left = 10
        Top = 124
        Width = 97
        Height = 41
        Caption = 'Atraso'
        Columns = 2
        Items.Strings = (
          'N'#227'o'
          'Sim')
        TabOrder = 0
        OnClick = rgHasDelayClick
        OnExit = edtNameExit
      end
      object edtDelay: TEdit
        Left = 114
        Top = 139
        Width = 59
        Height = 21
        Enabled = False
        NumbersOnly = True
        TabOrder = 1
        TextHint = 'Vazio'
        OnExit = edtNameExit
      end
      object grpSampName: TGroupBox
        Left = 10
        Top = 18
        Width = 172
        Height = 49
        Caption = 'Nome do Arquivo'
        TabOrder = 2
        object edtSStm: TEdit
          Left = 3
          Top = 19
          Width = 92
          Height = 21
          Hint = 
            'Dois cliques para escolher a figura, som ou v'#237'deo.'#13#10#13#10'Legenda do' +
            ' C'#243'digo Stm'#13#10#13#10'[arquivo.exten'#231#227'o] [n'#186' de repeti'#231#245'es] [cor]'#13#10#13#10#39'a' +
            'rquivo.exten'#231#227'o'#39', ex.: [A1.bmp] [casa.AVI].'#13#10#39'n'#186' de repeti'#231#245'es'#39' ' +
            'do v'#237'deo ou som.'#13#10#39'cor'#39' da janela caso nenhum arquivo seja utili' +
            'zado.'
          CustomHint = BalloonHint1
          ParentShowHint = False
          ShowHint = True
          TabOrder = 0
          TextHint = 'Vazio'
          OnDblClick = grpPicDblClick
          OnExit = edtNameExit
        end
        object pnlSCol: TPanel
          Left = 101
          Top = 18
          Width = 59
          Height = 22
          Hint = 'Duplo clique para escolher a cor da janela.'
          Caption = 'Cor'
          ParentShowHint = False
          ShowHint = True
          TabOrder = 1
          OnDblClick = pnlBkGndDblClick
          OnExit = edtNameExit
        end
      end
      object grpSampBnd: TGroupBox
        Left = 99
        Top = 71
        Width = 83
        Height = 47
        Caption = 'Posi'#231#227'o'
        TabOrder = 3
        object seSBnd: TSpinEdit
          Left = 6
          Top = 20
          Width = 70
          Height = 22
          MaxValue = 0
          MinValue = 0
          TabOrder = 0
          Value = 0
          OnExit = edtNameExit
        end
      end
      object grpSPic: TGroupBox
        Left = 202
        Top = 20
        Width = 139
        Height = 139
        Hint = 'DUPLO CLIQUE para escolher o est'#237'mulo.'
        Caption = 'Figura do Modelo'
        ParentShowHint = False
        ShowHint = True
        TabOrder = 4
        OnDblClick = grpPicDblClick
        OnMouseEnter = grpComparisonMouseEnter
        OnMouseLeave = grpComparisonMouseLeave
      end
      object grpSampMsg: TGroupBox
        Left = 10
        Top = 168
        Width = 83
        Height = 46
        Caption = 'Relat'#243'rio'
        TabOrder = 5
        object edtSMsg: TEdit
          Left = 3
          Top = 19
          Width = 73
          Height = 21
          Hint = #39'AUTO'#39' para preencher com NOME - POSI'#199#195'O.'
          ParentShowHint = False
          ShowHint = True
          TabOrder = 0
          TextHint = 'Vazio'
          OnExit = edtNameExit
        end
      end
      object grpSampSch: TGroupBox
        Left = 10
        Top = 71
        Width = 83
        Height = 47
        Caption = 'Esquema'
        TabOrder = 6
        object edtSSch: TEdit
          Left = 3
          Top = 20
          Width = 73
          Height = 21
          TabOrder = 0
          TextHint = 'Vazio'
          OnExit = edtNameExit
        end
      end
    end
  end
  object pnlMsg: TPanel
    Left = 393
    Top = 8
    Width = 379
    Height = 233
    TabOrder = 1
    OnMouseEnter = pnl1MouseEnter
    object grp7: TGroupBox
      Left = 8
      Top = 14
      Width = 360
      Height = 211
      Caption = 'Configura'#231#245'es da Mensagem'
      Color = 6022098
      ParentBackground = False
      ParentColor = False
      TabOrder = 0
      object mmoMsg: TMemo
        Left = 16
        Top = 16
        Width = 329
        Height = 57
        Lines.Strings = (
          'Escreva o conte'#250'do da caixa de mensagem.')
        TabOrder = 0
        OnExit = edtNameExit
      end
      object grp8: TGroupBox
        Left = 16
        Top = 79
        Width = 105
        Height = 48
        Caption = 'Caixa'
        TabOrder = 1
        object lbl1: TLabel
          Left = 69
          Top = 23
          Width = 27
          Height = 13
          Caption = 'pixels'
        end
        object seWidth: TSpinEdit
          Left = 3
          Top = 20
          Width = 60
          Height = 22
          Hint = 'Tamanho da caixa de texto da mensagem.'
          MaxValue = 1000
          MinValue = 1
          ParentShowHint = False
          ShowHint = True
          TabOrder = 0
          Value = 600
          OnExit = edtNameExit
        end
      end
      object grp9: TGroupBox
        Left = 15
        Top = 137
        Width = 136
        Height = 48
        Caption = 'Fonte'
        TabOrder = 2
        object seFontSize: TSpinEdit
          Left = 3
          Top = 18
          Width = 46
          Height = 22
          MaxValue = 0
          MinValue = 0
          TabOrder = 0
          Value = 18
          OnExit = edtNameExit
        end
        object pnlFont: TPanel
          Left = 55
          Top = 17
          Width = 71
          Height = 22
          Hint = 'Duplo clique para escolher a cor da fonte da mensagem.'
          Caption = 'Cor'
          Color = clBackground
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentBackground = False
          ParentFont = False
          ParentShowHint = False
          ShowHint = True
          TabOrder = 1
          OnDblClick = pnlBkGndDblClick
          OnExit = edtNameExit
        end
      end
      object rgPrompt: TRadioGroup
        Left = 135
        Top = 79
        Width = 113
        Height = 48
        Caption = 'Prompt'
        Columns = 2
        ItemIndex = 0
        Items.Strings = (
          'N'#227'o'
          'Sim')
        ParentBackground = False
        TabOrder = 3
        OnExit = edtNameExit
      end
    end
  end
  object pnlSimple: TPanel
    Left = 393
    Top = 247
    Width = 379
    Height = 233
    ParentColor = True
    TabOrder = 2
    object tbcStimulus: TTabControl
      Left = 1
      Top = 1
      Width = 377
      Height = 231
      Align = alClient
      TabOrder = 0
      OnChange = cbbStimulusChange
      OnMouseEnter = pnl1MouseEnter
      object grpConsequence: TGroupBox
        Left = 13
        Top = 90
        Width = 276
        Height = 135
        Caption = 'Consequ'#234'ncia'
        Color = 6022098
        ParentBackground = False
        ParentColor = False
        TabOrder = 0
        object grpConseqUsb: TGroupBox
          Left = 131
          Top = 72
          Width = 58
          Height = 44
          Caption = 'USB'
          TabOrder = 0
          object seUSB: TSpinEdit
            Left = 3
            Top = 19
            Width = 52
            Height = 22
            MaxValue = 4
            MinValue = 0
            TabOrder = 0
            Value = 0
            OnChange = seUSBChange
            OnExit = edtNameExit
          end
        end
        object grpConseqPPP: TGroupBox
          Left = 67
          Top = 72
          Width = 58
          Height = 44
          Caption = 'PPP'
          TabOrder = 1
          object seCsq: TSpinEdit
            Left = 3
            Top = 19
            Width = 52
            Height = 22
            MaxValue = 255
            MinValue = 0
            TabOrder = 0
            Value = 0
            OnExit = edtNameExit
          end
        end
        object grpConseqOut: TGroupBox
          Left = 213
          Top = 19
          Width = 58
          Height = 44
          Caption = 'Time-Out'
          TabOrder = 2
          object edtOut: TEdit
            Left = 3
            Top = 19
            Width = 52
            Height = 21
            Hint = 'Ativado se maior que zero; tempo em milisegundos.'
            ParentShowHint = False
            ShowHint = True
            TabOrder = 0
            TextHint = 'Vazio'
            OnExit = edtNameExit
          end
        end
        object grpConseqNxt: TGroupBox
          Left = 3
          Top = 72
          Width = 58
          Height = 44
          Caption = 'Pr'#243'x. T.'
          TabOrder = 3
          object seNxt: TSpinEdit
            Left = 3
            Top = 19
            Width = 52
            Height = 22
            MaxValue = 0
            MinValue = 0
            TabOrder = 0
            Value = 0
            OnExit = edtNameExit
          end
        end
        object grpConseqName: TGroupBox
          Left = 3
          Top = 16
          Width = 140
          Height = 50
          Caption = 'Nome do Arquivo'
          TabOrder = 4
          object edtConseqPic: TEdit
            Left = 3
            Top = 20
            Width = 81
            Height = 21
            Hint = 
              'Dois cliques para escolher a figura, som ou v'#237'deo.'#13#10#13#10'Legenda do' +
              ' C'#243'digo Stm'#13#10#13#10'[arquivo.exten'#231#227'o] [n'#186' de repeti'#231#245'es] [cor] [dura' +
              #231#227'o]'#13#10#13#10#39'arquivo.exten'#231#227'o'#39', ex.: [A1.bmp] [casa.AVI].'#13#10#13#10#39'n'#186' de ' +
              'repeti'#231#245'es'#39' do v'#237'deo ou som.'#13#10#13#10#39'cor'#39' = da janela caso nenhum ar' +
              'quivo seja utilizado.'#13#10#13#10#39'dura'#231#227'o'#39'= dura'#231#227'o da consequ'#234'ncia em m' +
              'ilisegundo, '#13#10'                  se zero nada ser'#225' apresentado.'
            CustomHint = BalloonHint1
            ParentShowHint = False
            ShowHint = True
            TabOrder = 0
            TextHint = 'Vazio'
            OnDblClick = grpPicDblClick
            OnExit = edtNameExit
          end
          object pnlCsqPic: TPanel
            Left = 90
            Top = 20
            Width = 43
            Height = 21
            Caption = 'Cor'
            TabOrder = 1
            OnDblClick = pnlBkGndDblClick
            OnExit = edtNameExit
          end
        end
        object grpConseqTmn: TGroupBox
          Left = 149
          Top = 19
          Width = 58
          Height = 44
          Caption = 'Dura'#231#227'o'
          TabOrder = 5
          object edtTmn: TEdit
            Left = 3
            Top = 19
            Width = 52
            Height = 21
            Hint = 'Ativado se maior que zero; tempo em milisegundos.'
            NumbersOnly = True
            ParentShowHint = False
            ShowHint = True
            TabOrder = 0
            TextHint = 'Vazio'
            OnExit = edtNameExit
          end
        end
      end
      object grpCompStm: TGroupBox
        Left = 13
        Top = 34
        Width = 164
        Height = 50
        Caption = 'Nome do Arquivo'
        Color = 6022098
        ParentBackground = False
        ParentColor = False
        TabOrder = 1
        object edtStm: TEdit
          Left = 3
          Top = 20
          Width = 102
          Height = 21
          Hint = 
            'Dois cliques para escolher a figura, som ou v'#237'deo.'#13#10#13#10'Legenda do' +
            ' C'#243'digo Stm'#13#10#13#10'[arquivo.exten'#231#227'o] [n'#186' de repeti'#231#245'es] [cor]'#13#10#13#10#39'a' +
            'rquivo.exten'#231#227'o'#39', ex.: [A1.bmp] [casa.AVI].'#13#10#39'n'#186' de repeti'#231#245'es'#39' ' +
            'do v'#237'deo ou som.'#13#10#39'cor'#39'  da janela caso nenhum arquivo seja util' +
            'izado.'#13#10
          CustomHint = BalloonHint1
          ParentShowHint = False
          ShowHint = True
          TabOrder = 0
          TextHint = 'Vazio'
          OnDblClick = grpPicDblClick
          OnExit = edtNameExit
        end
        object pnlCol: TPanel
          Left = 111
          Top = 19
          Width = 43
          Height = 22
          Hint = 'Duplo clique para escolher a cor da janela.'
          Caption = 'Cor'
          ParentShowHint = False
          ShowHint = True
          TabOrder = 1
          OnDblClick = pnlBkGndDblClick
          OnExit = edtNameExit
        end
      end
      object grpCompSch: TGroupBox
        Left = 295
        Top = 92
        Width = 58
        Height = 42
        Caption = 'Esquema'
        Color = 6022098
        ParentBackground = False
        ParentColor = False
        TabOrder = 2
        object edtSch: TEdit
          Left = 3
          Top = 15
          Width = 46
          Height = 21
          TabOrder = 0
          TextHint = 'Vazio'
          OnExit = edtNameExit
        end
      end
      object grpCompBnd: TGroupBox
        Left = 295
        Top = 181
        Width = 58
        Height = 44
        Caption = 'Posi'#231#227'o'
        Color = 6022098
        ParentBackground = False
        ParentColor = False
        TabOrder = 3
        object seBnd: TSpinEdit
          Left = 3
          Top = 16
          Width = 46
          Height = 22
          MaxValue = 0
          MinValue = 0
          TabOrder = 0
          Value = 0
          OnExit = edtNameExit
        end
      end
      object grpCompMsg: TGroupBox
        Left = 295
        Top = 138
        Width = 58
        Height = 41
        Caption = 'Relat'#243'rio'
        Color = 6022098
        ParentBackground = False
        ParentColor = False
        TabOrder = 4
        object edtMsg: TEdit
          Left = 3
          Top = 14
          Width = 46
          Height = 21
          Hint = #39'AUTO'#39' para preencher com NOME - POSI'#199#195'O.'
          ParentShowHint = False
          ShowHint = True
          TabOrder = 0
          TextHint = 'Vazio'
          OnExit = edtNameExit
        end
      end
      object rgRes: TRadioGroup
        Left = 183
        Top = 34
        Width = 170
        Height = 52
        Caption = 'Tipo de Resposta'
        Color = 6022098
        Columns = 3
        Items.Strings = (
          'Erro'
          'Acerto'
          'Outro')
        ParentBackground = False
        ParentColor = False
        TabOrder = 5
        OnExit = edtNameExit
      end
    end
  end
  object dlgColor1: TColorDialog
    Left = 852
    Top = 256
  end
  object picDlg: TOpenPictureDialog
    Filter = 
      'Imagem BMP (*.bmp)|*.bmp|Imagem JPEG (*.jpg)|*.jpg|Anima'#231#227'o GIF ' +
      '(*.gif)|*.gif|Audio WAV (*.wav)|*.wav|Audio MID (*.mid)|*.mid|V'#237 +
      'deo MPG (*.mpg)|*.mpg|V'#237'deo AVI (*.avi)|*.avi|V'#237'deo MOV (*.mov)|' +
      '*.mov|V'#237'deo WMV (*.wmv)|*.wmv'
    Left = 915
    Top = 256
  end
  object pmStm: TPopupMenu
    Images = fMain.ImageList1
    TrackButton = tbLeftButton
    OnPopup = pmStmPopup
    Left = 851
    Top = 302
    object miStmLine1: TMenuItem
      Caption = '-'
      Enabled = False
    end
    object miStmStimulusParameters: TMenuItem
      AutoCheck = True
      Caption = 'Aplicar Configura'#231#245'es da Compara'#231#227'o'
      Enabled = False
      ImageIndex = 0
      OnClick = miStmUndClick
    end
    object miStmLine2: TMenuItem
      Caption = '-'
      Enabled = False
    end
    object miPStm: TMenuItem
      Tag = 61
      AutoCheck = True
      Caption = 'Arquivo da Compara'#231#227'o'
      OnClick = stmStandardClick
    end
    object miPCsqStm: TMenuItem
      Tag = 70
      AutoCheck = True
      Caption = 'Arquivo da Consequ'#234'ncia'
    end
    object miPSch: TMenuItem
      Tag = 66
      AutoCheck = True
      Caption = 'Esquema'
      OnClick = stmStandardClick
    end
    object miPCsq: TMenuItem
      Tag = 63
      AutoCheck = True
      Caption = 'Porta Paralela'
      OnClick = stmStandardClick
    end
    object miPBnd: TMenuItem
      Tag = 65
      AutoCheck = True
      Caption = 'Posi'#231#227'o'
      OnClick = stmStandardClick
    end
    object miPNxt: TMenuItem
      Tag = 68
      AutoCheck = True
      Caption = 'Pr'#243'xima Tentativa (Exigido para corre'#231#227'o)'
      OnClick = stmStandardClick
    end
    object miPMsg: TMenuItem
      Tag = 67
      AutoCheck = True
      Caption = 'Relat'#243'rio'
      OnClick = stmStandardClick
    end
    object miPOut: TMenuItem
      Tag = 69
      AutoCheck = True
      Caption = 'Time-Out'
      OnClick = stmStandardClick
    end
    object miPRes: TMenuItem
      Tag = 64
      AutoCheck = True
      Caption = 'Tipo de Resposta'
      OnClick = stmStandardClick
    end
    object miPUsb: TMenuItem
      Tag = 62
      AutoCheck = True
      Caption = 'USB'
      OnClick = stmStandardClick
    end
    object miPAll: TMenuItem
      AutoCheck = True
      Caption = 'Todos'
      OnClick = miStmUndClick
    end
    object miStmLine3: TMenuItem
      Caption = '-'
      Enabled = False
    end
    object miStmUnd: TMenuItem
      Tag = 1
      AutoCheck = True
      Caption = 'ao est'#237'mulo sublinhado'
      OnClick = miStmUndClick
    end
    object miStmChk: TMenuItem
      Tag = 2
      AutoCheck = True
      Caption = 'aos est'#237'mulos marcados'
      OnClick = miStmUndClick
    end
    object miStmTrialUnd: TMenuItem
      Tag = 3
      AutoCheck = True
      Caption = 'aos est'#237'mulos da tentativa sublinhada'
      OnClick = miStmUndClick
    end
    object miStmTrialChk: TMenuItem
      Tag = 4
      AutoCheck = True
      Caption = 'aos est'#237'mulos das tentativas marcadas'
      OnClick = miStmUndClick
    end
    object miStmBlcUnd: TMenuItem
      Tag = 5
      AutoCheck = True
      Caption = 'aos est'#237'mulos do bloco sublinhado'
      OnClick = miStmUndClick
    end
    object miStmBlcChk: TMenuItem
      Tag = 6
      AutoCheck = True
      Caption = 'aos est'#237'mulos dos blocos marcados'
      OnClick = miStmUndClick
    end
    object miStmAll: TMenuItem
      Tag = 7
      AutoCheck = True
      Caption = 'aos est'#237'mulos da sess'#227'o'
      OnClick = miStmUndClick
    end
    object miStmSampleParameters: TMenuItem
      Break = mbBarBreak
      Caption = 'Configura'#231#245'es do  Modelo'
      Enabled = False
      ImageIndex = 0
    end
    object miStmLine4: TMenuItem
      Caption = '-'
    end
    object miSDelay: TMenuItem
      Tag = 81
      AutoCheck = True
      Caption = 'Atraso'
      OnClick = stmStandardClick
    end
    object miSSch: TMenuItem
      Tag = 84
      AutoCheck = True
      Caption = 'Esquema'
      OnClick = stmStandardClick
    end
    object miSPic: TMenuItem
      Tag = 82
      AutoCheck = True
      Caption = 'Figura'
      OnClick = stmStandardClick
    end
    object miSBnd: TMenuItem
      Tag = 83
      AutoCheck = True
      Caption = 'Posi'#231#227'o'
      OnClick = stmStandardClick
    end
    object miSMsg: TMenuItem
      Tag = 85
      AutoCheck = True
      Caption = 'Relat'#243'rio'
      OnClick = stmStandardClick
    end
    object miSAll: TMenuItem
      AutoCheck = True
      Caption = 'Todos'
      OnClick = miStmUndClick
    end
    object miStmLine5: TMenuItem
      Caption = '-'
    end
    object miPrmUnd2: TMenuItem
      Tag = 21
      AutoCheck = True
      Caption = #224' tentativa sublinhada'
      OnClick = miStmUndClick
    end
    object miPrmChk2: TMenuItem
      Tag = 22
      AutoCheck = True
      Caption = #224's tentativas marcadas'
      OnClick = miStmUndClick
    end
    object miPrmBlcUnd2: TMenuItem
      Tag = 23
      AutoCheck = True
      Caption = #224's tentativas do bloco sublinhado'
      OnClick = miStmUndClick
    end
    object miPrmBlcChk2: TMenuItem
      Tag = 24
      AutoCheck = True
      Caption = #224's tentativas dos blocos marcados'
      OnClick = miStmUndClick
    end
    object miPrmAll2: TMenuItem
      Tag = 25
      AutoCheck = True
      Caption = #224's tentativas da sess'#227'o'
      OnClick = miStmUndClick
    end
    object miMessenge: TMenuItem
      Tag = 100
      AutoCheck = True
      Caption = 'Mensagem'
      Checked = True
      Visible = False
    end
  end
  object pmWrite: TPopupMenu
    Images = fMain.ImageList1
    TrackButton = tbLeftButton
    OnPopup = pmStmPopup
    Left = 917
    Top = 302
    object mi1: TMenuItem
      Caption = '-'
      Enabled = False
    end
    object mi2: TMenuItem
      Caption = 'Escrever no editor de texto'
      Enabled = False
      ImageIndex = 0
    end
    object mi9: TMenuItem
      Caption = '-'
      Enabled = False
    end
    object miWriteSessionAndSave: TMenuItem
      Tag = 41
      AutoCheck = True
      Caption = 'Toda a Sess'#227'o e &Salvar'
      OnClick = miStmUndClick
    end
    object miMain: TMenuItem
      Tag = 42
      AutoCheck = True
      Caption = 'Apenas [Main]'
      OnClick = miStmUndClick
    end
    object miPositions: TMenuItem
      Tag = 43
      AutoCheck = True
      Caption = 'Apenas [Positions]'
      OnClick = miStmUndClick
    end
    object miWriteBlcAll: TMenuItem
      Tag = 44
      AutoCheck = True
      Caption = 'Apenas Blocos e Tentativas'
      OnClick = miStmUndClick
    end
    object mi10: TMenuItem
      Caption = '-'
      Enabled = False
    end
    object miWriteK: TMenuItem
      AutoCheck = True
      Caption = 'Incluir Teclas de Suporte'
      Hint = 'Escrever teclas de suporte ap'#243's a escrita de cada tentativa.'
      OnClick = stmStandardClick
    end
    object miWriteKplus: TMenuItem
      AutoCheck = True
      Caption = 'Incluir K+USB ap'#243's positivas'
      Hint = 
        'Par'#226'metro exigido para a libera'#231#227'o de consequ'#234'ncias em esquemas ' +
        'FRFT.'
      OnClick = stmStandardClick
    end
  end
  object pmParameters: TPopupMenu
    Images = fMain.ImageList1
    TrackButton = tbLeftButton
    OnPopup = pmStmPopup
    Left = 788
    Top = 302
    object miPrmLine1: TMenuItem
      Caption = '-'
      Enabled = False
    end
    object mi4: TMenuItem
      AutoCheck = True
      Caption = 'Aplicar Par'#226'metros da Tentativa'
      Enabled = False
      ImageIndex = 0
      OnClick = stmStandardClick
    end
    object miPrmLine2: TMenuItem
      Caption = '-'
    end
    object miPrmUnd: TMenuItem
      Tag = 21
      AutoCheck = True
      Caption = #224' tentativa sublinhada'
      OnClick = miStmUndClick
    end
    object miPrmChk: TMenuItem
      Tag = 22
      AutoCheck = True
      Caption = #224's tentativas marcadas'
      OnClick = miStmUndClick
    end
    object miPrmBlcUnd: TMenuItem
      Tag = 23
      AutoCheck = True
      Caption = #224's tentativas do bloco sublinhado'
      OnClick = miStmUndClick
    end
    object miPrmBlcChk: TMenuItem
      Tag = 24
      AutoCheck = True
      Caption = #224's tentativas dos blocos marcados'
      OnClick = miStmUndClick
    end
    object miPrmAll: TMenuItem
      Tag = 25
      AutoCheck = True
      Caption = #224's tentativas da sess'#227'o'
      OnClick = miStmUndClick
    end
    object miStmStandard: TMenuItem
      AutoCheck = True
      Break = mbBarBreak
      Caption = 'Levar Configura'#231#245'es das Compara'#231#245'es'
      OnClick = miStmUndClick
    end
    object miPrmLine3: TMenuItem
      Caption = '-'
      Enabled = False
    end
    object miPmPic: TMenuItem
      Tag = 61
      AutoCheck = True
      Caption = 'Arquivo da Compara'#231#227'o'
      Enabled = False
      OnClick = stmStandardClick
    end
    object miPmConseqPic: TMenuItem
      Tag = 70
      AutoCheck = True
      Caption = 'Arquivo da Consequ'#234'ncia'
      Enabled = False
      OnClick = stmStandardClick
    end
    object miPmSch: TMenuItem
      Tag = 66
      AutoCheck = True
      Caption = 'Esquema'
      Enabled = False
      OnClick = stmStandardClick
    end
    object miPmCsq: TMenuItem
      Tag = 63
      AutoCheck = True
      Caption = 'Porta Paralela'
      Enabled = False
      OnClick = stmStandardClick
    end
    object miPmBnd: TMenuItem
      Tag = 65
      AutoCheck = True
      Caption = 'Posi'#231#227'o'
      Enabled = False
      OnClick = stmStandardClick
    end
    object miPmNxt: TMenuItem
      Tag = 68
      AutoCheck = True
      Caption = 'Pr'#243'xima Tentativa'
      Enabled = False
      OnClick = stmStandardClick
    end
    object miPmMsg: TMenuItem
      Tag = 67
      AutoCheck = True
      Caption = 'Relat'#243'rio'
      Enabled = False
      OnClick = stmStandardClick
    end
    object miPmOut: TMenuItem
      Tag = 69
      AutoCheck = True
      Caption = 'Time-Out'
      Enabled = False
      OnClick = stmStandardClick
    end
    object miPmRes: TMenuItem
      Tag = 64
      AutoCheck = True
      Caption = 'Tipo de Resposta'
      Enabled = False
      OnClick = stmStandardClick
    end
    object miPmUsb: TMenuItem
      Tag = 62
      AutoCheck = True
      Caption = 'USB'
      Enabled = False
      OnClick = stmStandardClick
    end
    object miPmAll: TMenuItem
      AutoCheck = True
      Caption = 'Todos'
      Enabled = False
      OnClick = miStmUndClick
    end
    object miPrmLine4: TMenuItem
      Caption = '-'
      Enabled = False
    end
    object miSStmStandard: TMenuItem
      AutoCheck = True
      Caption = 'Levar Configura'#231#245'es do Modelo'
      OnClick = miStmUndClick
    end
    object miPrmLine5: TMenuItem
      Caption = '-'
      Enabled = False
    end
    object miSmDelay: TMenuItem
      Tag = 81
      AutoCheck = True
      Caption = 'Atraso'
      Enabled = False
      OnClick = stmStandardClick
    end
    object miSmSch: TMenuItem
      Tag = 84
      AutoCheck = True
      Caption = 'Esquema'
      Enabled = False
      OnClick = stmStandardClick
    end
    object miSmPic: TMenuItem
      Tag = 82
      AutoCheck = True
      Caption = 'Figura'
      Enabled = False
      OnClick = stmStandardClick
    end
    object miSmBnd: TMenuItem
      Tag = 83
      AutoCheck = True
      Caption = 'Posi'#231#227'o'
      Enabled = False
      OnClick = stmStandardClick
    end
    object miSmMsg: TMenuItem
      Tag = 85
      AutoCheck = True
      Caption = 'Relat'#243'rio'
      Enabled = False
      OnClick = stmStandardClick
    end
    object miSmAll: TMenuItem
      AutoCheck = True
      Caption = 'Todos'
      Enabled = False
      OnClick = miStmUndClick
    end
  end
  object BalloonHint1: TBalloonHint
    Left = 789
    Top = 256
  end
  object tmrSaved: TTimer
    OnTimer = tmrSavedTimer
    Left = 790
    Top = 360
  end
end
