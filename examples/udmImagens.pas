unit udmImagens;

interface

uses
  System.SysUtils, System.Classes, System.ImageList, Vcl.ImgList, Vcl.Controls;

type
  TdmImagens = class(TDataModule)
    imgIcoEditores: TImageList;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dmImagens: TdmImagens;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

end.
