tableextension 50101 ItemLedgerEntryExt extends "Item Ledger Entry"
{
    fields
    {
        field(50100; "Customer Category SDM"; Code[20])
        {
            TableRelation = "Customer Category".No;
            Caption = 'Customer Category';
        }
    }

    var
        myInt: Integer;
}