unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ExtCtrls, Buttons,
  Grids, Unit2;

type

  { TfMain }

  TfMain = class(TForm)
    Panel1: TPanel;
    bAdd: TSpeedButton;
    bEdit: TSpeedButton;
    bDel: TSpeedButton;
    bSort: TSpeedButton;
    SG: TStringGrid;
    procedure bAddClick(Sender: TObject);
  private

  public

  end;
type
  Contacts = record
    Name: string[100];
    Telephon: string[20];
    Note: string[20];
  end; //record

var
  fMain: TfMain;
  adres: string;

implementation

{$R *.lfm}

{ TfMain }

procedure TfMain.bAddClick(Sender: TObject);
begin
  //очищаем поля, если там что-то есть:
    fEdit.eName.Text:= '';
    fEdit.eTelephone.Text:= '';
    //устанавливаем ModalResult редактора в mrNone:
    fEdit.ModalResult:= mrNone;
    //теперь выводим форму:
    fEdit.ShowModal;
    //если пользователь ничего не ввел - выходим:
    if (fEdit.eName.Text= '') or (fEdit.eTelephone.Text= '') then exit;
    //если пользователь не нажал "Сохранить" - выходим:
    if fEdit.ModalResult <> mrOk then exit;
    //иначе добавляем в сетку строку, и заполняем её:
    SG.RowCount:= SG.RowCount + 1;
    SG.Cells[0, SG.RowCount-1]:= fEdit.eName.Text;
    SG.Cells[1, SG.RowCount-1]:= fEdit.eTelephone.Text;
    SG.Cells[2, SG.RowCount-1]:= fEdit.CBNote.Text;
end;

end.

