program UFC;

uses
  Vcl.Forms,
  U_Main in 'U_Main.pas' {F_Main},
  U_Param in 'U_Param.pas' {F_Param},
  Vcl.Themes,
  Vcl.Styles,
  U_DataModule1 in 'U_DataModule1.pas' {DataModule1: TDataModule},
  U_RDV in 'U_RDV.pas' {F_RDV},
  U_Log in 'U_Log.pas' {Log},
  U_Sign in 'U_Sign.pas' {Sign};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TLog, Log);
  Application.CreateForm(TDataModule1, DataModule1);
  Application.CreateForm(TF_Main, F_Main);
  Application.CreateForm(TF_Param, F_Param);
  Application.CreateForm(TF_RDV, F_RDV);
  Application.CreateForm(TSign, Sign);
  Application.Run;
end.
