unit U_Sign;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, U_DataModule1;

type
  TSign = class(TForm)
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    Edit4: TEdit;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Sign: TSign;

implementation

{$R *.dfm}

procedure TSign.Button1Click(Sender: TObject);
var
  User_Tab :String;
  btn      :Integer;
begin
  User_Tab:=Edit2.Text;
  With DataModule1.FDQuery3 do
    Begin
      SQL.Text:='Select * from Users';
      Active:=True;
      Insert;
      FieldByName('Nom').AsString:=Edit1.Text;
      FieldByName('Pseudo').AsString:=Edit2.Text;
      if (Edit3.Text = Edit4.Text) then
        FieldByName('Mot_de_Pass').AsString:=Edit4.Text
      else
        btn:=MessageDlg('Mot de Pass Not Math Pas Resseyer de Nouveau !', mtError,[mbRetry],0);
          if (btn = mrRetry) then
            Begin
              Edit3.Text:='';
              Edit4.Text:='';
              Edit3.SetFocus;
            End;
      Post;
    End;
  With DataModule1 do
    Begin
      FDCommand1.CommandText.Text:='Create Table"'+User_Tab+'_RDV"(ID_RDV INTEGER NOT NULL PRIMARY KEY, Nom varchar(10), Prenom varchar(10), N_de_ID bigint, Date_de_RDV, Gendre varchar(5), Type varchar(8));'+
                        'Create Table"'+User_Tab+'_Param"(ID_Param INTEGER NOT NULL PRIMARY KEY, Theme varchar(20));';
      FDCommand1.Active:=true;
      FDCommand1.Execute;
    End;
end;

procedure TSign.Button2Click(Sender: TObject);
begin
  Edit1.Text:='';
  Edit2.Text:='';
  Edit3.Text:='';
  Edit4.Text:='';
  Edit1.SetFocus;
end;

procedure TSign.Button3Click(Sender: TObject);
begin
Sign.Close;
end;

end.
