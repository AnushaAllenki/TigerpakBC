namespace TigerpakBC.TigerpakBC;

using Microsoft.Warehouse.Structure;

pageextension 70155 "Bin Contents List Ext" extends "Bin Contents List"
{
    layout
    {
        addafter("Item No.")
        {
            field("Item Description"; Rec."Item Description")   // Cameron Valiantis Request
            {
                ApplicationArea = All;
                Caption = 'Item Description';
                ToolTip = 'Description of the item.';
                Editable = false;
                Enabled = true;
                Visible = true;

            }
        }
    }
}
