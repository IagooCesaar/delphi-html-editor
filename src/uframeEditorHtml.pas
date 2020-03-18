unit uframeEditorHtml;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls,
  SynEditHighlighter, SynHighlighterHtml, System.Actions, Vcl.ActnList,
  Vcl.ToolWin, System.ImageList, Vcl.ImgList, Vcl.StdCtrls, JvExStdCtrls,
  JvCheckBox, JvCombobox, JvColorCombo, Vcl.OleCtrls, SHDocVw, SynEdit,
  Vcl.ExtCtrls, Vcl.Imaging.pngimage, MSHTML, ActiveX;

type

  TWebBrowser = class(SHDocVw.TWebBrowser)
    //Código para ignorar caracteres acelerados (atalho do Alt + Letra quando utilizando o &)
    procedure CNChar(var Message: TWMChar); message CN_CHAR;
  end;

type
  TframeEditorHtml = class(TFrame)
    tbarFerramentas: TToolBar;
    dlgColorColor: TColorDialog;
    aclAcoes: TActionList;
    acNegrito: TAction;
    acItalico: TAction;
    acSublinhado: TAction;
    acCorFonte: TAction;
    acListaOrd: TAction;
    acListaNaoOrd: TAction;
    acRecuoReduzir: TAction;
    acRecuoAumentar: TAction;
    acAlinEsquerda: TAction;
    acAlinCentro: TAction;
    acAlinDireita: TAction;
    acGaleriaImagens: TAction;
    acBancodeImagens: TAction;
    acLinhaHorizontal: TAction;
    acCortar: TAction;
    acCopiar: TAction;
    acColar: TAction;
    acDesfazer: TAction;
    acHyperlink: TAction;
    acTabela: TAction;
    acSalvar: TAction;
    acPublicar: TAction;
    synhtmlsynHighLight: TSynHTMLSyn;
    btnSalvar: TToolButton;
    btnPublicar: TToolButton;
    btnSep1: TToolButton;
    btnNegrito: TToolButton;
    btnItalico: TToolButton;
    btnSublinhado: TToolButton;
    btnCorFonte: TToolButton;
    btnListaOrd: TToolButton;
    btnListaNaoOrd: TToolButton;
    btnRecuoDiminuir: TToolButton;
    btnRecuoAumentar: TToolButton;
    btnAlinharEsquerda: TToolButton;
    btnAlinharCentro: TToolButton;
    btnAlinharDireita: TToolButton;
    btnSep2: TToolButton;
    btnRecortar: TToolButton;
    btnCopiar: TToolButton;
    btnColar: TToolButton;
    btnDesfazer: TToolButton;
    btnSep3: TToolButton;
    btnHiperlink: TToolButton;
    btnTabela: TToolButton;
    btnSep4: TToolButton;
    mmHtml: TSynEdit;
    wbHtml: TWebBrowser;
    pTop: TPanel;
    pControles: TPanel;
    cmbFonte: TJvFontComboBox;
    cmbFonteTam: TJvComboBox;
    chbVerCodigo: TJvCheckBox;
    dlgSaveHtml: TSaveDialog;
    btnAbrir: TToolButton;
    acAbrir: TAction;
    dlgOpenHtml: TOpenDialog;
    btnRealce: TToolButton;
    acCorRealce: TAction;
    acCorFundo: TAction;
    btnCorFundo: TToolButton;
    btnLinhaHorizontal: TToolButton;
    procedure chbVerCodigoClick(Sender: TObject);
    procedure acNegritoExecute(Sender: TObject);
    procedure acItalicoExecute(Sender: TObject);
    procedure acSublinhadoExecute(Sender: TObject);
    procedure acCorFonteExecute(Sender: TObject);
    procedure acListaOrdExecute(Sender: TObject);
    procedure acListaNaoOrdExecute(Sender: TObject);
    procedure acRecuoReduzirExecute(Sender: TObject);
    procedure acRecuoAumentarExecute(Sender: TObject);
    procedure acAlinEsquerdaExecute(Sender: TObject);
    procedure acAlinCentroExecute(Sender: TObject);
    procedure acAlinDireitaExecute(Sender: TObject);
    procedure acGaleriaImagensExecute(Sender: TObject);
    procedure acBancodeImagensExecute(Sender: TObject);
    procedure acLinhaHorizontalExecute(Sender: TObject);
    procedure acCortarExecute(Sender: TObject);
    procedure acCopiarExecute(Sender: TObject);
    procedure acColarExecute(Sender: TObject);
    procedure acDesfazerExecute(Sender: TObject);
    procedure acHyperlinkExecute(Sender: TObject);
    procedure acTabelaExecute(Sender: TObject);
    procedure cmbFonteChange(Sender: TObject);
    procedure cmbFonteTamChange(Sender: TObject);
    procedure acSalvarExecute(Sender: TObject);
    procedure acAbrirExecute(Sender: TObject);
    procedure acCorRealceExecute(Sender: TObject);
    procedure acCorFundoExecute(Sender: TObject);
    procedure wbHtmlCommandStateChange(ASender: TObject; Command: Integer;
      Enable: WordBool);
  private
    HtmlOriginal     : TStrings;
    HtmlModificado   : TStrings;
    ArqAnterior      : String;

    FPodeAlterar     : Boolean;
    FPodeSalvar      : Boolean;
    FOcultarBotoes   : Boolean;
    FPodeAbrir       : Boolean;

    procedure SetPodeAlterar(const Value: Boolean);
    procedure SetPodeSalvar(const Value: Boolean);
    procedure AtualizaCodigo;
    procedure SetOcultarBotoes(const Value: Boolean);
    procedure SetPodeAbrir(const Value: Boolean);

  public
    { Public declarations }

    procedure CarregaDocumento(CodigoHtml : String);
    function  DocumentoAlterado  : Boolean;
    function  RetornaCodigoHtml  : String;
    function  SalvarHtml         : Boolean;
    function  FocarEditor        : Boolean;
    function  ObterImagemClient(Imagem : TImage) : Boolean;

    property  PodeAlterar : Boolean read FPodeAlterar write SetPodeAlterar;
    property  OcultarBotoes : Boolean read FOcultarBotoes write SetOcultarBotoes;
    //Indica se o documento poderá ser alterado
    property  PodeSalvar : Boolean read  FPodeSalvar  write SetPodeSalvar;
    //Indica se poderá salvar o documento em arquivo .html
    property  PodeAbrir  : Boolean read  FPodeAbrir   write SetPodeAbrir;

    procedure PrevenirNavegacaoKeyDown(Sender: TObject; var Key: Word;
         Shift: TShiftState);
  end;

