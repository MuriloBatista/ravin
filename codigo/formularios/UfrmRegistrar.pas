unit UfrmRegistrar;

interface

uses
  Winapi.Windows,
  Winapi.Messages,
  System.SysUtils,
  System.Variants,
  System.Classes,

  FireDAC.Phys.MySQLWrapper,

  Vcl.Graphics,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Dialogs,
  UfrmBotaoPrimario,
  Vcl.StdCtrls,
  Vcl.ExtCtrls,
  Vcl.Imaging.pngimage,
  System.Actions, Vcl.ActnList, Vcl.ExtActns;

type
  TfrmRegistrar = class(TForm)
    imgFundo: TImage;
    pnlRegistrar: TPanel;
    lblTituloRegistrar: TLabel;
    lblSubTituloRegistrar: TLabel;
    lblTituloAutenticar: TLabel;
    lblSubTituloAutenticar: TLabel;
    edtNome: TEdit;
    edtCpf: TEdit;
    edtLogin: TEdit;
    edtSenha: TEdit;
    edtConfirmarSenha: TEdit;
    frmBotaoPrimario1: TfrmBotaoPrimario;
    procedure lblSubTituloAutenticarClick(Sender: TObject);
    procedure frmBotaoPrimario1spbBotaoPrimarioClick(Sender: TObject);
  private
    { Private declarations }
    procedure SetMainForm(NovoMainForm: TForm);
  public
    { Public declarations }
  end;

var
  frmRegistrar: TfrmRegistrar;

implementation

uses
  UusuarioDao, Uusuario, UfrmLogin, UValidadorUsuario;

procedure TfrmRegistrar.frmBotaoPrimario1spbBotaoPrimarioClick(Sender: TObject);
var
  LUsuario: TUsuario;
  LDao: TUsuarioDao;
begin
  try

    LUsuario := TUsuario.Create();
    LUsuario.login := edtLogin.Text;
    LUsuario.senha := edtSenha.Text;
    LUsuario.pessoaId := 1;
    LUsuario.criadoEm := Now();
    LUsuario.criadoPor := 'admin';
    LUsuario.alteradoEm := Now();
    LUsuario.alteradoPor := 'admin';

    TValidadorUsuario.Validar(LUsuario, edtConfirmarSenha.Text);

    LDao := TUsuarioDao.Create();
    LDao.InserirUsuario(LUsuario);

    FreeAndNil(LDao);
  except
    on E: EMySQLNativeException do
    begin
      ShowMessage('Erro ao cadastrar o Usuário.');
    end;
    on E: Exception do
    begin
      ShowMessage(E.Message);
    end;

  end;

  FreeAndNil(LUsuario);

end;

procedure TfrmRegistrar.lblSubTituloAutenticarClick(Sender: TObject);
begin
  if not Assigned(frmLogin) then
  begin
    Application.CreateForm(TfrmLogin, frmLogin);
  end;

  SetMainForm(frmLogin);
  frmLogin.Show();

  Close();
end;

procedure TfrmRegistrar.SetMainForm(NovoMainForm: TForm);
var
  tmpMain: ^TCustomForm;
begin
  tmpMain := @Application.Mainform;
  tmpMain^ := NovoMainForm;
end;

end.
