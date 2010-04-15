{******************************************************************************}
{                                                                              }
{                       Package MyHomeLib Components                           }
{                                                                              }
{                                Version 2                                     }
{                                                                              }
{         Copyright (c) 2008, 2009 Aleksey Penkov  alex.penkov@gmail.com       }
{                                                                              }
{******************************************************************************}

unit MHLComponents_Register;

interface

uses
  Classes;

procedure Register;

implementation

uses
  files_list,
  unit_StaticTip,
  unit_AutoCompleteEdit,
  unit_CoverPanel,
  unit_InfoPanel,
  MHLLinkLabel,
  BookInfoPanel;

const
  PAGE_NAME = 'MHLComponents';

procedure Register;
begin
  RegisterComponents(
    PAGE_NAME,
    [
    TFilesList,
    TMHLStaticTip,
    TMHLAutoCompleteEdit,
    TMHLCoverPanel,
    TMHLInfoPanel,
    TMHLLinkLabel,
    TInfoPanel
    ]
  );
end;

end.

