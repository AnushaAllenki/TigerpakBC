pageextension 70109 "Customer Card_Ext" extends "Customer Card"
{
    layout
    {
        addafter("Customized Calendar")
        {
            field("Xmas Trading Hours"; Rec."Xmas Trading Hours")
            {
                ApplicationArea = All;
            }
            field("Marginamount 12months"; Rec.Marginamount_12months)
            {
                ApplicationArea = All;
                Caption = 'Marginamount 12months';

                tooltip = 'Shows the Gross Margin Amount for the last 12 months.';
            }
            field("This Qrtr Sales Amount"; Rec."This Qrtr Sales Amount")
            {
                ApplicationArea = All;
                Caption = 'This Qrtr Sales Amount';
            }
            field("Last Qrtr Sales Amount"; Rec."Last Qrtr Sales Amount")
            {
                ApplicationArea = All;
                Caption = 'Last Qrtr Sales Amount';
            }
        }

        modify("Account Status")
        {
            Editable = false;

        }
        modify("Blocked")
        {
            trigger OnafterValidate()
            var
                userSetup: Record "User Setup";
                user: Record User;
                userconfig: Record "User Configuration";
            // begin
            //     if userSetup.Get("UserID") then
            //         if not userSetup."Allow Unblock Customer" then
            //             if xrec.blocked = xRec.Blocked::Invoice then begin
            //                 if rec.Blocked <> rec.Blocked::Invoice then
            //                     Error('You are not allowed to unblock the customer');
            //             end;

            // end;
            begin

                if userconfig.Get(UserID) then begin
                    if not userconfig."Allow Unblock Customers" then begin
                        if rec.Blocked <> rec.Blocked::Invoice then begin
                            if xrec.blocked = xRec.Blocked::Invoice then
                                Error('You are not allowed to unblock the customer');
                        end;
                    end;
                end else begin
                    //if rec.Blocked = rec.Blocked::Invoice then
                    Error('You are not allowed to unblock the customer');
                end;
            end;
        }

        addafter("Format Region")
        {
            //     field(Industry; Rec.Industry)
            //     {
            //         ApplicationArea = All;
            //         Caption = 'Industry';
            //     }
            // }

            field(Reseller; Rec.Reseller)
            {
                ApplicationArea = All;
                Caption = 'Reseller';
            }
        }
        addafter("Document Sending Profile")
        {
            field("Marketing Industry"; Rec."Marketing Industry")
            {
                ApplicationArea = All;
                Caption = 'Marketing Industry';
            }
        }
        addafter("Marketing Industry")
        {
            field("Marginamount_12months"; Rec."Marginamount_12months")
            {
                ApplicationArea = All;
                Caption = 'Marginamount_12months';

                tooltip = 'Shows the Gross Margin Amount for the last 12 months.';

            }
        }
    }
    // actions
    // {
    //     addafter(Templates)
    //     {
    //         action(CalculateGrossMargin)
    //         {
    //             ApplicationArea = All;
    //             Caption = 'Calculate Gross Margin';
    //             Image = Calculate;
    //             trigger OnAction()
    //             var
    //                 EventSub: Codeunit "EventSubscribers1";
    //             begin
    //                 Rec."Marginamount_12months" := EventSub.CalcGrosMarginLast12Months(Rec."No.");
    //                 Rec.Modify();
    //                 Message('Gross Margin for last 12 months is calculated and updated.');
    //             end;
    //         }
    //     }
    trigger OnOpenPage()
    begin
        REC.SETRANGE("Date Filter", TODAY - 365, TODAY);
        REC.SETRANGE("Qrtr Date Filter", Today - 90, TODAY);
        REC.SETRANGE("Last Qrtr Date Filter", Today - 180, TODAY - 91);
    end;
}

// trigger OnAfterGetRecord()
// var
//     EventSub: Codeunit "eventsubscribers1";
// begin
//     EventSub.CalcGrosMarginLast12Months(Rec."No.");
// end;



