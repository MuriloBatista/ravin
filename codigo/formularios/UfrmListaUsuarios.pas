unit UfrmListaUsuarios;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TfrmListaUsuarios = class(TForm)
    mmListaUsuarios: TMemo;
    Label1: TLabel;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmListaUsuarios: TfrmListaUsuarios;

implementation

uses

  UusuarioDao, System.Generics.Collections, Uusuario;

{$R *.dfm}

procedure TfrmListaUsuarios.FormCreate(Sender: TObject);
var
  LDao: TUsuarioDAO;
  LLista: TList<TUsuario>;
  I: Integer;
begin
  LDao := TUsuarioDAO.Create();
  LLista := nil;

  LLista := LDao.BuscarTodosUsuarios();

  try
    for I := 0 to LLista.Count - 1 do
    begin
      mmListaUsuarios.Lines.Add(LLista[I].login);
      FreeAndNil(LLista[I]);
    end;
  finally

    FreeAndNil(LLista);
    FreeAndNil(LDao);
  end;

end;

end.
