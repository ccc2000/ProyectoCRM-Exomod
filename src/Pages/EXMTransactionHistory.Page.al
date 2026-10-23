page 50200 "EXM Transaction History"
{
    Caption = 'Transaction History';
    PageType = List;
    SourceTable = "EXM Transaction History";
    ApplicationArea = All;
    UsageCategory = Lists;
    Editable = true;

    layout
    {
        area(Content)
        {
            repeater(Lines)
            {
                field("Entry No."; Rec."Entry No.")
                {
                    ApplicationArea = All;
                    Visible = false;
                }
                field("Transaction Id"; Rec."Transaction Id") { ApplicationArea = All; }
                field("Client Id"; Rec."Client Id") { ApplicationArea = All; }
                field("FY"; Rec."FY") { ApplicationArea = All; }
                field("FY Payment Month"; Rec."FY Payment Month") { ApplicationArea = All; }
                field("Facility"; Rec."Facility") { ApplicationArea = All; }
                field("Facility Id"; Rec."Facility Id") { ApplicationArea = All; }
                field("Transaction Date"; Rec."Transaction Date") { ApplicationArea = All; }
                field("Payment Date"; Rec."Payment Date") { ApplicationArea = All; }
                field("Expected Payment Date"; Rec."Expected Payment Date") { ApplicationArea = All; }
                field("Account Holder"; Rec."Account Holder") { ApplicationArea = All; }
                field("Second Broker"; Rec."Second Broker") { ApplicationArea = All; }
                field("End Client"; Rec."End Client") { ApplicationArea = All; }
                field("Volume"; Rec."Volume")
                {
                    ApplicationArea = All;
                    AutoFormatType = 10;
                    AutoFormatExpression = '<precision,2:2><standard format,0>';
                }
                field("Invoice Amount"; Rec."Invoice Amount")
                {
                    ApplicationArea = All;
                    AutoFormatType = 10;
                    AutoFormatExpression = '<precision,2:2><standard format,0>';
                }
                field("Open Balance"; Rec."Open Balance")
                {
                    ApplicationArea = All;
                    AutoFormatType = 10;
                    AutoFormatExpression = '<precision,2:2><standard format,0>';
                }
                field("Price"; Rec."Price")
                {
                    ApplicationArea = All;
                    AutoFormatType = 10;
                    AutoFormatExpression = '<precision,2:2><standard format,0>';
                }
                field("Status"; Rec."Status") { ApplicationArea = All; }
                field("Payment Status"; Rec."Payment Status") { ApplicationArea = All; }
                field("Contract ID"; Rec."Contract ID") { ApplicationArea = All; }
                field("Invoice"; Rec."Invoice") { ApplicationArea = All; }
                field("Type"; Rec."Type") { ApplicationArea = All; }
                field("Comments"; Rec."Comments") { ApplicationArea = All; }
            }
        }
    }
}