var
  HTMLDocumento : IHTMLDocument2;

const
  IDM_MARCADOR = 2184;
  IDM_MARCADOR_LISTA = 2185;
  IDM_OUTDENT = 2187;
  IDM_INDENT = 2186;
  IDM_ALINHARESQ = 59;
  IDM_CENTRALIZAR = 57;
  IDM_ALINHADIR = 60;
  IDM_IMAGEM = 2168;
  IDM_LINHAHORIZ = 2150;
  IDM_RECORTAR = 16;
  IDM_COPIAR = 15;
  IDM_COLAR = 26;
  IDM_HYPERLINK = 2124;
  IDM_DESFAZER = 43;

implementation

uses
   uFuncoes, StrUtils, DateUtils, Math,
   {MSHTML_TLB,} JPEG, ComObj, udmImagens;

{$R *.dfm}
function GetIEHandle(WebBrowser: TWebbrowser; ClassName: string): HWND;
var
   hwndChild, hwndTmp: HWND;
   oleCtrl: TOleControl;
   szClass: array [0..255] of char;
begin
   oleCtrl :=WebBrowser;
   hwndTmp := oleCtrl.Handle;
   while (true) do begin
      hwndChild := GetWindow(hwndTmp, GW_CHILD);
      GetClassName(hwndChild, szClass, SizeOf(szClass));
      if (string(szClass)=ClassName) then begin
         Result :=hwndChild;
         Exit;
      end;
      hwndTmp := hwndChild;
   end;
   Result := 0;
