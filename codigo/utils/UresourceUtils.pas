unit UresourceUtils;

interface

uses
  System.Classes,
  System.SysUtils,
  System.IOUtils;

type
  TResourceUtils = class(TObject)
  private
  protected
  public
    class function carregarArquivosResource(PNomeArquivo: String;
      PNomeAplicacao: String): String;
  end;

implementation

{ TResourceUtils }

class function TResourceUtils.carregarArquivosResource(PNomeArquivo,
  PNomeAplicacao: String): String;

var
  LConteudoArquivo: TStringList;
  LCaminhoArquivo: String;
  LCaminhoPastaAplicacao: String;
  LConteudoTexto: String;

begin
  try
    try
      LCaminhoPastaAplicacao := TPath.Combine(TPath.GetDocumentsPath,
        PNomeAplicacao);
      LCaminhoArquivo := TPath.Combine(LCaminhoPastaAplicacao, PNomeArquivo);

      LConteudoArquivo := TStringList.Create();
      LConteudoArquivo.LoadFromFile(LCaminhoArquivo);

      LConteudoTexto := LConteudoArquivo.Text;
    except
      on E: Exception do
        raise Exception.Create('Error ao carregar os arquivos de Resource.' +
          'Arquivo: ' + PNomeArquivo);
    end;
  finally
    LConteudoArquivo.Free;
  end;

  Result := LConteudoTexto;
end;

end.
