object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 660
  ClientWidth = 996
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
    Left = 312
    Top = 271
    Width = 169
    Height = 57
    Caption = 'Save Posts to DB'
    TabOrder = 0
    OnClick = btnImportDataClick
  end
  object btnDownloadPosts: TButton
    Left = 8
    Top = 8
    Width = 139
    Height = 50
    Caption = 'Download Posts'
    TabOrder = 1
    OnClick = btnDownloadPostsClick
  end
  object dbgrdPostList: TDBGrid
    Left = 504
    Top = 8
    Width = 465
    Height = 257
    TabOrder = 2
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
  end
  object btnListPosts: TButton
    Left = 800
    Top = 279
    Width = 169
    Height = 42
    Caption = 'List Posts'
    TabOrder = 3
    OnClick = btnListPostsClick
  end
  object Memo1: TMemo
    Left = 24
    Top = 353
    Width = 457
    Height = 288
    TabOrder = 4
  end
  object edtTitle: TEdit
    Left = 512
    Top = 424
    Width = 441
    Height = 21
    TabOrder = 5
  end
  object memBody: TMemo
    Left = 512
    Top = 464
    Width = 441
    Height = 89
    TabOrder = 6
  end
  object btDelete: TButton
    Left = 512
    Top = 584
    Width = 106
    Height = 57
    Caption = 'Delete'
    TabOrder = 7
    OnClick = btDeleteClick
  end
  object btEdit: TButton
    Left = 624
    Top = 584
    Width = 89
    Height = 57
    Caption = 'Edit'
    TabOrder = 8
    OnClick = btEditClick
  end
  object btSave: TButton
    Left = 719
    Top = 584
    Width = 97
    Height = 57
    Caption = 'Save'
    TabOrder = 9
    OnClick = btSaveClick
  end
  object btShow: TButton
    Left = 679
    Top = 279
    Width = 97
    Height = 42
    Caption = 'Save'
    TabOrder = 10
    OnClick = btShowClick
  end
  object btnLoadFromFile: TButton
    Left = 160
    Top = 8
    Width = 139
    Height = 50
    Caption = 'Load From File'
    TabOrder = 11
    OnClick = btnLoadFromFileClick
  end
  object btnLoadListObject: TButton
    Left = 312
    Top = 8
    Width = 139
    Height = 50
    Caption = 'Load list object from text'
    TabOrder = 12
    OnClick = btnLoadListObjectClick
  end
  object Panel1: TPanel
    Left = 24
    Top = 184
    Width = 275
    Height = 144
    Caption = 'Panel1'
    ShowCaption = False
    TabOrder = 13
  end
  object dsList: TDataSource
    Left = 528
    Top = 280
  end
end