end;

procedure DocumentoEmBranco(WebBrowser: TWebBrowser);
begin
   WebBrowser.Navigate('about:blank');
   Application.ProcessMessages;
end;

procedure WebBrowserScreenShot(const wb: TWebBrowser; const fileName: TFileName) ;
 var
   viewObject : IViewObject;
   r : TRect;
   bitmap : TBitmap;
 begin
   if wb.Document <> nil then
   begin
     wb.Document.QueryInterface(IViewObject, viewObject) ;
     if Assigned(viewObject) then
     try
       bitmap := TBitmap.Create;
       try
         r := Rect(0, 0, wb.Width, wb.Height) ;

         bitmap.Height := wb.Height;
         bitmap.Width := wb.Width;

         viewObject.Draw(DVASPECT_CONTENT, 1, nil, nil, Application.Handle, bitmap.Canvas.Handle, @r, nil, nil, 0) ;

         with TJPEGImage.Create do
         try
           Assign(bitmap) ;
           SaveToFile(fileName) ;
         finally
           Free;
         end;
       finally
         bitmap.Free;
       end;
     finally
       viewObject._Release;
     end;
   end;
 end;

procedure TframeEditorHtml.acAbrirExecute(Sender: TObject);
var Abrir, Alterar, Salvar, Ocultar : Boolean;
begin
   Abrir    := PodeAbrir;
   Alterar  := PodeAlterar;
   Salvar   := PodeSalvar;
   Ocultar  := OcultarBotoes;
   if not dlgOpenHtml.Execute then Exit;
   HtmlOriginal.LoadFromFile(dlgOpenHtml.FileName);
   CarregaDocumento(HtmlOriginal.Text);
   Application.ProcessMessages;
   PodeAbrir      := Abrir;
   PodeAlterar    := Alterar;
   PodeSalvar     := Salvar;
   OcultarBotoes  := Ocultar;
end;

procedure TframeEditorHtml.acAlinCentroExecute(Sender: TObject);
begin
   SendMessage(GetIEHandle(wbHtml, 'Internet Explorer_Server'),
   WM_COMMAND,IDM_CENTRALIZAR, 0);
end;

procedure TframeEditorHtml.acAlinDireitaExecute(Sender: TObject);
begin
   SendMessage(GetIEHandle(wbHtml, 'Internet Explorer_Server'),
   WM_COMMAND,IDM_ALINHADIR, 0);
end;

procedure TframeEditorHtml.acAlinEsquerdaExecute(Sender: TObject);
begin
   SendMessage(GetIEHandle(wbHtml, 'Internet Explorer_Server'),
   WM_COMMAND,IDM_ALINHARESQ, 0);
end;

procedure TframeEditorHtml.acBancodeImagensExecute(Sender: TObject);
begin
   MessageBox(Handle,pchar('... em desenvolvimento!'),'Alerta',MB_OK+MB_ICONWARNING);
//   fConFormCatImagens := TfConFormCatImagens.Create(Self);
//   fConFormCatImagens.ShowModal;
end;


procedure TframeEditorHtml.acColarExecute(Sender: TObject);
begin
   SendMessage(GetIEHandle(wbHtml, 'Internet Explorer_Server'),
   WM_COMMAND,IDM_COLAR, 0);
end;

procedure TframeEditorHtml.acCopiarExecute(Sender: TObject);
begin
   SendMessage(GetIEHandle(wbHtml, 'Internet Explorer_Server'),
   WM_COMMAND,IDM_COPIAR, 0);
end;

procedure TframeEditorHtml.acCorFonteExecute(Sender: TObject);
begin
   HTMLDocumento := wbHtml.Document as IHTMLDocument2;
   if dlgColorColor.Execute then
      HTMLDocumento.execCommand('ForeColor', False,dlgColorColor.Color)
   else
      Exit;
