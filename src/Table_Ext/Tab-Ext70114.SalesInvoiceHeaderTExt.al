namespace ALProject.ALProject;

using Microsoft.Sales.History;

tableextension 70114 "Sales Invoice Header TExt" extends "Sales Invoice Header"
{
    fields
    {
        field(70130; "Margin Amount_New"; Decimal)
        {
            Caption = 'Margin Amount_New';
            DataClassification = ToBeClassified;
        }

        field(70120; "Total Cost_New"; Decimal)
        {
            Caption = 'Total Cost_New';
            DataClassification = ToBeClassified;
        }


        field(70140; "Margin %_New"; Decimal)
        {
            Caption = 'Margin %_New';
            DataClassification = ToBeClassified;
        }


    }
}
