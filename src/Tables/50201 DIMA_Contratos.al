
table 50201 "DIMA Contratos CORCs"
{
    Caption = 'DIMA Contratos CORCs';
    DataCaptionFields = "Contract ID", "Account Holder";
    LookupPageID = "DIMA Contratos CORCs";
    DrillDownPageID = "DIMA Contratos CORCs";

    fields
    {
        field(1; "Entry No."; Integer)
        {
            Caption = 'Entry No.';
            AutoIncrement = true;
        }
        field(2; "End Customer Id"; Code[20])
        {
            Caption = 'End Customer ID';
            TableRelation = Customer."No.";

            trigger OnValidate()
            var
                Customer: Record Customer;
            begin
                "End Customer" := '';

                if "End Customer Id" = '' then
                    exit;

                if Customer.Get("End Customer Id") then
                    "End Customer" := Customer.Name;
            end;
        }
        field(3; "Account Holder ID"; Code[20])
        {
            Caption = 'Account Holder ID';
            TableRelation = Customer."No.";

            trigger OnValidate()
            var
                Customer: Record Customer;
            begin
                "Account Holder" := '';

                if "Account Holder ID" = '' then
                    exit;

                if Customer.Get("Account Holder ID") then
                    "Account Holder" := Customer.Name;
            end;
        }
        field(4; "Contract ID"; Code[20])
        {
            Caption = 'Contract ID';
            OptimizeForTextSearch = true;
            NotBlank = true;
        }
        field(5; "Account Holder"; Text[100])
        {
            Caption = 'Account Holder';
        }
        field(6; "End Customer"; Text[100])
        {
            Caption = 'End Customer';
        }
        field(7; "Start Delivery Year"; Integer)
        {
            Caption = 'Start Delivery Year';
            MinValue = 0;
        }
        field(8; "End Delivery Year"; Integer)
        {
            Caption = 'End Delivery Year';
            MinValue = 0;
        }
        field(9; "Volume Contracted"; Decimal)
        {
            Caption = 'Volume Contracted (CORCs)';
            DecimalPlaces = 0 : 5;
            MinValue = 0;
        }
        field(10; "Volume Delivered"; Decimal)
        {
            Caption = 'Volume Delivered (CORCs)';
            DecimalPlaces = 0 : 5;
            MinValue = 0;
        }
        field(11; "Volume Remaining"; Decimal)
        {
            Caption = 'Volume Remaining (CORCs)';
            DecimalPlaces = 0 : 5;
            MinValue = 0;
        }
        field(12; "Price"; Decimal)
        {
            Caption = 'Price (USD/CORC)';
            DecimalPlaces = 0 : 5;
            MinValue = 0;
        }
        field(13; "Open Balance"; Decimal)
        {
            Caption = 'Open Balance (USD)';
            DecimalPlaces = 0 : 2;
        }
        field(14; "Total Contract Amount"; Decimal)
        {
            Caption = 'Total Contract Amount (USD)';
            DecimalPlaces = 0 : 2;
        }
        field(15; "Type"; Enum "DIMA Contract Type")
        {
            Caption = 'Type';
        }
        field(16; "Status"; Enum "DIMA Contract Status")
        {
            Caption = 'Status';
        }
        field(17; "Order No."; Code[20])
        {
            Caption = 'Order No.';
            TableRelation = "Sales Header"."No.";
        }
    }

    keys
    {
        key(PK; "Contract ID")
        {
            Clustered = true;
            Unique = false;
        }
    }
    fieldgroups
    {
        fieldgroup(DropDown; "Contract ID", "Account Holder", "End Customer", "Total Contract Amount", "Status")
        {
        }
    }
}
