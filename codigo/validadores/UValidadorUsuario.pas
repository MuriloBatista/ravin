unit UValidadorUsuario;

interface

uses
  Uusuario, System.SysUtils;

type
  TValidadorUsuario = class
  private

  protected

  public
    class procedure Validar(PUsuario: TUsuario; PSenhaConfirmação: String);

  end;

implementation

{ TValidadorUsuario }

class procedure TValidadorUsuario.Validar(PUsuario: TUsuario;
  PSenhaConfirmação: String);
begin

  if PUsuario.login.isEmpty then
  begin
    raise Exception.Create('O Campo login não pode ser vazio.');
  end;

  if PUsuario.senha.isEmpty then
  begin
    raise Exception.Create('O Campo da senha não pode estar vazio.');
  end;

  if PUsuario.senha <> PSenhaConfirmação then
  begin
    raise Exception.Create('As senhas informadas não podem ser diferentes.');
  end;

end;

end.
