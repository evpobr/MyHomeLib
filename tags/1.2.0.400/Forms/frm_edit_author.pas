
{******************************************************************************}
{                                                                              }
{                                 MyHomeLib                                    }
{                                                                              }
{                                Version 0.9                                   }
{                                20.08.2008                                    }
{                    Copyright (c) Aleksey Penkov  alex.penkov@gmail.com       }
{                                                                              }
{******************************************************************************}


unit frm_edit_author;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, RzEdit, RzButton;

type
  TfrmEditAuthor = class(TForm)
    btnSave: TRzBitBtn;
    RzBitBtn2: TRzBitBtn;
    edFamily: TRzEdit;
    edName: TRzEdit;
    edMiddle: TRzEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmEditAuthor: TfrmEditAuthor;

implementation

{$R *.dfm}

end.