end;

procedure TframeEditorHtml.acCorFundoExecute(Sender: TObject);
begin
   HTMLDocumento := wbHtml.Document as IHTMLDocument2;
   if dlgColorColor.Execute then
      //HTMLDocumento.execCommand('Documento.bgColor', False,dlgColorColor.Color)
      HTMLDocumento.bgColor   := dlgColorColor.Color
   else
      Exit;
end;

procedure TframeEditorHtml.acCorRealceExecute(Sender: TObject);
begin
   HTMLDocumento := wbHtml.Document as IHTMLDocument2;
   if dlgColorColor.Execute then
      HTMLDocumento.execCommand('BackColor', False, dlgColorColor.Color)
   else
      Exit;
end;

procedure TframeEditorHtml.acCortarExecute(Sender: TObject);
begin
   SendMessage(GetIEHandle(wbHtml, 'Internet Explorer_Server'),
   WM_COMMAND,IDM_RECORTAR, 0);
end;

procedure TframeEditorHtml.acDesfazerExecute(Sender: TObject);
begin
   SendMessage(GetIEHandle(wbHtml, 'Internet Explorer_Server'),
   WM_COMMAND,IDM_DESFAZER,0);
end;

procedure TframeEditorHtml.acGaleriaImagensExecute(Sender: TObject);
begin
   SendMessage(GetIEHandle(wbHtml, 'Internet Explorer_Server'),
   WM_COMMAND,IDM_IMAGEM,0);
end;

procedure TframeEditorHtml.acHyperlinkExecute(Sender: TObject);
begin
   SendMessage(GetIEHandle(wbHtml, 'Internet Explorer_Server'),
   WM_COMMAND,IDM_HYPERLINK,0);
end;

procedure TframeEditorHtml.acItalicoExecute(Sender: TObject);
begin
   HTMLDocumento := wbHtml.Document as IHTMLDocument2;
   HTMLDocumento.execCommand('Italic', False,0);
end;

procedure TframeEditorHtml.acLinhaHorizontalExecute(Sender: TObject);
begin
   SendMessage(GetIEHandle(wbHtml, 'Internet Explorer_Server'),
   WM_COMMAND,IDM_LINHAHORIZ, 0);
end;

procedure TframeEditorHtml.acListaNaoOrdExecute(Sender: TObject);
begin
   SendMessage(GetIEHandle(wbHtml, 'Internet Explorer_Server'),
   WM_COMMAND,IDM_MARCADOR_LISTA, 0);
end;

procedure TframeEditorHtml.acListaOrdExecute(Sender: TObject);
begin
   SendMessage(GetIEHandle(wbHtml, 'Internet Explorer_Server'),
   WM_COMMAND,IDM_MARCADOR, 0);
end;

procedure TframeEditorHtml.acNegritoExecute(Sender: TObject);
begin
   HTMLDocumento := wbHtml.Document as IHTMLDocument2;
   HTMLDocumento.execCommand('Bold', False,0);
end;

procedure TframeEditorHtml.acRecuoAumentarExecute(Sender: TObject);
begin
   SendMessage(GetIEHandle(wbHtml, 'Internet Explorer_Server'),
   WM_COMMAND,IDM_INDENT, 0);
end;

procedure TframeEditorHtml.acRecuoReduzirExecute(Sender: TObject);
begin
   SendMessage(GetIEHandle(wbHtml, 'Internet Explorer_Server'),
   WM_COMMAND,IDM_OUTDENT, 0);
end;

procedure TframeEditorHtml.acSalvarExecute(Sender: TObject);
begin
   AtualizaCodigo;
   if not dlgSaveHtml.Execute then Exit;
   HtmlModificado.SaveToFile(dlgSaveHtml.FileName);
end;

procedure TframeEditorHtml.acSublinhadoExecute(Sender: TObject);
begin
   HTMLDocumento := wbHtml.Document as IHTMLDocument2;
   HTMLDocumento.execCommand('Underline', False,0);
end;

