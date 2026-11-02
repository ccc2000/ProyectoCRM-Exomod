table 50200 "DIMA Hist. de Transacciones"
{
    Caption = 'DIMA Historial de Transacciones CORCs';
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Entry No."; Integer)
        {
            Caption = 'Entry No.';
            AutoIncrement = true;
        }
        field(2; "Transaction Id"; Code[20])
        {
            Caption = 'Transaction ID';
        }
        field(3; "Client Id"; Code[20])
        {
            Caption = 'Client ID';
            TableRelation = Customer."No.";

            trigger OnValidate()
            var
                Customer: Record Customer;
            begin
                "Account Holder" := '';

                if "Client Id" = '' then
                    exit;

                if Customer.Get("Client Id") then
                    "Account Holder" := Customer.Name;
            end;
        }
        field(4; "FY"; Integer)
        {
            Caption = 'Fiscal Year';
            trigger OnValidate()
            begin
                if ("FY" < 1000) or ("FY" > 9999) then
                    Error('Fiscal Year must be a four-digit positive number.');
            end;
        }
        field(5; "FY Payment Month"; Enum "DIMA Payment Months")
        {
            Caption = 'FY Payment Month';
        }
        field(6; "Facility"; Text[150])
        {
            Caption = 'Facility';
            Editable = false;
        }
        field(7; "Facility Id"; Code[20])
        {
            Caption = 'Facility ID';
            TableRelation = "Location".Code;
            trigger OnValidate()
            var
                Location: Record "Location";
            begin
                "Facility" := '';

                if "Facility Id" = '' then
                    exit;

                if Location.Get("Facility Id") then
                    "Facility" := Location.Name;
            end;
        }
        field(8; "Transaction Date"; Date)
        {
            Caption = 'Transaction Date';
        }
        field(9; "Payment Date"; Date)
        {
            Caption = 'Payment Date';
        }
        field(10; "Expected Payment Date"; Date)
        {
            Caption = 'Expected Payment Date';
        }
        field(11; "Account Holder"; Text[100])
        {
            Caption = 'Account Holder';
        }
        field(121; "Second Broker Id"; Code[20])
        {
            Caption = 'Second Broker ID';
            TableRelation = Customer."No.";

            trigger OnValidate()
            var
                Customer: Record Customer;
            begin
                "Second Broker" := '';

                if "Second Broker Id" = '' then
                    exit;

                if Customer.Get("Second Broker Id") then
                    "Second Broker" := Customer.Name;
            end;
        }
        field(12; "Second Broker"; Text[250])
        {
            Caption = 'Second Broker';
        }
        field(131; "End Client Id"; Code[20])
        {
            Caption = 'End Client ID';
            TableRelation = Customer."No.";

            trigger OnValidate()
            var
                Customer: Record Customer;
            begin
                "End Client" := '';

                if "End Client Id" = '' then
                    exit;

                if Customer.Get("End Client Id") then
                    "End Client" := Customer.Name;
            end;
        }
        field(13; "End Client"; Text[100])
        {
            Caption = 'End Client';
        }
        field(14; "Volume"; Decimal)
        {
            Caption = 'Volume (CORCs)';
            AutoFormatType = 0;
        }
        field(15; "Invoice Amount"; Decimal)
        {
            Caption = 'Invoice Amount (USD)';
            AutoFormatType = 0;
        }
        field(16; "Open Balance"; Decimal)
        {
            Caption = 'Open Balance (USD)';
            AutoFormatType = 0;
        }
        field(17; "Price"; Decimal)
        {
            Caption = 'Price (USD/CORC)';
            AutoFormatType = 0;
        }
        field(18; "Status"; Enum "DIMA Transaction CORCs Status")
        {
            Caption = 'Status';
        }
        field(19; "Payment Status"; Enum "DIMA Payment Status")
        {
            Caption = 'Payment Status';
        }
        field(20; "Contract ID"; Code[20])
        {
            Caption = 'Contract ID';
            TableRelation = "DIMA Contratos CORCs"."Contract ID";
        }
        field(21; "Invoice"; Code[20])
        {
            Caption = 'Invoice No.';
        }
        field(22; "Type"; Enum "DIMA Transaction Type")
        {
            Caption = 'Type';
        }
        field(23; "Comments"; Text[250])
        {
            Caption = 'Comments';
        }
    }

    keys
    {
        key(PK; "Entry No.")
        {
            Clustered = true;
        }
        key(ContractID; "Contract ID")
        {
        }
    }
}