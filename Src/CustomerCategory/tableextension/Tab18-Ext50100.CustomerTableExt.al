tableextension 50100 "CustomerTableExt" extends Customer
{
    fields
    {
        field(50100; "Customer Category SDM"; code[20])
        {
            TableRelation = "Customer Category".No;
            Caption = 'Customer Category Code';
            DataClassification = CustomerContent;
        }
    }

    var
        myInt: Integer;
}