unit U_Main;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, U_Param, U_DataModule1, U_RDV,
  Vcl.WinXCalendars, Vcl.ExtCtrls, Vcl.WinXCtrls, Vcl.Buttons, System.ImageList,
  Vcl.ImgList;

type
  TF_Main = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    procedure Button2Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  F_Main: TF_Main;

implementation
{$R *.dfm}

procedure TF_Main.Button1Click(Sender: TObject);
begin
  F_RDV.Show;
end;

procedure TF_Main.Button2Click(Sender: TObject);
var
  Button :Integer;
begin
  Button:=MessageDlg('Vous pouvez sorti� le Programme', mtConfirmation, [mbYes,mbNo],0);
  if (Button = mrYes) then
    halt(0);
end;

procedure TF_Main.Button4Click(Sender: TObject);
begin
  F_Param.Show;
end;

end.
