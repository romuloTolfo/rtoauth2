unit Unit2;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, uRTOAuth2,
  FMX.Controls.Presentation, FMX.StdCtrls;

type
  TForm2 = class(TForm)
    Button1: TButton;
    procedure Button1Click(Sender: TObject);
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
begin
  try
    tc := TRTOAuth2.Create(nil);

    tc.CredentialFilePath := ExtractFilePath(ParamStr(0))+'ids-mobile-a3403d049e25.json'; //junto ao exe + arquivo .json que vc baixou da conta de servico link :
    tc.Scope              := 'https://www.googleapis.com/auth/firebase.messaging';

    showmessage(tc.GetOAuth2Token);
  finally

  end;
  tc.Destroy

end;

end.