procedure TframeEditorHtml.acTabelaExecute(Sender: TObject);
var tbl : IHTMLTable;
begin
   Exit;
   HTMLDocumento := wbHtml.Document as IHTMLDocument2;
   HTMLDocumento.execCommand('Tbody', True, 0);
end;

procedure TframeEditorHtml.AtualizaCodigo;
var doc: OleVariant;
begin
   doc := wbHtml.Document;
   try
      mmHtml.Lines.Clear;
      mmHtml.Lines.Text    := doc.documentElement.outerHtml;
      if HtmlModificado <> nil then
      HtmlModificado.Text  := mmHtml.Lines.Text;
   except

   end;
   Application.ProcessMessages;
end;

procedure TframeEditorHtml.CarregaDocumento(CodigoHtml: String);
var Html : TStrings; Arq : String;
begin
   if HtmlOriginal <> nil then FreeAndNil(HtmlOriginal);
   if HtmlModificado <> nil then FreeAndNil(HtmlModificado);
   PodeAlterar          := False;
   PodeAlterar          := False;
   PodeSalvar           := True;
   PodeAbrir            := True;
   OcultarBotoes        := False;

   HtmlOriginal         := TStringList.Create;
   HtmlModificado       := TStringList.Create;
   HtmlOriginal.Text    := CodigoHtml;
   HtmlModificado.Text  := CodigoHtml;
   wbHtml.Stop;   
   DocumentoEmBranco(wbHtml);
   if CodigoHtml <> '' then begin
      try
         if ArqAnterior <> '' then DeleteFile(ArqAnterior);
         Arq         := Funcoes.GeraStringRandomica(4,2);
         Arq         := ExtractFilePath(ParamStr(0))+'EditorHml_'+Arq+'.html';
         ArqAnterior := Arq;

         if FileExists(Arq) then DeleteFile(Arq);
         Html        := TStringList.Create;
         Html.Text   := CodigoHtml;
         Html.SaveToFile(Arq);
         Funcoes.OcultarArquivo(Arq);
         wbHtml.Navigate(PWideChar(Arq));
         //Funcoes.CarregarHtmlWebBrowser(wbHtml,CodigoHtml);
      finally
         FreeAndNil(Html);
      end;
   end;
   Application.ProcessMessages;
   chbVerCodigo.Checked := False;
   chbVerCodigoClick(nil);
end;

procedure TframeEditorHtml.chbVerCodigoClick(Sender: TObject);
begin
   AtualizaCodigo;
   if chbVerCodigo.Checked then begin
      wbHtml.Visible := False;
      mmHtml.Visible := True;
      wbHtml.SendToBack;
      mmHtml.BringToFront;
   end else begin
      wbHtml.Visible := True;
      mmHtml.Visible := False;
      wbHtml.BringToFront;
      mmHtml.SendToBack;
   end;
end;

procedure TframeEditorHtml.cmbFonteChange(Sender: TObject);
begin
   HTMLDocumento := wbHtml.Document as IHTMLDocument2;
   HTMLDocumento.execCommand('FontName', False,cmbFonte.Text);
end;

procedure TframeEditorHtml.cmbFonteTamChange(Sender: TObject);
begin
   //altera o tamanho da fonte
   HTMLDocumento := wbHtml.Document as IHTMLDocument2;
   case cmbFonteTam.ItemIndex of
      0: HTMLDocumento.execCommand('FontSize', False,1);
      1: HTMLDocumento.execCommand('FontSize', False,2);
      2: HTMLDocumento.execCommand('FontSize', False,3);
      3: HTMLDocumento.execCommand('FontSize', False,5);
      4: HTMLDocumento.execCommand('FontSize', False,6);
      5: HTMLDocumento.execCommand('FontSize', False,7);
   end;
end;

function TframeEditorHtml.DocumentoAlterado: Boolean;
begin
   AtualizaCodigo;
   if (HtmlOriginal <> nil) and (HtmlModificado <> nil) then  begin
      Result   := HtmlOriginal.Text <> HtmlModificado.Text;
   end else
      Result := False;
