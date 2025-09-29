namespace ALProject.ALProject;
using Microsoft.CRM.Contact;

pageextension 70129 "Master Sales Quote Ext" extends "Master Sales Quote"
{

    layout
    {
        addafter("Sell-to Customer Name")
        {
            field("Account Instructions"; Rec."Account Instructions")
            {
                ApplicationArea = All;
                ToolTip = 'Account Instructions';
                Editable = true;
            }

        }


        // addafter(Status)
        // {
        //     field("Quote Type"; Rec."Quote Type")
        //     {
        //         ApplicationArea = All;
        //         Caption = 'Quote Type';
        //         ToolTip = 'Quote Type';
        //         Editable = true;
        //         ShowMandatory = true;
        //     }

        //     field("Quote Status"; Rec."Quote Status")
        //     {
        //         ApplicationArea = All;
        //         Caption = 'Quote Status';
        //         ToolTip = 'Quote Status';
        //         Editable = true;
        //         ShowMandatory = true;
        //     }

        // }
    }
    // actions    // #246-Customer ledger Entry Field
    // {
    //     addafter("Archive Document")
    //     {
    //         action(UpdateTPUnitCost_New)

    //         {
    //             AccessByPermission = TableData Contact = R;
    //             ApplicationArea = Basic, Suite;
    //             Caption = 'UpdateTPCostNew';

    //             //Enabled = ContactSelected;
    //             Image = UpdateUnitCost;
    //             ToolTip = 'Run the task to update TP unit cost_New and TP profit%_New';
    //             trigger OnAction()
    //             var
    //                 Updated: Boolean;
    //             begin
    //                 Updated := Rec.UpdateTPUnitCostNew();
    //                 if Updated then
    //                     Message('TP Unit cost_New and TP Profit%_New Updated!');
    //             end;
    //         }
    //     }
    // modify(UpdateTPCost)   // #246-Customer ledger Entry Field
    // {
    //     Visible = false;
    // }


    //}
}


