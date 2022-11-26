object frmListaUsuarios: TfrmListaUsuarios
  Left = 0
  Top = 0
  Caption = 'Lista Usu'#225'rios'
  ClientHeight = 472
  ClientWidth = 631
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 216
    Top = 15
    Width = 176
    Height = 19
    Caption = 'Usu'#225'rios Cadastrados'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object mmListaUsuarios: TMemo
    Left = 120
    Top = 40
    Width = 377
    Height = 401
    Lines.Strings = (
      '')
    TabOrder = 0
  end
end
