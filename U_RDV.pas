unit U_RDV;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, Vcl.ExtCtrls, Vcl.StdCtrls,
  Data.DB, Vcl.Grids, Vcl.DBGrids, Vcl.DBCtrls, U_DataModule1;

type
  TF_RDV = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    DateTimePicker1: TDateTimePicker;
    RadioGroup1: TRadioGroup;
    Edit4: TEdit;
    Edit5: TEdit;
    DateTimePicker2: TDateTimePicker;
    ComboBox1: TComboBox;
    DBNavigator1: TDBNavigator;
    DBGrid1: TDBGrid;
    Edit6: TEdit;
    Image1: TImage;
    Button5: TButton;
    Button4: TButton;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    TabSheet3: TTabSheet;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Splitter1: TSplitter;
    procedure Button3Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure FormResize(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  F_RDV: TF_RDV;

implementation

{$R *.dfm}

procedure TF_RDV.Button1Click(Sender: TObject);
var
Date:TDateTime;
begin
//Vid� tous les champ est d�finis le focus en la premi�re champ
  Date:=strToDateTime('01/01/1900');
  Edit1.Text:='';
  Edit2.Text:='';
  Edit3.Text:='';
  Edit4.Text:='';
  Edit5.Text:='';
  RadioGroup1.CleanupInstance;
  ComboBox1.ClearSelection;
  DateTimePicker1.Date:=Date;
  RadioGroup1.ItemIndex:=-1;
  Edit1.SetFocus;
end;

procedure TF_RDV.Button2Click(Sender: TObject);
var
  TDate1, TDate2 : TDateTime;
  Date1, Date2: String;
  msg :Integer;
begin
//Si Le Champs est Vide
if (Edit1.Text='') and (edit2.Text='') and (ComboBox1.Items.Text='') then
begin
  msg := MessageDlg('S''il vous plait Remplir les champs minimum requis',mtWarning, [mbRetry],0);
  if (msg = mrRetry) then
    Edit1.SetFocus;
end
//Sinon Executer
else
begin
  With DataModule1.FDQuery1 Do
  Begin
    Insert;
    FieldByName('Nom').AsString:=edit1.Text;
    FieldByName('Prenom').AsString:=edit2.Text;
    //contourner l'exception de Base de Donne� en cas de champ vide
    try
      FieldByName('N_de_ID').Value:=edit3.Text;
    except on E: Exception do
      Begin
        msg := Messagedlg('S''il vous plait sais le N� de ID carte ', mtWarning, [mbRetry],0);
        if (msg = mrRetry) then
          Begin
            DBNavigator1.BtnClick(nbCancel);
            Edit3.Clear;
            Edit3.SetFocus;
            Edit;
          end;
      End;
    end;
    TDate1:=DateTimePicker1.Date;
    Date1:=DateTimeToStr(TDate1);
    FieldByName('Date_de_Naissance').AsString:=Date1;
    //Condition pour Avoir le gender de Patient
    begin
      if (RadioGroup1.ItemIndex=0) then FieldByName('Gender').AsString:='Homme'
      else if (RadioGroup1.ItemIndex=1) then FieldByName('Gender').AsString:='Femme'
      else Begin
            msg := MessageDlg('S''il vous plait choisir le gendre de patient et retry de nouveau',mtWarning,[mbRetry],0 );
              if (msg = mrRetry) then
                Begin
                  RadioGroup1.SetFocus;
                End;
           End;
    end;
    FieldByName('Adresse').AsString:=edit4.Text;
    FieldByName('Telephone').AsString:=edit5.Text;
    TDate2:=DateTimePicker2.Date;
    Date2:=DateTimeToStr(TDate2);
    FieldByName('Date_de_RDV').AsString:=Date2;
    //contourner l'exception de Base de Donne� en cas de champ vide
     try
      FieldByName('type').AsString:=ComboBox1.Text;
     except on E: Exception do
      Begin
        msg := Messagedlg('S''il vous plait Choisir un Type Et Resseyer de nouveau !', mtWarning, [mbRetry],0);
          if (msg = mrRetry) then
            Begin
              DBNavigator1.BtnClick(nbCancel);
              ComboBox1.ClearSelection;
              ComboBox1.SetFocus;
              Edit;
          end;
      End;
     end;
  End;
  DBNavigator1.BtnClick(nbPost);
end;
end;

procedure TF_RDV.Button3Click(Sender: TObject);
begin
//Fermer la form RDV 
F_RDV.Close;
end;

procedure TF_RDV.FormResize(Sender: TObject);
var
i : Integer;
begin
//Redimensionner Panel1
  if(F_RDV.Width<=1032) then
   Begin
    F_RDV.Width:=1032;
    Mouse_Event(MOUSEEVENTF_ABSOLUTE or MOUSEEVENTF_LEFTUP, 0, 0, 0, 0);
   end;
  Panel1.Width:= (Clientwidth + splitter1.Width) div 3;

  if (F_RDV.Width = F_RDV.Width + 1) then
   Begin
    edit1.Width:= edit1.Width + 1;
    edit3.width:= edit3.width + 1;
    RadioGroup1.Width:= RadioGroup1.Width + 1;
    DateTimePicker1.Width:= DateTimePicker1.Width + 1;
   end
  else if (F_RDV.Width = F_RDV.Width - 1) then
   Begin
    edit1.Width:= edit1.Width - 1;
    edit3.width:= edit3.width - 1;
    RadioGroup1.Width:= RadioGroup1.Width - 1;
    DateTimePicker1.Width:= DateTimePicker1.Width - 1;
   end;

//DBGridd columns redimensioner
  if (F_RDV.Width>=1032) and (F_RDV.Width <= 1100) then
  begin
    for i := 0 to DBGrid1.Columns.Count-1 do
      begin
        if (i = 0) or (i = 5) or (i = 9) then
          begin
            DBGrid1.Columns[0].Width:=40;
            DBGrid1.Columns[5].Width:=50;
            DBGrid1.Columns[9].Width:=60;
          end
        else
          DBGrid1.Columns[i].Width:=120;
      end;
  end
  else
  begin
     for i := 0 to DBGrid1.Columns.Count-1 do
      begin
        if (i = 0) or (i = 5) or (i = 6) or (i = 9) then
          begin
            DBGrid1.Columns[0].Width:=70;
            DBGrid1.Columns[5].Width:=60;
            DBGrid1.Columns[6].Width:=280;
            DBGrid1.Columns[9].Width:=120;
          end
        else
          DBGrid1.Columns[i].Width:=170;
      end;
  end;

end;

end.
