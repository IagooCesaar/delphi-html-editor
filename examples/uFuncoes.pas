unit uFuncoes;

interface

uses  System.SysUtils, Vcl.Forms, Vcl.ComCtrls, Data.DB, Datasnap.DBClient,
      SHDocVw, System.Classes, WinApi.TLHelp32, Winapi.Messages,
      Winapi.ShellAPI, Winapi.ActiveX;

type
   { Funcoes }
   Funcoes = class(TObject)
      private

      public
         class function  GeraStringRandomica(Tamanho : Integer; Tipo : Word) : String;
         class procedure OcultarArquivo(Caminho : String);
         class function  AjustaAlturaFormModal(FormHandle, iAltura : Integer) : Integer;
         class function  AjustaLarguraFormModal(FormHandle, iLargura : Integer) : Integer;
         class procedure EscondeSheets(pcGeral : TPageControl);
         class procedure CriaIndicesClientDataSet(cdsAlvo : TClientDataSet);
         class function  RemoveAcentuacao(Texto : String) : String;
         class procedure CarregarHtmlWebBrowser(WebBrowser: TWebBrowser; HTMLCode: string);
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

class procedure Funcoes.CarregarHtmlWebBrowser(WebBrowser: TWebBrowser;
  HTMLCode: string);
var
   sl: TStringList;
   ms: TMemoryStream;
begin
   WebBrowser.Navigate('about:blank') ;
   while WebBrowser.ReadyState < READYSTATE_INTERACTIVE do Application.ProcessMessages;
   if Assigned(WebBrowser.Document) then begin
      sl := TStringList.Create;
      try
         ms := TMemoryStream.Create;
         try
            sl.Text := HTMLCode;
            sl.SaveToStream(ms) ;
            ms.Seek(0,0) ;
            (WebBrowser.Document as IPersistStreamInit).Load(TStreamAdapter.Create(ms));
         finally
            ms.Free;
         end;
      finally
         sl.Free;
      end;
   end;
end;

class procedure Funcoes.CriaIndicesClientDataSet(cdsAlvo: TClientDataSet);
var i : Integer;
begin
   cdsAlvo.IndexDefs.Clear;
   for i := 0 to cdsAlvo.FieldCount - 1 do begin
      if (cdsAlvo.Fields[i].FieldKind = fkData) and not (cdsAlvo.Fields[i] is TMemoField) then begin
         cdsAlvo.IndexDefs.Add('a' + cdsAlvo.Fields[i].FieldName,
         cdsAlvo.Fields[i].FieldName, []);
         cdsAlvo.IndexDefs.Add('d' + cdsAlvo.Fields[i].FieldName,
         cdsAlvo.Fields[i].FieldName, [ixDescending]);
      end;
   end;
end;

class procedure Funcoes.EscondeSheets(pcGeral: TPageControl);
var i: Integer;
begin
   pcGeral.ActivePage.TabVisible := True;
   for i := 0 to pcGeral.PageCount - 1 do begin
      pcGeral.Pages[i].TabVisible := pcGeral.ActivePageIndex = i;
   end;
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

class function Funcoes.RemoveAcentuacao(Texto: String): String;
//fonte: https://marcosalles.wordpress.com/2013/04/14/dicas-removendo-acentos-de-uma-string-delphi/
type USASCIIString = type AnsiString(20127);
var C:Char;
begin
   result:='';
   for C in Texto do
     result:=result+String(USASCIIString(C));
end;

end.
