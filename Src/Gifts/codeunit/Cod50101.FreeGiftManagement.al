codeunit 50101 "FreeGiftManagement"
{
    [EventSubscriber(ObjectType::Table, 37, 'OnAfterValidateEvent', 'Quantity', false, false)]
    local procedure AddFreeGift(var Rec: Record "Sales Line")
    var
        FreeGift: Record FreeGifts;
        SalesLine: Record "Sales Line";
        Customer: Record Customer;
    begin
        //if (rec.Type = Rec.Type::Item) and (IsCustomer.GOLD(Rec."Sell-to Customer No.")) then begin
        if (Rec.Type = Rec.Type::Item) and (Customer.get(Rec."Sell-to Customer No.")) then begin
            if FreeGift.Get(Customer."Customer Category SDM", Rec."No.") and (rec.Quantity > FreeGift.MinimumOrderQuantity) then begin
                //integration event refined
                OnBeforeFreeGiftSalesLineAdded(Rec);
                //creates a new sales line with the gift
                SalesLine.Init();
                SalesLine.TransferFields(Rec);
                SalesLine."Line No." := Rec."Line No." + 10000;
                SalesLine.Validate(Quantity, FreeGift.GiftQuantity);
                SalesLine.Validate("Line Discount %", 100);
                if SalesLine.Insert() then;
                //integration event refined
                OnAfterFreeGiftSalesLineAdded(Rec, SalesLine);
            end;
        end;
    end;

    [IntegrationEvent(true, true)]
    local procedure OnBeforeFreeGiftSalesLineAdded(var Rec: Record "Sales Line")
    begin

    end;

    [IntegrationEvent(true, true)]
    local procedure OnAfterFreeGiftSalesLineAdded(var Rec: Record "Sales Line"; var SalesLineGift: Record "Sales Line")
    begin

    end;

    [EventSubscriber(ObjectType::table, 32, 'OnAfterInsertEvent', '', false, false)]
    local procedure OnAfterItemLedgerEntryInsert(var Rec: Record "Item Ledger Entry")
    var
        Customer: Record Customer;
    begin
        if Rec."Entry Type" = rec."Entry Type"::Sale then begin
            if Customer.get(rec."Source No.") then begin
                rec."Customer Category SDM" := Customer."Customer Category SDM";
                rec.Modify();
            end;
        end;
    end;

}