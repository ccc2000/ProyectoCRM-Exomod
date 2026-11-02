
page 50201 "DIMA Contratos CORCs"
{
    Caption = 'DIMA Contratos CORCs';
    PageType = List;
    SourceTable = "DIMA Contratos CORCs";
    ApplicationArea = All;
    UsageCategory = Lists;
    Editable = true;

    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field("Entry No."; Rec."Entry No.")
                {
                    ApplicationArea = All;
                    Visible = false;
                }
                field("Client Id"; Rec."End Customer ID")
                {
                    ApplicationArea = All;
                    ToolTip = 'Customer associated with the contract.';
                }
                field("Account Holder ID"; Rec."Account Holder ID")
                {
                    ApplicationArea = All;
                    ToolTip = 'Customer acting as broker or account holder.';
                }
                field("Contract ID"; Rec."Contract ID")
                {
                    ApplicationArea = All;
                }
                field("Account Holder"; Rec."Account Holder")
                {
                    ApplicationArea = All;
                    Editable = false;
                }
                field("End Customer"; Rec."End Customer")
                {
                    ApplicationArea = All;
                    Editable = false;
                }
                field("Start Delivery Year"; Rec."Start Delivery Year")
                {
                    ApplicationArea = All;
                }
                field("End Delivery Year"; Rec."End Delivery Year")
                {
                    ApplicationArea = All;
                }
                field("Volume Contracted"; Rec."Volume Contracted")
                {
                    ApplicationArea = All;
                }
                field("Volume Delivered"; Rec."Volume Delivered")
                {
                    ApplicationArea = All;
                }
                field("Volume Remaining"; Rec."Volume Remaining")
                {
                    ApplicationArea = All;
                }
                field("Price"; Rec."Price")
                {
                    ApplicationArea = All;
                }
                field("Open Balance"; Rec."Open Balance")
                {
                    ApplicationArea = All;
                }
                field("Total Contract Amount"; Rec."Total Contract Amount")
                {
                    ApplicationArea = All;
                }
                field("Type"; Rec."Type")
                {
                    ApplicationArea = All;
                }
                field("Status"; Rec."Status")
                {
                    ApplicationArea = All;
                }
                field("Order No."; Rec."Order No.")
                {
                    ApplicationArea = All;
                }
            }
        }
    }
}
