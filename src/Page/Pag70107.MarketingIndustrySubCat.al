namespace TigerpakBC.TigerpakBC;

page 70107 "Marketing Industry_SubCat"
{
    ApplicationArea = All;
    Caption = 'Marketing Industry_SubCat';
    PageType = List;
    SourceTable = "Marketing Industry SubCategory";




    layout
    {
        area(Content)
        {
            repeater(General)
            {
                Caption = 'General';
                field("Marketing Subcategory"; rec."Marketing Subcategory")
                {
                    ApplicationArea = All;
                    Caption = 'Marketing Subcategory';
                }
                field(Decscription; rec.Decscription)
                {
                    ApplicationArea = All;
                    Caption = 'Description';
                }
                field("Marketing Industry Category"; rec."Marketing Industry Category")
                {
                    ApplicationArea = All;
                    Caption = 'Marketing Industry Category';
                    TableRelation = "Market Industry Category"."Market Industry Category";
                }

            }
        }
    }


}


