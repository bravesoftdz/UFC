unit U_Param;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Themes, Vcl.Styles, U_DataModule1, U_RDV,
  Vcl.ComCtrls, Vcl.ExtCtrls, Vcl.WinXCtrls;

type
  TF_Param = class(TForm)
    GroupBox1: TGroupBox;
    ComboBox1: TComboBox;
    Panel1: TPanel;
    ToggleSwitch1: TToggleSwitch;
    ToggleSwitch2: TToggleSwitch;
    ToggleSwitch3: TToggleSwitch;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure ComboBox1Change(Sender: TObject);
    procedure ToggleSwitch1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  F_Param: TF_Param;
    var Styles, Style :String;
implementation

{$R *.dfm}

//Utilisateur Choisir un Th�me

procedure TF_Param.ComboBox1Change(Sender: TObject);
begin
//Selectioner Le Style est savgarder le dans la base de donne�
  With DataModule1.FDQuery2 do
    begin
    for Styles in TStyleManager.StyleNames do
        Begin
          if (ComboBox1.Text = Styles) then
            Begin
              TStyleManager.SetStyle(Styles);
              Edit;
              FieldByName('Theme').AsString:=Styles;
              Post;
            End;
        End;
    end;
end;
//Appliquer le Th�me Que l'uiliqtateur choisir le derni�r foix

procedure TF_Param.FormCreate(Sender: TObject);
begin
//Boucl� sur tous les Style disponsible
  ComboBox1.Clear;
  for Styles in TStyleManager.StyleNames do
    ComboBox1.Items.Add(Styles);
//lire le style a partir de base de done�
  Style:=DataModule1.FDQuery2.FieldByName('Theme').AsString;
//appliquer le Style
  TStyleManager.SetStyle(Style);
end;
//Switcher On est Off les Param�tre

procedure TF_Param.ToggleSwitch1Click(Sender: TObject);
begin
  if (ToggleSwitch1.State = tssOff) then
      F_RDV.Panel3.Visible:=False
  else
      F_RDV.Panel3.Visible:=True;
end;

end.
