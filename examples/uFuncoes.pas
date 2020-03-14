unit uFuncoes;

interface

uses System.SysUtils, Vcl.Forms;

type
   { Funcoes }
   Funcoes = class(TObject)
      private

      public
         class function  GeraStringRandomica(Tamanho : Integer; Tipo : Word) : String;
         class procedure OcultarArquivo(Caminho : String);
         class function  AjustaAlturaFormModal(FormHandle, iAltura : Integer) : Integer;
         class function  AjustaLarguraFormModal(FormHandle, iLargura : Integer) : Integer;
   end;

implementation

{ Funcoes }

class function Funcoes.AjustaAlturaFormModal(FormHandle, iAltura: Integer
   ): Integer;
begin
   if iAltura > (Screen.MonitorFromWindow(FormHandle).Height-100) then
      Result := Screen.MonitorFromWindow(FormHandle).Height-100
   else
      Result := iAltura;
end;

class function Funcoes.AjustaLarguraFormModal(FormHandle, iLargura: Integer
   ): Integer;
begin
   if ilargura > (Screen.MonitorFromWindow(FormHandle).Width-100) then
      Result := Screen.MonitorFromWindow(FormHandle).Width-100
   else
      Result := ilargura;
end;

class function Funcoes.GeraStringRandomica(Tamanho: Integer;
  Tipo: Word): String;
//fonte: http://showdelphi.com.br/dica-funcao-para-gerar-uma-senha-aleatoria-delphi/
var I: Integer; Chave: String;
const
   str1 = '1234567890ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz';
   str2 = '1234567890ABCDEFGHIJKLMNOPQRSTUVWXYZ';
   str3 = '1234567890abcdefghijklmnopqrstuvwxyz';
   str4 = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz';
   str5 = '1234567890';
   str6 = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ';
   str7 = 'abcdefghijklmnopqrstuvwxyz';
   str8 = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ234567'; //base32
begin
   Chave := '';
   for I := 1 to Tamanho do begin
      case Tipo of
         1 : Chave := Chave + str1[Random(Length(str1)) + 1];
         2 : Chave := Chave + str2[Random(Length(str2)) + 1];
         3 : Chave := Chave + str3[Random(Length(str3)) + 1];
         4 : Chave := Chave + str4[Random(Length(str4)) + 1];
         5 : Chave := Chave + str5[Random(Length(str5)) + 1];
         6 : Chave := Chave + str6[Random(Length(str6)) + 1];
         7 : Chave := Chave + str7[Random(Length(str7)) + 1];
         8 : Chave := Chave + str8[Random(Length(str7)) + 1];
      end;
   end;
   Result := Chave;
end;

class procedure Funcoes.OcultarArquivo(Caminho: String);
var Attr : Integer;
begin
   if not FileExists(Caminho) then Exit;
   Attr := faHidden;
   FileSetAttr(Caminho, Attr);
end;

end.
