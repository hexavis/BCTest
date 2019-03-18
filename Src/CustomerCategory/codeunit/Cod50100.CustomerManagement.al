codeunit 50100 "Customer Management"
{
    trigger OnRun()
    begin
    end;

    procedure AssignDefaultCategory(CustomerCode: Code[20])
    var
        Customer: Record Customer;
        CostumerCategory: Record "Customer Category";
    begin
        //set default category for a Customer
        Customer.get(CustomerCode);
        CostumerCategory.SetRange(Default, true);
        if CostumerCategory.FindFirst() then begin
            Customer."Customer Category SDM" := CostumerCategory.No;
            Customer.Modify();
        end;
    end;

    procedure AssignDefaltCategory()
    var
        Customer: Record Customer;
        CustomerCategory: Record "Customer Category";
    begin
        //set default category for ALL Customer
        CustomerCategory.SetRange(Default, true);
        if CustomerCategory.FindFirst() then begin
            if Customer.FindSet() then
                repeat
                    Customer."Customer Category SDM" := CustomerCategory.No;
                    Customer.Modify();
                until Customer.Next() = 0;
        end;
    end;
}