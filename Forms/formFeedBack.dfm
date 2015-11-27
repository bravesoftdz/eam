object fFeedBack: TfFeedBack
  Left = 0
  Top = 0
  ActiveControl = pnlBkGndCount
  AlphaBlend = True
  AlphaBlendValue = 150
  BorderStyle = bsSingle
  Caption = 'Feedback'
  ClientHeight = 291
  ClientWidth = 528
  Color = clBtnFace
  DefaultMonitor = dmDesktop
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
  Position = poScreenCenter
  ShowHint = True
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object pnlBlcCurrent: TPanel
    Left = 287
    Top = 8
    Width = 44
    Height = 41
    Hint = 'Bloco atual.'
    ParentShowHint = False
    ShowHint = True
    TabOrder = 0
  end
  object pnlTrialCurrent: TPanel
    Left = 287
    Top = 55
    Width = 44
    Height = 41
    Hint = 'Tentativa atual.'
    ParentShowHint = False
    ShowHint = True
    TabOrder = 2
  end
  object pnlLatency: TPanel
    Left = 431
    Top = 102
    Width = 87
    Height = 41
    Hint = 
      'Lat'#234'ncia (Entre a apresenta'#231#227'o de uma tentativa e a ocorr'#234'ncia d' +
      'e uma Consequ'#234'ncia).'
    ParentShowHint = False
    ShowHint = True
    TabOrder = 4
  end
  object pnlClock: TPanel
    Left = 431
    Top = 8
    Width = 87
    Height = 41
    Hint = 'Rel'#243'gio do Sistema Operacional.'
    ParentShowHint = False
    ShowHint = True
    TabOrder = 5
  end
  object pnlSessionDuration: TPanel
    Left = 431
    Top = 55
    Width = 87
    Height = 41
    Hint = 'Dura'#231#227'o da Sess'#227'o.'
    ParentShowHint = False
    ShowHint = True
    TabOrder = 6
  end
  object pnlBlcTotal: TPanel
    Left = 337
    Top = 8
    Width = 44
    Height = 41
    Hint = 'Total de Blocos.'
    ParentShowHint = False
    ShowHint = True
    TabOrder = 1
  end
  object pnlTrialTotal: TPanel
    Left = 337
    Top = 55
    Width = 44
    Height = 41
    Hint = 'Total de Tentativas.'
    ParentShowHint = False
    ShowHint = True
    TabOrder = 3
  end
  object pnlConsequenceCount: TPanel
    Left = 108
    Top = 126
    Width = 44
    Height = 41
    Hint = 'Contador de Consequ'#234'ncias.'
    ParentShowHint = False
    ShowHint = True
    TabOrder = 7
  end
  object pnlBkGndCount: TPanel
    Left = 58
    Top = 126
    Width = 44
    Height = 41
    Hint = 'Contador de Respostas no Fundo.'
    ParentShowHint = False
    ShowHint = True
    TabOrder = 8
  end
  object pnlResponseCount: TPanel
    Left = 8
    Top = 126
    Width = 44
    Height = 41
    Hint = 'Contador de Respostas nos Est'#237'mulos.'
    ParentShowHint = False
    ShowHint = True
    TabOrder = 9
  end
  object pnlConsecutiveHit: TPanel
    Left = 58
    Top = 196
    Width = 44
    Height = 41
    Hint = 'Corretas consecutivas no Bloco.'
    ParentShowHint = False
    ShowHint = True
    TabOrder = 10
  end
  object pnlConsecutiveMiss: TPanel
    Left = 58
    Top = 243
    Width = 44
    Height = 41
    Hint = 'Erradas consecutivas no Bloco.'
    ParentShowHint = False
    ShowHint = True
    TabOrder = 11
  end
  object pnlHitCount: TPanel
    Left = 8
    Top = 196
    Width = 44
    Height = 41
    Hint = 'Total de Corretas no Bloco.'
    ParentShowHint = False
    ShowHint = True
    TabOrder = 12
  end
  object pnlMissCount: TPanel
    Left = 8
    Top = 243
    Width = 44
    Height = 41
    Hint = 'Total de Erradas no Bloco.'
    ParentShowHint = False
    ShowHint = True
    TabOrder = 13
  end
  object pnlHighConsecutiveHit: TPanel
    Left = 108
    Top = 196
    Width = 44
    Height = 41
    Hint = 'M'#225'ximo de Corretas consecutivas no Bloco.'
    ParentShowHint = False
    ShowHint = True
    TabOrder = 14
  end
  object pnlHighConsecutiveMiss: TPanel
    Left = 108
    Top = 243
    Width = 44
    Height = 41
    Hint = 'M'#225'ximo de Erradas consecutivas no Bloco.'
    ParentShowHint = False
    ShowHint = True
    TabOrder = 15
  end
  object pnlBlcCorrections: TPanel
    Left = 208
    Top = 243
    Width = 44
    Height = 41
    Hint = 'Corre'#231#245'es no Bloco'
    ParentShowHint = False
    ShowHint = True
    TabOrder = 16
  end
  object pnlBlcCscCorrections: TPanel
    Left = 158
    Top = 243
    Width = 44
    Height = 41
    Hint = 'Corre'#231#245'es Consecutivas'
    ParentShowHint = False
    ShowHint = True
    TabOrder = 17
  end
  object pnlVirtualTrialLoop: TPanel
    Left = 158
    Top = 55
    Width = 44
    Height = 41
    Hint = 'Virtual Trial Loop'
    ParentShowHint = False
    ShowHint = True
    TabOrder = 18
  end
  object pnlVirtualTrial: TPanel
    Left = 108
    Top = 55
    Width = 44
    Height = 41
    Hint = 'Virtual Trial'
    ParentShowHint = False
    ShowHint = True
    TabOrder = 19
  end
  object pnlBlcCsqHits: TPanel
    Left = 158
    Top = 196
    Width = 44
    Height = 41
    Hint = 'CsqCriterion Hit Loop'
    ParentShowHint = False
    ShowHint = True
    TabOrder = 20
  end
  object pnlVirtualHitLoop: TPanel
    Left = 58
    Top = 55
    Width = 44
    Height = 41
    Hint = 'Virtual Hit Loop'
    ParentShowHint = False
    ShowHint = True
    TabOrder = 21
  end
  object pnlHits: TPanel
    Left = 208
    Top = 196
    Width = 44
    Height = 41
    Hint = 'Hits'
    ParentShowHint = False
    ShowHint = True
    TabOrder = 22
  end
  object pnlVirtualHits: TPanel
    Left = 8
    Top = 55
    Width = 44
    Height = 41
    Hint = 'Hits'
    ParentShowHint = False
    ShowHint = True
    TabOrder = 23
  end
end
