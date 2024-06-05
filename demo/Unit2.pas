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
  RTAuth : TRTOAuth2;
begin
  try
    RTAuth := TRTOAuth2.Create(nil);

//    RTAuth.CredentialFilePath := ExtractFilePath(ParamStr(0))+'arquivo.json'; //junto ao exe + arquivo .json que vc baixou da conta de servico link :
//      or
    RTAuth.CredentialFilePath := edit1.Text;

    if not FileExists(RTAuth.CredentialFilePath) then raise Exception.Create('Json de credenciais não existe');

    RTAuth.Scope              := 'https://www.googleapis.com/auth/firebase.messaging';

    if RTAuth.GetOAuth2Token then
    begin
      showmessage(RTAuth.TokenOrError);
      showmessage(RTAuth.Expiresin.ToString); //expiração do token vem em segundos, normalmente é de 1 hora

      showmessage(RTAuth.TokenType);
      //tipo do token normalmente pra prosseguir com a api do google usando esse token voce tera que passar ele no HEADER da sua requisicao de api assim --> Bearer seutokenrecebido   //atencao ao espaco em branco depois de Bearer

    end else raise Exception.Create(RTAuth.TokenOrError);    // quando der erro, vem na mesma variavel

  finally
    RTAuth.free;
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
