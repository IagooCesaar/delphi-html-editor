program htmleditor;

uses
  Vcl.Forms,
  ufrmPrinc in 'ufrmPrinc.pas' {frmPrinc},
  ufrmEditor in 'ufrmEditor.pas' {frmEditor},
  uframeEditorHtml in '..\..\src\uframeEditorHtml.pas' {frameEditorHtml: TFrame},
  udmImagens in '..\udmImagens.pas' {dmImagens: TDataModule},
  uFuncoes in '..\uFuncoes.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmPrinc, frmPrinc);
  Application.CreateForm(TfrmEditor, frmEditor);
  Application.CreateForm(TdmImagens, dmImagens);
  Application.Run;
end.