end;

function TframeEditorHtml.FocarEditor: Boolean;
begin
   Result := wbHtml.CanFocus;
   if wbHtml.CanFocus then
      wbHtml.SetFocus;
end;

function TframeEditorHtml.ObterImagemClient(Imagem: TImage): Boolean;
var
   bmp   : TBitmap;
   Arq   : String;
begin
   if Imagem = nil then begin
      Imagem := TImage.Create(Application.MainForm);
   end;
   try
      Arq   := ExtractFilePath(ParamStr(0))+'WebBrowserPic.jpeg';
      WebBrowserScreenShot(wbHtml, Arq);
//      bmp := TBitmap.Create;
//      bmp.Width   := wbHtml.ClientWidth;
//      bmp.Height  := wbHtml.ClientHeight;
//
//      wbHtml.PaintTo(bmp.Canvas.Handle, 0, 0);
//
//      bmp.SaveToFile('C:\temp\html-orig.bmp');
//      Imagem.Picture.Assign(bmp);
      Imagem.Picture.LoadFromFile(Arq);
   finally
//      FreeAndNil(bmp);
   end;
end;

procedure TframeEditorHtml.PrevenirNavegacaoKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
   {if Screen.ActiveControl = wbHtml then begin
      if not Self.PodeAlterar then begin
         if ((Key= VK_LEFT)  and (Shift = [ssAlt]))
         or ((Key= VK_RIGHT) and (Shift = [ssAlt]))
         or (Key= VK_BROWSER_BACK)
         or (Key= VK_BROWSER_FORWARD)
         or (Key = VK_BACK)
         then begin
            Key := 0;
            Exit;
         end;
      end;
   end;}
end;

function TframeEditorHtml.RetornaCodigoHtml: String;
begin
   AtualizaCodigo;
   if HtmlModificado <> nil then
      Result := HtmlModificado.Text
   else
      Result := '';
end;

function TframeEditorHtml.SalvarHtml: Boolean;
begin
   if not PodeSalvar then
      Result := False
   else begin
      Result := True;
   end;
end;

procedure TframeEditorHtml.SetOcultarBotoes(const Value: Boolean);
begin
   if Value = Self.FOcultarBotoes then Exit;
   FOcultarBotoes := Value;
   pTop.Visible   := not Value;
end;

procedure TframeEditorHtml.SetPodeAbrir(const Value: Boolean);
begin
   if Value = Self.FPodeAbrir then Exit;
   FPodeAbrir        := Value;
   acAbrir.Enabled   := Value;
end;

procedure TframeEditorHtml.SetPodeAlterar(const Value: Boolean);
begin
   if Value = Self.FPodeAlterar then Exit;   
   if wbHtml.Document <> nil then
      (wbHtml.Document as IHTMLDocument2).designMode := IfThen(Value,'On','Off');

   FPodeAlterar      := Value;
   pTop.Enabled      := Value;
   mmHtml.ReadOnly   := True;

   if Value then begin
      //Sleep(2000);
      Application.ProcessMessages;
   end;
end;

procedure TframeEditorHtml.SetPodeSalvar(const Value: Boolean);
begin
   if Value = Self.FPodeSalvar then Exit;
   FPodeSalvar       := Value;
   acSalvar.Enabled  := Value;
end;

procedure TframeEditorHtml.wbHtmlCommandStateChange(ASender: TObject;
  Command: Integer; Enable: WordBool);
begin
   if (Command = CSC_NAVIGATEBACK) and (not Self.PodeAlterar) then begin
      keybd_event(VK_MENU,  0, 0, 0);
      keybd_event(VK_RIGHT, 0, 0, 0);
      keybd_event(VK_RIGHT, 0, KEYEVENTF_KEYUP, 0);
      keybd_event(VK_MENU,  0, KEYEVENTF_KEYUP, 0);
   end;
end;

{ TWebBrowser }

procedure TWebBrowser.CNChar(var Message: TWMChar);
begin
   Message.Result := 0;
end;


end.
