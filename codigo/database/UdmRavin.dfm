object dmRavin: TdmRavin
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 421
  Width = 603
  object cnxBancoDeDados: TFDConnection
    Params.Strings = (
      'User_Name=root'
      'Server='
      'Port='
      'DriverID=MySQL')
    UpdateOptions.AssignedValues = [uvUpdateMode]
    AfterConnect = cnxBancoDeDadosAfterConnect
    BeforeConnect = cnxBancoDeDadosBeforeConnect
    Left = 40
    Top = 24
  end
  object drvBancoDeDados: TFDPhysMySQLDriverLink
    VendorLib = 'C:\Users\murilobatista\Documents\ravin\bibliotecas\libmysql.dll'
    Left = 40
    Top = 80
  end
  object wtcBancoDeDados: TFDGUIxWaitCursor
    Provider = 'Forms'
    Left = 40
    Top = 136
  end
end
