unit UfrmSplash;

interface

uses
  Winapi.Windows,
  Winapi.Messages,
  System.Variants,
  System.Classes,
  DateUtils,
  Vcl.Graphics,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Dialogs,
  Vcl.ExtCtrls,
  Vcl.Imaging.pngimage,
  Vcl.StdCtrls,

  UfrmLogomarca;

type
  TfrmSplash = class(TForm)
    pnlFundo: TPanel;
    tmrSplash: TTimer;
    frmLogo: TfrmLogo;
    procedure tmrSplashTimer(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormPaint(Sender: TObject);
  private
    { Private declarations }
    Inicialized: Boolean;
    procedure InicializarAplicacao();
  public
    { Public declarations }
    function verificarLoginExpirou(): Boolean;

    // Numero máximo de dias que o usário fica logado sem a necessidade de login
  const
    MAX_DIAS_LOGIN: Integer = 5;
  end;

var
  frmSplash: TfrmSplash;

implementation

{$R *.dfm}

uses UfrmPainelGestao, UfrmLogin, UiniUtils, UformsUtils, System.SysUtils;

procedure TfrmSplash.FormCreate(Sender: TObject);
begin
  Inicialized := false;
  tmrSplash.Enabled := false;
  tmrSplash.Interval := 1000;
end;

procedure TfrmSplash.FormPaint(Sender: TObject);
begin
  tmrSplash.Enabled := not Inicialized;
end;

procedure TfrmSplash.InicializarAplicacao;
var
  LLogado: String;
begin

  // Carrega se o Usuario está Logado
  LLogado := TIniUtils.lerPropriedade(TSECAO.INFORMACOES_GERAIS,
    TPROPRIEDADE.LOGADO);

  if (LLogado = TIniUtils.VALOR_VERDADEIRO) and (verificarLoginExpirou) then
  begin
    TformsUtils.ShowFormPrincipal(frmPainelGestao, TfrmPainelGestao);
    Close;
  end
  else
  begin
    TformsUtils.ShowFormPrincipal(frmLogin, TfrmLogin);
    Close;
  end;
end;

procedure TfrmSplash.tmrSplashTimer(Sender: TObject);
begin
  tmrSplash.Enabled := false;
  if not Inicialized then
  begin
    Inicialized := true;
    InicializarAplicacao();
  end;
end;

function TfrmSplash.verificarLoginExpirou: Boolean;
var
  LUltimoAcesso: TDateTime;
  LDataExpiracaoLogin: TDateTime;
begin

  try
    begin
      // Carrega a datahora do ultimo login do usuario
      LUltimoAcesso := StrToDateTime
        (TIniUtils.lerPropriedade(TSECAO.INFORMACOES_GERAIS,
        TPROPRIEDADE.ULTIMO_ACESSO));

      LDataExpiracaoLogin := IncDay(LUltimoAcesso, MAX_DIAS_LOGIN);

      //Verifica se expirou e retorna true ou false
       Result := (LDataExpiracaoLogin >= Now())
    end;
  except
    begin
      Result := False;
    end;
  end;


end;

end.
