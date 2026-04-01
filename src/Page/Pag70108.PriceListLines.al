namespace TigerpakBC.TigerpakBC;

using Microsoft.Pricing.PriceList;

page 70108 "Price List Lines"
{
    ApplicationArea = All;
    Caption = 'Price List Lines';
    PageType = List;
    SourceTable = "Price List Line";

    layout
    {
        area(Content)
        {
            repeater(Control1)
            {
                field(SourceType; Rec."Source Type")
                {
                    Visible = true;
                }
                field(ParentSourceNo; Rec."Parent Source No.")
                {
                    Visible = true;
                }
                field(AssignToParentNo; Rec."Assign-to Parent No.")
                {
                    Visible = true;
                }
                field(AssignToNo; Rec."Assign-to No.")
                {
                    Visible = true;
                }
                field(CurrencyCode; Rec."Currency Code")
                {
                    Visible = true;
                }
                field("Asset Type"; Rec."Asset Type")
                {
                    Visible = true;
                }
                field(Description; Rec.Description)
                {
                    Visible = true;
                }
                field("Variant Code"; Rec."Variant Code")
                {
                    Visible = true;
                }
                field("Work Type Code"; Rec."Work Type Code")
                {
                    Visible = true;
                }
                field("Unit of Measure Code"; Rec."Unit of Measure Code")
                {
                    Visible = true;
                }

                field(SourceNo; Rec."Source No.")
                {
                    Visible = true;
                }
                field(StartingDate; Rec."Starting Date")
                {
                    Visible = true;
                }
                field(EndingDate; Rec."Ending Date")
                {
                    Visible = true;
                }
                field("Product No."; Rec."Product No.")
                {
                    Visible = true;
                }
                field("Minimum Quantity"; Rec."Minimum Quantity")
                {
                }
                field("Published Price"; Rec."Published Price")
                {
                    Visible = true;
                }
                field(Cost; Rec.Cost)
                {
                    Visible = true;
                }
                field("Unit Price"; Rec."Unit Price")
                {
                    Visible = true;
                }
                field("Cost Factor"; Rec."Cost Factor")
                {
                    Visible = true;
                }
                field("Allow Line Disc."; Rec."Allow Line Disc.")
                {
                }


                field("Allow Invoice Disc."; Rec."Allow Invoice Disc.")
                {

                }
                field(PriceIncludesVAT; Rec."Price Includes VAT")
                {

                }
                field(VATBusPostingGrPrice; Rec."VAT Bus. Posting Gr. (Price)")
                {


                }
            }
        }
    }


}

