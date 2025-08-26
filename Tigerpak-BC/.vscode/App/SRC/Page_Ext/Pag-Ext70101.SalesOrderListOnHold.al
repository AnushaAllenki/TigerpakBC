pageextension 70101 "SalesOrderList_On Hold" extends "Sales Order List"
{
    layout
    {
        modify("No.")
        {
            StyleExpr = Styleexpvar;
        }

        modify("Sell-to Customer No.")
        {
            StyleExpr = Styleexpvar;
        }
        modify("Sell-to Customer Name")
        {
            StyleExpr = Styleexpvar;
        }
        modify("Account Instructions")
        {
            StyleExpr = Styleexpvar;
        }
        modify("External Document No.")
        {
            StyleExpr = Styleexpvar;
        }
        modify("WH Exist")
        {
            StyleExpr = Styleexpvar;
        }

        modify("Back Order")
        {
            StyleExpr = Styleexpvar;
        }
        modify("Backorder Reason")
        {
            StyleExpr = Styleexpvar;
        }
        modify("WT Completely Picked")
        {
            StyleExpr = Styleexpvar;
        }
        modify("Location Code")
        {
            StyleExpr = Styleexpvar;
        }
        modify("Assigned User ID")
        {
            StyleExpr = Styleexpvar;
        }
        modify("Document Date")
        {
            StyleExpr = Styleexpvar;
        }
        modify(Status)
        {
            StyleExpr = Styleexpvar;
        }
        modify("Completely Shipped")
        {
            StyleExpr = Styleexpvar;
        }

        modify("Amt. Ship. Not Inv. (LCY)")
        {
            StyleExpr = Styleexpvar;
        }
        modify("Amt. Ship. Not Inv. (LCY) Base")
        {
            StyleExpr = Styleexpvar;
        }
        modify("Amount Including VAT")
        {
            StyleExpr = Styleexpvar;
        }
        modify("Your Reference")
        {
            StyleExpr = Styleexpvar;
        }
        modify(Amount)
        {
            StyleExpr = Styleexpvar;
        }
        modify("System Created By")
        {
            StyleExpr = Styleexpvar;
        }
        modify("System Created At")
        {
            StyleExpr = Styleexpvar;
        }
        modify(SystemModifiedBy)
        {
            StyleExpr = Styleexpvar;
        }
        modify(SystemModifiedAt)
        {
            StyleExpr = Styleexpvar;
        }


    }
    actions
    {
        addafter("Pla&nning")
        {
            action("Update Created By")
            {
                ApplicationArea = Basic, Suite;
                Caption = 'Update Created By';
                Ellipsis = true;
                Image = Action;

                trigger OnAction()

                var
                    Sales_Header: Record "Sales Header";
                    Users: Record User;

                begin
                    Sales_Header.Reset();
                    Sales_Header.SetRange("Document Type", Rec."Document Type"::Order);
                    Sales_Header.SetRange("Created By", '');
                    if Sales_Header.FindFirst() then
                        repeat
                            if Users.Get(Sales_Header.SystemCreatedBy) then begin
                                Sales_Header."Created By" := users."User Name";
                                Sales_Header.Modify();
                            end;


                        until Sales_Header.Next() = 0;



                end;


            }


        }
        // addafter("Update Created By")

        // {
        //     action("Update Modified By")
        //     {
        //         ApplicationArea = Basic, Suite;
        //         Caption = 'Update Modified By';
        //         Ellipsis = true;
        //         Image = Action;

        //         trigger OnAction()

        //         var
        //             Sales_Header: Record "Sales Header";
        //             Users: Record User;

        //         begin
        //             Sales_Header.Reset();
        //             Sales_Header.SetRange("Document Type", Rec."Document Type"::Order);
        //             //  Sales_Header.SetRange("Modified By", '');
        //             if Sales_Header.FindFirst() then
        //                 repeat
        //                     if Users.Get(Sales_Header.SystemModifiedBy) then begin
        //                         Sales_Header."Modified By" := users."User Name";
        //                         Sales_Header.Modify();
        //                     end;


        //                 until Sales_Header.Next() = 0;



        //         end;


        //     }


        // }

    }




    trigger OnAfterGetRecord()
    begin
        setstyle();
    end;

    trigger OnAfterGetCurrRecord()
    begin
        setstyle();
    end;

    procedure setstyle()
    begin
        Clear(Styleexpvar);
        if rec."OnHold" then
            Styleexpvar := 'Unfavorable'
        else
            Styleexpvar := 'None';

    end;

    var

        Styleexpvar: Text;





}


