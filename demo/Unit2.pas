unit Unit2;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, uRTOAuth2,
  FMX.Controls.Presentation, FMX.StdCtrls, Winapi.Windows, Winapi.ShellAPI,
  FMX.Edit;

type
  TForm2 = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    Edit1: TEdit;
    OpenDialog1: TOpenDialog;
    Button2: TButton;
    Button1: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Panel1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form2: TForm2;

implementation

{$R *.fmx}

procedure TForm2.Button1Click(Sender: TObject);
var
  tc : TRTOAuth2;
  token : string;
begin
  try
    tc := TRTOAuth2.Create(nil);

//    tc.CredentialFilePath := ExtractFilePath(ParamStr(0))+'arquivo.json'; //junto ao exe + arquivo .json que vc baixou da conta de servico link :
//      or
    tc.CredentialFilePath := edit1.Text;

    if not FileExists(tc.CredentialFilePath) then raise Exception.Create('Json de credenciais n�o existe');

    tc.Scope              := 'https://www.googleapis.com/auth/firebase.messaging';

    if tc.GetOAuth2Token(token) then
    begin
      showmessage(token)
    end else raise Exception.Create(token);    // quando der erro, vem na mesma variavel

  finally
    tc.free;
  end;


end;

procedure TForm2.Button2Click(Sender: TObject);
begin
  if OpenDialog1.Execute
    then edit1.Text := OpenDialog1.FileName;
end;

procedure TForm2.Panel1Click(Sender: TObject);
begin
  ShellExecute(0, 'open', 'https://www.linkedin.com/in/r%C3%B4mulo-tolfo-765353123/', nil, nil, SW_SHOWNORMAL);
end;

end.
