
report 50200 "DIMA Hist. y Contratos CORCs"
{
    Caption = 'DIMA Historial y Contratos CORCs';
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    DefaultLayout = RDLC;
    RDLCLayout = './src/ReportLayouts/DIMA_HistorialCORCs.rdlc';

    dataset
    {
        dataitem(CompanyInfo; "Company Information")
        {
            column(CompanyName; Name) { }
            column(CompanyPicture; Picture) { }

            trigger OnAfterGetRecord()
            begin
                CalcFields(Picture);
            end;
        }

        dataitem(Contract; "DIMA Contratos CORCs")
        {
            RequestFilterFields = "Contract ID", "Client Id",
                                  "Status", "Type";

            column(ContractEntryNo; "Entry No.") { }
            column(ContractID; "Contract ID") { }
            column(ClientId; "Client Id") { }
            column(AccountHolder; "Account Holder") { }
            column(EndCustomer; "End Customer") { }
            column(StartDeliveryYear; "Start Delivery Year") { }
            column(EndDeliveryYear; "End Delivery Year") { }
            column(VolumeContracted; "Volume Contracted") { }
            column(VolumeDelivered; "Volume Delivered") { }
            column(VolumeRemaining; "Volume Remaining") { }
            column(ContractPrice; Price) { }
            column(ContractOpenBalance; "Open Balance") { }
            column(TotalContractAmount; "Total Contract Amount") { }
            column(ContractType; Type) { }
            column(ContractStatus; Status) { }

            dataitem(TransactionHistory; "DIMA Hist. de Transacciones")
            {
                DataItemLinkReference = Contract;
                DataItemLink = "Contract ID" = field("Contract ID");

                RequestFilterFields = "Transaction Date",
                          "Payment Date",
                          "Payment Status";

                column(th_Entry_No; "Entry No.") { }
                column(th_Transaction_Id; "Transaction Id") { }
                column(th_Client_Id; "Client Id") { }
                column(th_FY; FY) { }
                column(th_FY_Payment_Month; "FY Payment Month") { }
                column(th_Facility; Facility) { }
                column(th_Facility_Id; "Facility Id") { }
                column(th_Transaction_Date; "Transaction Date") { }
                column(th_Payment_Date; "Payment Date") { }
                column(th_Expected_Payment_Date; "Expected Payment Date") { }
                column(th_Account_Holder; "Account Holder") { }
                column(th_Second_Broker; "Second Broker") { }
                column(th_End_Client; "End Client") { }
                column(th_Volume; Volume) { }
                column(th_Invoice_Amount; "Invoice Amount") { }
                column(th_Open_Balance; "Open Balance") { }
                column(th_Price; Price) { }
                column(th_Status; Status) { }
                column(th_Payment_Status; "Payment Status") { }
                column(th_Contract_ID; "Contract ID") { }
                column(th_Invoice; Invoice) { }
                column(th_Type; Type) { }
                column(th_Comments; Comments) { }
            }
        }
    }
    requestpage
    {
        Caption = 'Filtros del reporte';

        SaveValues = true;

        layout
        {
            area(Content)
            {
                group(General)
                {
                    Caption = 'Filtros de contratos';

                    // Los filtros de Contract ya se generan
                    // mediante RequestFilterFields.
                }
            }
        }
    }
}
