namespace TigerpakBC.TigerpakBC;

using Microsoft.Warehouse.Structure;
using Microsoft.Inventory.Item;

pageextension 70159 "Bin Contents List Ext" extends "Bin Contents List"
{
    layout
    {
        addafter("Item No.")
        {
            field("Item Description"; rec."Item Description")   // Request from Cameron Valiantis
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
