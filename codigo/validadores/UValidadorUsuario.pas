unit UValidadorUsuario;

interface

uses
  Uusuario, System.SysUtils;

type
  TValidadorUsuario = class
  private

  protected

  public
    class procedure Validar(PUsuario: TUsuario; PSenhaConfirma��o: String);

  end;

implementation

{ TValidadorUsuario }

class procedure TValidadorUsuario.Validar(PUsuario: TUsuario;
  PSenhaConfirma��o: String);
begin

  if PUsuario.login.isEmpty then
  begin
    raise Exception.Create('O Campo login n�o pode ser vazio.');
  end;

  if PUsuario.senha.isEmpty then
  begin
    raise Exception.Create('O Campo da senha n�o pode estar vazio.');
  end;

  if PUsuario.senha <> PSenhaConfirma��o then
  begin
    raise Exception.Create('As senhas informadas n�o podem ser diferentes.');
  end;

end;

end.
