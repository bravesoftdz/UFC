object DataModule1: TDataModule1
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 165
  Width = 440
  object FDConnection1: TFDConnection
    Params.Strings = (
      'Encrypt=aes-128'
      'DriverID=sQLite')
    Left = 151
    Top = 38
  end
  object FDQuery1: TFDQuery
    Connection = FDConnection1
    SQL.Strings = (
      'Select * from Rendez_Vous')
    Left = 199
    Top = 38
  end
  object DataSource1: TDataSource
    DataSet = FDQuery1
    Left = 255
    Top = 38
  end
  object FDQuery2: TFDQuery
    Connection = FDConnection1
    SQL.Strings = (
      'Select theme from Param')
    Left = 184
    Top = 104
  end
  object DataSource2: TDataSource
    DataSet = FDQuery2
    Left = 256
    Top = 104
  end
end
