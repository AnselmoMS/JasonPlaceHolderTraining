object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 660
  ClientWidth = 980
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object lblID: TLabel
    Left = 512
    Top = 353
    Width = 20
    Height = 13
    Caption = 'lblId'
  end
  object lblUserId: TLabel
    Left = 512
    Top = 385
    Width = 42
    Height = 13
    Caption = 'lblUserId'
  end
  object lblTitleError: TLabel
    Left = 512
    Top = 445
    Width = 54
    Height = 13
    Caption = 'lblTitleError'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clRed
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object lblBodyError: TLabel
    Left = 512
    Top = 555
    Width = 54
    Height = 13
    Caption = 'lblTitleError'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clRed
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label1: TLabel
    Left = 224
    Top = 58
    Width = 14
    Height = 13
    Caption = 'log'
  end
  object dbgrdPostList: TDBGrid
    Left = 512
    Top = 77
    Width = 460
    Height = 213
    DataSource = dsList
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
  end
  object Memo1: TMemo
    Left = 224
    Top = 77
    Width = 265
    Height = 213
    TabOrder = 1
  end
  object edtTitle: TEdit
    Left = 512
    Top = 424
    Width = 441
    Height = 21
    Enabled = False
    TabOrder = 2
  end
  object memBody: TMemo
    Left = 512
    Top = 464
    Width = 441
    Height = 89
    Enabled = False
    TabOrder = 3
  end
  object btDelete: TButton
    Left = 512
    Top = 584
    Width = 106
    Height = 44
    Caption = 'Delete'
    Enabled = False
    TabOrder = 4
    OnClick = btDeleteClick
  end
  object btEdit: TButton
    Left = 624
    Top = 584
    Width = 89
    Height = 44
    Caption = 'Edit'
    Enabled = False
    TabOrder = 5
    OnClick = btEditClick
  end
  object btSave: TButton
    Left = 719
    Top = 584
    Width = 97
    Height = 44
    Caption = 'Save'
    Enabled = False
    TabOrder = 6
    OnClick = btSaveClick
  end
  object btShow: TButton
    Left = 803
    Top = 308
    Width = 169
    Height = 42
    Caption = 'Carregar registro selecionado'
    TabOrder = 7
    OnClick = btShowClick
  end
  object btnListPosts: TButton
    Left = 744
    Top = 29
    Width = 228
    Height = 42
    Caption = 'Listar todos os registros do banco'
    TabOrder = 8
    OnClick = btnListPostsClick
  end
  object btnClearDBPosts: TButton
    Left = 24
    Top = 79
    Width = 162
    Height = 58
    Caption = '1 - Clear DataBase'
    TabOrder = 9
    OnClick = btnClearDBPostsClick
  end
  object btnDownloadPosts: TButton
    Left = 24
    Top = 149
    Width = 162
    Height = 63
    Caption = '2 - Download Posts'
    TabOrder = 10
    OnClick = btnDownloadPostsClick
  end
  object btnImportData: TButton
    Left = 24
    Top = 225
    Width = 162
    Height = 65
    Caption = '3 - Save Posts to DB'
    TabOrder = 11
    OnClick = btnImportDataClick
  end
  object btnLoadFromFile: TButton
    Left = 24
    Top = 8
    Width = 162
    Height = 57
    Caption = 'Load From File'
    TabOrder = 12
    Visible = False
    OnClick = btnLoadFromFileClick
  end
  object dsList: TDataSource
    Left = 520
    Top = 80
  end
end
