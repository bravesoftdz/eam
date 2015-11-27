object fBlocs: TfBlocs
  Left = 0
  Top = 0
  ActiveControl = ToolBar1
  BorderStyle = bsSingle
  Caption = 'Blocos'
  ClientHeight = 295
  ClientWidth = 399
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
  OnCreate = FormCreate
  OnMouseEnter = FormMouseEnter
  PixelsPerInch = 96
  TextHeight = 13
  object pnl1: TPanel
    Left = 8
    Top = 8
    Width = 379
    Height = 278
    ParentShowHint = False
    ShowHint = True
    TabOrder = 0
    object grp1: TGroupBox
      Left = 7
      Top = 35
      Width = 368
      Height = 237
      Caption = 'Par'#226'metros'
      TabOrder = 0
      object grp2: TGroupBox
        Left = 10
        Top = 16
        Width = 212
        Height = 49
        Caption = 'Nome'
        TabOrder = 0
        object edtName: TEdit
          Left = 3
          Top = 20
          Width = 206
          Height = 21
          Hint = 
            'Escreva um nome para a sess'#227'o. Deixar em branco n'#227'o comprometer'#225 +
            ' a execu'#231#227'o da sess'#227'o.'
          ParentShowHint = False
          ShowHint = True
          TabOrder = 0
          OnExit = edtNameExit
        end
      end
      object grpTrial: TGroupBox
        Left = 240
        Top = 74
        Width = 125
        Height = 57
        Caption = 'N'#250'mero de Tentativas'
        TabOrder = 1
        object edtTrials: TEdit
          Left = 14
          Top = 20
          Width = 67
          Height = 21
          Hint = 
            'Legenda do C'#243'digo:'#13#10#13#10'[n'#186' de tentativas] [espa'#231'o] [n'#186' de tentati' +
            'vas agrupadas]'#13#10#13#10#39'n'#186' de tentativas'#39' = N'#250'mero de tentativas.'#13#10#39'n' +
            #186' de tentativas agrupadas'#39' = Define a unidade para o'#13#10'contador d' +
            'e acertos.'#13#10#13#10'Ex.: '#39'25 5'#39';'#13#10#13#10'25 tentativas agrudas de 5 em 5. A' +
            ' cada 5 acertos'#13#10'consecutivos soma-se 1 ao contador de acertos.'
          TabOrder = 0
          OnExit = edtNameExit
        end
        object btnPlusTrial: TButton
          Left = 87
          Top = 15
          Width = 26
          Height = 17
          Caption = '+'
          TabOrder = 1
          OnClick = btnMinusPlusTrialClick
        end
        object btnMinusTrial: TButton
          Left = 87
          Top = 35
          Width = 26
          Height = 17
          Caption = '-'
          TabOrder = 2
          OnClick = btnMinusPlusTrialClick
        end
      end
      object grp4: TGroupBox
        Left = 13
        Top = 71
        Width = 221
        Height = 53
        Caption = 'IET (Intervalo entre Tentativas)'
        TabOrder = 2
        object milisegundos: TLabel
          Left = 79
          Top = 23
          Width = 13
          Height = 13
          Caption = 'ms'
        end
        object edtITI: TEdit
          Left = 14
          Top = 20
          Width = 59
          Height = 21
          NumbersOnly = True
          TabOrder = 0
          OnExit = edtNameExit
        end
        object pnlBkGnd: TPanel
          Left = 106
          Top = 20
          Width = 87
          Height = 26
          Hint = 'Duplo clique para escolher a cor da tela do IET.'
          Caption = 'Cor do Fundo'
          TabOrder = 1
          OnDblClick = pnlBkGndDblClick
          OnExit = edtNameExit
        end
      end
      object grp5: TGroupBox
        Left = 10
        Top = 130
        Width = 246
        Height = 104
        Caption = 'Crit'#233'rios de Encerramento do Bloco'
        TabOrder = 3
        object lbledtCrtHitConsc: TLabeledEdit
          Left = 14
          Top = 32
          Width = 105
          Height = 21
          EditLabel.Width = 104
          EditLabel.Height = 13
          EditLabel.Caption = 'Acertos Consecutivos'
          TabOrder = 0
          OnExit = edtNameExit
        end
        object lbledtCrtMaxTrial: TLabeledEdit
          Left = 14
          Top = 72
          Width = 105
          Height = 21
          EditLabel.Width = 105
          EditLabel.Height = 13
          EditLabel.Caption = 'M'#225'ximo de Tentativas'
          TabOrder = 1
          OnExit = edtNameExit
        end
        object lbledtCrtMissConsec: TLabeledEdit
          Left = 125
          Top = 32
          Width = 105
          Height = 21
          EditLabel.Width = 92
          EditLabel.Height = 13
          EditLabel.Caption = 'Erros Consecutivos'
          TabOrder = 2
          OnExit = edtNameExit
        end
      end
      object GroupBox1: TGroupBox
        Left = 262
        Top = 137
        Width = 103
        Height = 47
        Caption = 'M'#225'x. de Corre'#231#245'es'
        TabOrder = 4
        object edtMaxCorrection: TEdit
          Left = 14
          Top = 20
          Width = 67
          Height = 21
          Hint = 
            'M'#225'ximo de tentativas de corre'#231#227'o que ser'#227'o apresentadas a cada t' +
            'entativa configurada para apresentar "corre'#231#245'es".'
          TabOrder = 0
          OnExit = edtNameExit
        end
      end
      object GroupBox2: TGroupBox
        Left = 262
        Top = 190
        Width = 103
        Height = 47
        Caption = 'Acertos p/ K+Csq'
        TabOrder = 5
        object edtCsqCriterion: TEdit
          Left = 14
          Top = 20
          Width = 67
          Height = 21
          Hint = 
            'N'#250'mero de acertos consecutivos para apresenta'#231#227'o de uma consequ'#234 +
            'ncia adicional (derterminada pelo c'#243'digo K+Csq=).'
          ParentShowHint = False
          ShowHint = True
          TabOrder = 0
          OnExit = edtNameExit
        end
      end
      object grpBlcs: TGroupBox
        Left = 240
        Top = 11
        Width = 125
        Height = 57
        Caption = 'N'#250'mero de Blocos'
        TabOrder = 6
        object edtBlcs: TEdit
          Left = 14
          Top = 20
          Width = 67
          Height = 21
          Color = clBtnFace
          TabOrder = 0
          OnKeyPress = edtBlcsKeyPress
        end
        object btnPlusBlc: TButton
          Left = 87
          Top = 15
          Width = 26
          Height = 17
          Caption = '+'
          TabOrder = 1
          OnClick = btnMinusPlusBlcClick
        end
        object btnMinusBlc: TButton
          Left = 87
          Top = 35
          Width = 26
          Height = 17
          Caption = '-'
          TabOrder = 2
          OnClick = btnMinusPlusBlcClick
        end
      end
    end
    object ToolBar1: TToolBar
      Left = 1
      Top = 1
      Width = 377
      Height = 29
      Caption = 'ToolBar1'
      EdgeBorders = [ebBottom]
      Images = fMain.ImageList1
      TabOrder = 1
      object ToolButton1: TToolButton
        Left = 0
        Top = 0
        Hint = 'Par'#226'metros.'
        Caption = 'ToolButton1'
        DropdownMenu = pm1
        ImageIndex = 20
        Style = tbsDropDown
        OnClick = btnAplicarClick
      end
      object ToolButton2: TToolButton
        Left = 38
        Top = 0
        Hint = 'Escrita.'
        Caption = 'ToolButton2'
        DropdownMenu = pmWrite
        ImageIndex = 13
        Style = tbsDropDown
        OnClick = btnAplicarClick
      end
      object btn2: TToolButton
        Left = 76
        Top = 0
        Width = 8
        Caption = 'btn2'
        ImageIndex = 4
        Style = tbsSeparator
      end
      object BitBtn1: TBitBtn
        Left = 84
        Top = 0
        Width = 75
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
      object btn3: TToolButton
        Left = 159
        Top = 0
        Width = 8
        Caption = 'btn3'
        ImageIndex = 3
        Style = tbsSeparator
      end
      object pnlSaved: TPanel
        Left = 167
        Top = 0
        Width = 76
        Height = 22
        BevelInner = bvLowered
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentBackground = False
        ParentFont = False
        TabOrder = 2
      end
      object btnShowTrials: TButton
        Left = 243
        Top = 0
        Width = 131
        Height = 22
        Caption = 'Mostrar Tentativas'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 1
        OnClick = btnShowTrialsClick
      end
    end
  end
  object dlgColor1: TColorDialog
    Color = 15782030
    CustomColors.Strings = (
      'ColorA=000000'
      'ColorB=FFFFFFFF'
      'ColorC=FFFFFFFF'
      'ColorD=FFFFFFFF'
      'ColorE=FFFFFFFF'
      'ColorF=FFFFFFFF'
      'ColorG=FFFFFFFF'
      'ColorH=FFFFFFFF'
      'ColorI=FFFFFFFF'
      'ColorJ=FFFFFFFF'
      'ColorK=FFFFFFFF'
      'ColorL=FFFFFFFF'
      'ColorM=FFFFFFFF'
      'ColorN=FFFFFFFF'
      'ColorO=FFFFFFFF'
      'ColorP=FFFFFFFF')
    Left = 64
    Top = 80
  end
  object pm1: TPopupMenu
    Images = fMain.ImageList1
    OnPopup = pm1Popup
    Left = 104
    Top = 80
    object N2: TMenuItem
      Caption = '-'
      Enabled = False
    end
    object Parameters: TMenuItem
      Caption = 'Aplicar Par'#226'metros'
      Enabled = False
      ImageIndex = 0
      OnClick = prmNamesClick
    end
    object N3: TMenuItem
      Caption = '-'
      Enabled = False
    end
    object prmBlcUnd: TMenuItem
      Tag = 1
      AutoCheck = True
      Caption = 'ao bloco sublinhado'
      Checked = True
      OnClick = prmBlcUndClick
    end
    object prmBlcChk: TMenuItem
      Tag = 2
      AutoCheck = True
      Caption = 'aos blocos marcados'
      OnClick = prmBlcUndClick
    end
    object prmBlcAll: TMenuItem
      Tag = 3
      AutoCheck = True
      Caption = 'a todos os blocos'
      OnClick = prmBlcUndClick
    end
    object prmNames: TMenuItem
      AutoCheck = True
      Caption = 'enumerar nomes'
      Enabled = False
      Hint = 'Quando aplicar par'#226'metros a mais de um bloco.'
      OnClick = prmBlcUndClick
    end
  end
  object pmWrite: TPopupMenu
    Images = fMain.ImageList1
    OnPopup = pm1Popup
    Left = 144
    Top = 80
    object Escrever1: TMenuItem
      Caption = 'Escrever'
      Enabled = False
      ImageIndex = 0
    end
    object N1: TMenuItem
      Caption = '-'
      Enabled = False
    end
    object pBlcUnd: TMenuItem
      Tag = 4
      AutoCheck = True
      Caption = 'Bloco sublinhado'
      OnClick = prmBlcUndClick
    end
    object pBlcChk: TMenuItem
      Tag = 5
      AutoCheck = True
      Caption = 'Blocos marcados'
      OnClick = prmBlcUndClick
    end
    object pBlcAll: TMenuItem
      Tag = 6
      AutoCheck = True
      Caption = 'Todos os blocos'
      OnClick = prmBlcUndClick
    end
    object pMain: TMenuItem
      AutoCheck = True
      Caption = 'Main'
      OnClick = prmBlcUndClick
    end
    object pPositions: TMenuItem
      AutoCheck = True
      Caption = 'Posi'#231#245'es'
      OnClick = prmBlcUndClick
    end
  end
  object tmrSaved: TTimer
    OnTimer = tmrSavedTimer
    Left = 192
    Top = 80
  end
end
