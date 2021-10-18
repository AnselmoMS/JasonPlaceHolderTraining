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
  object btnImportData: TButton
    Left = 239
    Top = 136
    Width = 242
    Height = 51
    Caption = 'Save Posts to DB'
    TabOrder = 0
    OnClick = btnImportDataClick
  end
  object btnDownloadPosts: TButton
    Left = 24
    Top = 8
    Width = 201
    Height = 50
    Caption = 'Download Posts'
    TabOrder = 1
    OnClick = btnDownloadPostsClick
  end
  object dbgrdPostList: TDBGrid
    Left = 507
    Top = 77
    Width = 465
    Height = 257
    DataSource = dsList
    TabOrder = 2
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
  end
  object btnListPosts: TButton
    Left = 507
    Top = 29
    Width = 465
    Height = 42
    Caption = 'Listar todos os registros do banco'
    TabOrder = 3
    OnClick = btnListPostsClick
  end
  object Memo1: TMemo
    Left = 24
    Top = 193
    Width = 457
    Height = 128
    TabOrder = 4
  end
  object edtTitle: TEdit
    Left = 512
    Top = 424
    Width = 441
    Height = 21
    Enabled = False
    TabOrder = 5
  end
  object memBody: TMemo
    Left = 512
    Top = 464
    Width = 441
    Height = 89
    Enabled = False
    TabOrder = 6
  end
  object btDelete: TButton
    Left = 512
    Top = 584
    Width = 106
    Height = 57
    Caption = 'Delete'
    Enabled = False
    TabOrder = 7
    OnClick = btDeleteClick
  end
  object btEdit: TButton
    Left = 624
    Top = 584
    Width = 89
    Height = 57
    Caption = 'Edit'
    Enabled = False
    TabOrder = 8
    OnClick = btEditClick
  end
  object btSave: TButton
    Left = 719
    Top = 584
    Width = 97
    Height = 57
    Caption = 'Save'
    Enabled = False
    TabOrder = 9
    OnClick = btSaveClick
  end
  object btShow: TButton
    Left = 803
    Top = 340
    Width = 169
    Height = 42
    Caption = 'Carregar registro selecionado'
    TabOrder = 10
    OnClick = btShowClick
  end
  object btnLoadFromFile: TButton
    Left = 239
    Top = 8
    Width = 242
    Height = 50
    Caption = 'Load From File'
    TabOrder = 11
    OnClick = btnLoadFromFileClick
  end
  object btnClearDBPosts: TButton
    Left = 24
    Top = 136
    Width = 201
    Height = 51
    Caption = 'Apagar registros do banco'
    TabOrder = 12
    OnClick = btnClearDBPostsClick
  end
  object dsList: TDataSource
    Left = 512
    Top = 104
  end
end
