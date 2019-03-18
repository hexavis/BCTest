table 50100 "Customer Category"
{
    DrillDownPageId = "Customer Category List";
    LookupPageId = "Customer Category List";
    Caption = 'Customer Category';

    fields
    {
        field(1; No; Code[20])
        {
            DataClassification = CustomerContent;
            Caption = 'No.';
            trigger OnValidate();
            begin

            end;

        }
        field(2; Description; Text[50])
        {
            DataClassification = CustomerContent;
            CaptionML = ENU = 'Description', ITA = 'Descrizione';
        }
        field(3; Default; Boolean)
        {
            DataClassification = CustomerContent;
            Caption = 'Default';
        }
        field(4; TotalCustomersForCategory; Integer)
        {
            FieldClass = FlowField;
            CalcFormula = count (Customer where ("Customer Category SDM" = field (No)));
            CaptionML = ENU = 'Total customers for category', ITA = 'Nr. clienti nella categoria';
        }
        field(5; EnableNewsLetter; Option)
        {
            OptionMembers = " ","Full","Limited";
        }
        field(6; FreeGiftsAvailable; Boolean)
        {
            DataClassification = CustomerContent;
            Caption = 'Free Gifts Available';
        }
    }

    keys
    {
        key(PK; No)
        {
            Clustered = true;
        }

    }

    var
        myInt: Integer;

    trigger OnInsert()
    begin

    end;

    trigger OnModify()
    begin

    end;

    trigger OnDelete()
    begin

    end;

    trigger OnRename()
    begin

    end;

}