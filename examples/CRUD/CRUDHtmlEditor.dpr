program CRUDHtmlEditor;

uses
  Vcl.Forms,
  ufrmPrinc in 'ufrmPrinc.pas' {frmPrinc},
  udmImagens in '..\udmImagens.pas' {dmImagens: TDataModule},
  uFuncoes in '..\uFuncoes.pas',
  uframeEditorHtml in '..\..\src\uframeEditorHtml.pas' {frameEditorHtml: TFrame};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmPrinc, frmPrinc);
  Application.CreateForm(TdmImagens, dmImagens);
  Application.Run;
end.
