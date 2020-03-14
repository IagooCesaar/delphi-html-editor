unit ufrmEditor;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uframeEditorHtml, Vcl.StdCtrls,
  Vcl.ExtCtrls;

type
  TfrmEditor = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    btnModeloCancelar: TButton;
    frameEditorHtml: TframeEditorHtml;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnModeloCancelarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    Html    : String;
    Arquivo : String;

    PodeAbrirArquivo,
    PodeSalvarArquivo,
    PodeAlterar : Boolean;
    procedure AjustaraTela;
  end;

var
  frmEditor: TfrmEditor;

implementation

uses
   uFuncoes;

{$R *.dfm}

{ TfrmEditor }

procedure TfrmEditor.AjustaraTela;
begin
   Self.Height := Funcoes.AjustaAlturaFormModal(Self.Handle, 1000000);
   Self.Width  := Funcoes.AjustaLarguraFormModal(Self.Handle,1000000);
end;

procedure TfrmEditor.btnModeloCancelarClick(Sender: TObject);
begin
   if frameEditorHtml.DocumentoAlterado then begin
      if Application.MessageBox(PWideChar(
         'Existem alterações não salvas no documento atual. Deseja salvar as alterações realizadas?'),
         'Confirmação', MB_ICONQUESTION + MB_YESNO
      ) <> ID_YES then
         Self.ModalResult := mrCancel
      else
         if frameEditorHtml.SalvarHtml then begin
            Self.Html         := frameEditorHtml.RetornaCodigoHtml;
            Self.ModalResult  := mrOk
         end;

   end else
      Self.ModalResult := mrCancel;
end;

procedure TfrmEditor.FormCreate(Sender: TObject);
begin
   Arquivo           := '';
   Html              := '';
   PodeAbrirArquivo  := True;
   PodeSalvarArquivo := True;
   PodeAlterar       := True;
end;

procedure TfrmEditor.FormShow(Sender: TObject);
var Arq : TStrings;
begin
   inherited;
   if FileExists(Arquivo) then begin
      try
         Arq := TStringList.Create;
         Arq.LoadFromFile(Arquivo);
         Html  := Arq.Text;
      finally
         FreeAndNil(Arq);
      end;
   end;
   frameEditorHtml.CarregaDocumento(Html);
   frameEditorHtml.PodeAlterar   := True;
   frameEditorHtml.FocarEditor;
end;

end.
