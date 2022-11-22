unit UfrmLogin;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.Imaging.pngimage,
  Vcl.Buttons, Vcl.StdCtrls, UfrmBotaoPrimario;

type
  TfrmLogin = class(TForm)
    pnlAutenticacao: TPanel;
    imgLogo: TImage;
    edtLogin: TEdit;
    edtSenha: TEdit;
    lblTituloRegistrar: TLabel;
    lblTitulo: TLabel;
    lblSubTitulo: TLabel;
    lblSubTituloRegistras: TLabel;
    imgFundo: TImage;
    frmBotaoAutenticar1: TfrmBotaoAutenticar;
    Button1: TButton;
    procedure frmBotaoAutenticar1spdBotaoPrimarioClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);

  private
    { Private declarations }
    procedure SetarFormPrincipal(PNovoFormulario: TForm);
  public
    { Public declarations }
  end;

var
  frmLogin: TfrmLogin;

implementation

uses
  UusuarioDao, Uusuario, UfrmPainelGestao;
{$R *.dfm}

procedure TfrmLogin.Button1Click(Sender: TObject);
var
  LUsuario: TUsuario;
  LDao: TUsuarioDao;

begin
  LUsuario := TUsuario.Create();
  LUsuario.login := 'teste';
  LUsuario.senha := '123';
  LUsuario.pessoaId := 1;
  LUsuario.criadoEm := Now();
  LUsuario.criadoPor := 'Fulano';
  LUsuario.alteradoEm := Now();
  LUsuario.alteradoPor := 'Fulano';

  LDao := TUsuarioDao.Create();
  LDao.InserirUsuario(LUsuario);

  FreeAndNil(LDao);
  FreeAndNil(LUsuario);

end;

procedure TfrmLogin.frmBotaoAutenticar1spdBotaoPrimarioClick(Sender: TObject);
var
  LDao: TUsuarioDao;
  LUsuario: TUsuario;

  LLogin, LSenha: String;
begin

  LDao := TUsuarioDao.Create;

  LLogin := edtLogin.Text;
  LSenha := edtSenha.Text;

  LUsuario := LDao.BuscarUsuarioPorLoginSenha(LLogin, LSenha);

  if Assigned(LUsuario) then
  begin
    if not Assigned(frmPainelGestao) then
    begin
      Application.CreateForm(TfrmPainelGestao, frmPainelGestao)
    end;

    SetarFormPrincipal(frmPainelGestao);
    frmPainelGestao.Show;

    Close();
  end
  else
  begin
    ShowMessage('Login e/ou senha inválidos.');
  end;

  FreeAndNil(LDao);
  FreeAndNil(LUsuario);
end;

procedure TfrmLogin.SetarFormPrincipal(PNovoFormulario: TForm);
var
  tmpMain: ^TCustomForm;
begin
  tmpMain := @Application.Mainform;
  tmpMain^ := PNovoFormulario;
end;

end.
