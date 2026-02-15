pageextension 70100 SalesOrder_OnHold extends "Sales Order"
{
    layout
    {
        addafter("Back Order Called")
        {
            field(OnHold; Rec.OnHold)
            {
                ApplicationArea = all;
            }
        }
        addafter("Sell-to Customer Name")
        {
            field("Alt Address"; Rec."Alt Address")
            {
                ApplicationArea = all;
                Caption = 'Alt Address';
                Style = Favorable;
                Editable = false;
                Visible = false;
            }


        }

        addafter("Delivery/Despatch Instructions")
        {
            field("WHSE Shipment Created By"; Rec."WHSE Shipment Created By")
            {
                ApplicationArea = All;
                Caption = 'WHSE Shipment Created By';
                Editable = false;
            }
        }

        // modify("Ship-to Address")  //Commented beacause of Shipping state vs Warehouse Location logic is enough and working fine - Tommy

        // {
        //     trigger OnAfterValidate()
        //     begin
        //         if rec."Ship-to Address" <> rec."Sell-to Address" then
        //             rec."Alt Address" := 'Alternate Address'
        //         else
        //             rec."Alt Address" := '';
        //     end;
        // }


    }




}

