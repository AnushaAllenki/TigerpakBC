tableextension 70103 "Activities Cue TExt" extends "Activities Cue"
{
    fields
    {
        field(70100; "Customers - Blocked"; Integer)
        {
            CalcFormula = count(Customer where(Blocked = filter(<> " ")));
            Caption = 'Customers - Blocked';
            FieldClass = FlowField;
        }


    }


}
