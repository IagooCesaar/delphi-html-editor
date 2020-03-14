unit ufrmPrinc;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Mask, JvExMask,
  JvToolEdit;

type
  TfrmPrinc = class(TForm)
    rbtArquivo: TRadioButton;
    edtArquivo: TJvFilenameEdit;
    rbtTexto: TRadioButton;
    mmTexto: TMemo;
    Button1: TButton;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPrinc: TfrmPrinc;

implementation

uses
   ufrmEditor;

{$R *.dfm}

procedure TfrmPrinc.Button1Click(Sender: TObject);
   function GetFromFile : string;
   var arq : TStrings;
   begin
      try
         Arq := TStringList.Create;
         Arq.LoadFromFile(edtArquivo.Text);
         Result := arq.Text;
      finally
         FreeAndNil(Arq);
      end;
   end;
begin
   try
      frmEditor                     := TfrmEditor.Create(Self);
      if rbtTexto.Checked then
         frmEditor.Html             := mmTexto.Lines.Text
      else
         frmEditor.Html             := GetFromFile;
      frmEditor.PodeAbrirArquivo    := True;
      frmEditor.PodeSalvarArquivo   := False;
      frmEditor.PodeAlterar         := True;
      frmEditor.AjustaraTela;
      if frmEditor.ShowModal = mrOk then begin
         mmTexto.Lines.Text         := frmEditor.Html;
      end;
   finally
      FreeAndNil(frmEditor);
   end;
end;

end.
