object DataModule1: TDataModule1
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 143
  Width = 439
  object FDConnection1: TFDConnection
    Params.Strings = (
      'Encrypt=aes-128'
      'DriverID=sQLite')
    Connected = True
    LoginPrompt = False
    Left = 31
    Top = 14
  end
  object FDQuery1: TFDQuery
    Connection = FDConnection1
    SQL.Strings = (
      'Select * from Rendez_Vous')
    Left = 79
    Top = 14
  end
  object DataSource1: TDataSource
    DataSet = FDQuery1
    Left = 127
    Top = 14
  end
  object FDQuery2: TFDQuery
    Connection = FDConnection1
    SQL.Strings = (
      'Select theme from Param')
    Left = 80
    Top = 72
  end
  object DataSource2: TDataSource
    DataSet = FDQuery2
    Left = 128
    Top = 72
  end
  object FDCommand1: TFDCommand
    Connection = FDConnection2
    Left = 32
    Top = 72
  end
  object FDConnection2: TFDConnection
    Params.Strings = (
      'DriverID=sQLite')
    Left = 288
    Top = 16
  end
  object FDQuery3: TFDQuery
    Connection = FDConnection2
    Left = 368
    Top = 24
  end
end
