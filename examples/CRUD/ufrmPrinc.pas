unit ufrmPrinc;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Datasnap.DBClient,
  System.Actions, Vcl.ActnList, Vcl.Grids, MDBGrid, Vcl.StdCtrls, Vcl.ExtCtrls,
  JvExControls, JvArrowButton, Vcl.ComCtrls, Vcl.Mask, Vcl.DBCtrls,
  uframeEditorHtml;

type
  TfrmPrinc = class(TForm)
    cdsCRUD: TClientDataSet;
    dsCRUD: TDataSource;
    cdsCRUDID: TIntegerField;
    cdsCRUDDESCRICAO: TStringField;
    cdsCRUDINFORMACOES: TMemoField;
    aclCRUD: TActionList;
    acIncluir: TAction;
    acEditar: TAction;
    acApagar: TAction;
    acGravar: TAction;
    acCancelar: TAction;
    acManutencao: TAction;
    acListagem: TAction;
    acPesquisar: TAction;
    acOpcoes: TAction;
    pcPrinc: TPageControl;
    tsLista: TTabSheet;
    pBotoesLista: TPanel;
    btnAbrir: TButton;
    btnApagar1: TButton;
    btnIncluir1: TButton;
    pGrid: TPanel;
    dbgCRUD: TMDBGrid;
    tsManut: TTabSheet;
    pBotoesManut: TPanel;
    btnCancelar2: TButton;
    btnGravar2: TButton;
    btnApagar2: TButton;
    btnEditar2: TButton;
    btnIncluir2: TButton;
    btnListagem2: TButton;
    scbManut: TScrollBox;
    Label1: TLabel;
    dbID: TDBEdit;
    Label2: TLabel;
    dbDESCRICAO: TDBEdit;
    Panel1: TPanel;
    frameEditorHtml: TframeEditorHtml;
    procedure dsCRUDStateChange(Sender: TObject);
    procedure acApagarExecute(Sender: TObject);
    procedure acIncluirExecute(Sender: TObject);
    procedure acEditarExecute(Sender: TObject);
    procedure acCancelarExecute(Sender: TObject);
    procedure acListagemExecute(Sender: TObject);
    procedure acManutencaoExecute(Sender: TObject);
    procedure cdsCRUDAfterOpen(DataSet: TDataSet);
    procedure dbgCRUDDblClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
    procedure cdsCRUDAfterClose(DataSet: TDataSet);
    procedure btnAbrirClick(Sender: TObject);
    procedure cdsCRUDAfterScroll(DataSet: TDataSet);
    procedure pcPrincChange(Sender: TObject);
    //Funções para TMDBGrid
    procedure TMDBGridDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TDBGColumn; State: TGridDrawState);
    procedure TMDBGridDrawDataCell(Sender: TObject; const Rect: TRect;
      Field: TField; State: TGridDrawState);
    procedure TMDBGridKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure TMDBGridTitleClick(Column: TDBGColumn);
    procedure acGravarExecute(Sender: TObject);
  private
    { Private declarations }
    IdTemp : Integer;
    procedure ExibirPagina(tsExibir : TTabSheet);
    procedure ControlesHtml;
  public
    { Public declarations }
  end;

var
  frmPrinc: TfrmPrinc;

implementation

uses
   udmImagens, uFuncoes, System.StrUtils, System.DateUtils, Math;

{$R *.dfm}

procedure TfrmPrinc.acApagarExecute(Sender: TObject);
begin
   inherited;
   if cdsCRUD.IsEmpty then Abort;
   if Application.MessageBox(PwideChar('Deseja realmente excluir o registro selecionado?'),
      'Confirmação para exclusão',MB_ICONQUESTION + MB_YESNO) = IDNO then exit;
   cdsCRUD.Delete;
end;

procedure TfrmPrinc.acCancelarExecute(Sender: TObject);
var sAux : String;
begin
   if dsCRUD.State = dsInsert then sAux := 'inclusão' else sAux := 'edição';
   if Application.MessageBox(PWideChar('Se você cancelar agora, os dados modificados serão descartados.'+
      #13+'Deseja realmente cancelar a '+sAux+' do registro atual?'),'Atenção',MB_ICONQUESTION + MB_YESNO + MB_DEFBUTTON1) = IDYES then begin
      cdsCRUD.Cancel;
      if sAux = 'inclusão' then acListagem.Execute;
   end;
end;

procedure TfrmPrinc.acEditarExecute(Sender: TObject);
begin
   if not tsManut.TabVisible then acManutencao.Execute;
   cdsCRUD.Edit;
   if dbDESCRICAO.CanFocus then dbDESCRICAO.SetFocus;
end;

procedure TfrmPrinc.acGravarExecute(Sender: TObject);
begin
   if cdsCRUDDESCRICAO.AsString = '' then begin
      Application.MessageBox('Você deve informar uma descrição', 'Informação',
         MB_ICONINFORMATION + MB_Ok);
      Exit;
   end;
   if frameEditorHtml.DocumentoAlterado then
      cdsCRUDINFORMACOES.AsString := frameEditorHtml.RetornaCodigoHtml;
   cdsCRUD.Post;
end;

procedure TfrmPrinc.acIncluirExecute(Sender: TObject);
begin
   inherited;
   if not cdsCRUD.Active then begin
      btnAbrir.Click;
   end;
   if not tsManut.TabVisible then acManutencao.Execute;
   Inc(IdTemp);
   cdsCRUD.Append;
   cdsCRUDID.AsInteger  := IdTemp;
   if dbDESCRICAO.CanFocus then dbDESCRICAO.SetFocus;   
end;

procedure TfrmPrinc.acListagemExecute(Sender: TObject);
begin
   inherited;
   ExibirPagina(tsLista);
   cdsCRUDAfterOpen(cdsCRUD);
end;

procedure TfrmPrinc.acManutencaoExecute(Sender: TObject);
begin
   ExibirPagina(tsManut);
   scbManut.VertScrollBar.Position := 0;
   ControlesHtml;
end;

procedure TfrmPrinc.btnAbrirClick(Sender: TObject);
begin
   if cdsCRUD.Active then cdsCRUD.Close;
   cdsCRUD.CreateDataSet;
   IdTemp   := 0;
end;

procedure TfrmPrinc.cdsCRUDAfterClose(DataSet: TDataSet);
begin
   inherited;
   dbgCRUD.Visible   := False;
   pGrid.ShowCaption := True;
   pGrid.Caption     := ':: Clique em abrir para iniciar ::';
end;

procedure TfrmPrinc.cdsCRUDAfterOpen(DataSet: TDataSet);
begin
   inherited;
   pGrid.ShowCaption := DataSet.IsEmpty;
   pGrid.Caption     := IfThen(DataSet.IsEmpty,':: Não foram encontrados registros com os critérios fornecidos ::','');
   dbgCRUD.Visible   := not DataSet.IsEmpty;
   if dbgCRUD.CanFocus then dbgCRUD.SetFocus;
end;

procedure TfrmPrinc.cdsCRUDAfterScroll(DataSet: TDataSet);
begin
   if pcPrinc.ActivePage = tsManut then ControlesHtml;
end;

procedure TfrmPrinc.ControlesHtml;
begin
   with frameEditorHtml do begin
      CarregaDocumento(cdsCRUDINFORMACOES.AsString);
      PodeSalvar     := False;
      PodeAbrir      := True;
      OcultarBotoes  := not (cdsCRUD.State in [dsInsert,dsEdit]);
      PodeAlterar    := cdsCRUD.State in [dsInsert,dsEdit];
   end;
end;

procedure TfrmPrinc.dbgCRUDDblClick(Sender: TObject);
begin
   acManutencao.Execute;
end;

procedure TfrmPrinc.dsCRUDStateChange(Sender: TObject);
var dsPrinc : TDataSource;
begin
   ControlesHtml;
   dsPrinc              := TDataSource(Sender);
   acPesquisar.Enabled  :=  not (dsPrinc.State in [dsEdit,dsInsert]);
   acManutencao.Enabled :=  not (dsPrinc.State in [dsEdit,dsInsert]);
   acListagem.Enabled   :=  not (dsPrinc.State in [dsEdit,dsInsert]);
   acIncluir.Enabled    := (not (dsPrinc.State in [dsEdit,dsInsert]));
   acEditar.Enabled     := (not (dsPrinc.State in [dsEdit,dsInsert]));
   acApagar.Enabled     := (not (dsPrinc.State in [dsEdit,dsInsert])) and (not dsPrinc.DataSet.IsEmpty);
   acGravar.Enabled     :=      (dsPrinc.State in [dsEdit,dsInsert]);
   acCancelar.Enabled   :=      (dsPrinc.State in [dsEdit,dsInsert]);
end;

procedure TfrmPrinc.ExibirPagina(tsExibir: TTabSheet);
var pcPai : TPageControl;
begin
   pcPai := TPageControl(tsExibir.PageControl);
   pcPai.ActivePage := tsExibir;
   Funcoes.EscondeSheets(pcPai);
end;

procedure TfrmPrinc.FormCreate(Sender: TObject);
begin
   inherited;
   Funcoes.CriaIndicesClientDataSet(cdsCRUD);
end;

procedure TfrmPrinc.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var PressCtrl : Boolean;
begin
   if (pcPrinc.ActivePage = tsManut) and acListagem.Enabled then
      if (Key = VK_LEFT) and (ssAlt in Shift) then begin
         acListagem.Execute;
         Exit;
      end;
   inherited;
end;

procedure TfrmPrinc.FormKeyPress(Sender: TObject; var Key: Char);
begin
   if (Screen.ActiveControl.ClassType = TMDBGrid) then
      If (key = #13) and (TMDBGrid(Screen.ActiveControl) = dbgCRUD) then begin
         acManutencao.Execute;
         Exit;
      end;

   inherited;
end;

procedure TfrmPrinc.FormShow(Sender: TObject);
begin
   inherited;
   cdsCRUDAfterClose(nil);
   ExibirPagina(tsLista);
   btnAbrir.SetFocus;
end;

procedure TfrmPrinc.pcPrincChange(Sender: TObject);
begin
   ControlesHtml;
end;

procedure TfrmPrinc.TMDBGridDrawColumnCell(Sender: TObject; const Rect: TRect;
  DataCol: Integer; Column: TDBGColumn; State: TGridDrawState);
var i : Smallint;
begin
   //Centralizar títulos
   for i := 0 to TMDBGrid(Sender).Columns.Count-1 do
      TMDBGrid(sender).Columns[i].Title.Alignment := taCenter;
end;

procedure TfrmPrinc.TMDBGridDrawDataCell(Sender: TObject; const Rect: TRect;
  Field: TField; State: TGridDrawState);
begin
   //
end;

procedure TfrmPrinc.TMDBGridKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   //Bloquear exclusão de registros
   if ((Shift = [ssCtrl]) and (Key = VK_DELETE)) then Abort;
   if ((Shift = [ssCtrl,ssShift]) and (Key = VK_DELETE)) then Abort;
end;

procedure TfrmPrinc.TMDBGridTitleClick(Column: TDBGColumn);
var
   i        : Integer;
   DataSet  : TClientDataSet;
   Grid     : TMDBGrid;
begin
   try
      Grid     := TMDBGrid(Column.Grid);
      DataSet  := TClientDataSet(Grid.DataSource.DataSet);
      //Ordernar registros do Grid
      if DataSet.FieldByName(Column.FieldName).FieldKind = fkCalculated   then Exit;
      if DataSet.FieldByName(Column.FieldName).FieldKind = fkInternalCalc then Exit;
      for i := 0 to Grid.Columns.Count-1 do Grid.Columns[i].Title.SortMarker := smNone;
      if 'a' + Column.FieldName = DataSet.IndexName then begin
         DataSet.IndexName := 'd' + Column.FieldName;
         Column.Title.SortMarker := smDown;
      end else  begin
         DataSet.IndexName := 'a' + Column.FieldName;
         Column.Title.SortMarker := smUp;
      end;
      DataSet.First;
   except
      raise Exception.Create('Não foi possível aplicar a ordenação desejada pois este campo não está indexado');
   end;
end;

end.
