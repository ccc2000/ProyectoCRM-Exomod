
report 50200 "DIMA Hist. y Contratos CORCs"
{
    Caption = 'DIMA Historial y Contratos CORCs';
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    DefaultLayout = RDLC;
    RDLCLayout = './src/ReportLayouts/DIMA_HistorialCORCs.rdlc';

    dataset
    {

        dataitem(Contract; "DIMA Contratos CORCs")
        {
            RequestFilterFields = "Contract ID", "Account Holder ID", "End Customer ID",
                                  "Status", "Type";
            column(COMPANYNAME; COMPANYPROPERTY.DisplayName()) { }
            column(ContractEntryNo; "Entry No.") { }
            column(ContractID; "Contract ID") { }
            column(ClientId; "End Customer Id") { }
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

            // dataitem(TransactionHistory; "DIMA Hist. de Transacciones")
            // {
            //     DataItemLinkReference = Contract;
            //     DataItemLink = "Contract ID" = field("Contract ID");

            //     RequestFilterFields = "Transaction Date",
            //               "Payment Date",
            //               "Payment Status";

            //     column(th_Entry_No; "Entry No.") { }
            //     column(th_Transaction_Id; "Transaction Id") { }
            //     column(th_Client_Id; "Client Id") { }
            //     column(th_FY; FY) { }
            //     column(th_FY_Payment_Month; "FY Payment Month") { }
            //     column(th_Facility; Facility) { }
            //     column(th_Facility_Id; "Facility Id") { }
            //     column(th_Transaction_Date; "Transaction Date") { }
            //     column(th_Payment_Date; "Payment Date") { }
            //     column(th_Expected_Payment_Date; "Expected Payment Date") { }
            //     column(th_Account_Holder; "Account Holder") { }
            //     column(th_Second_Broker; "Second Broker") { }
            //     column(th_End_Client; "End Client") { }
            //     column(th_Volume; Volume) { }
            //     column(th_Invoice_Amount; "Invoice Amount") { }
            //     column(th_Open_Balance; "Open Balance") { }
            //     column(th_Price; Price) { }
            //     column(th_Status; Status) { }
            //     column(th_Payment_Status; "Payment Status") { }
            //     column(th_Contract_ID; "Contract ID") { }
            //     column(th_Invoice; Invoice) { }
            //     column(th_Type; Type) { }
            //     column(th_Comments; Comments) { }
            //     column(th_Facility_Print; GetFacilityName("Facility Id", "Facility Id"))
            //     {
            //     }
            // }
            // dataitem(RemisionesVenta; "Sales Shipment Line")
            // {
            //     DataItemLinkReference = Contract;
            //     DataItemLink = "Order No." = field("Order No.");

            //     RequestFilterFields = "Shipment Date",
            //               "Location Code";
            //     column(so_Entry_No; "Line No.") { }
            //     column(so_Transaction_Id; "Document No.") { }
            //     column(so_Client_Id; "Bill-to Customer No.") { }
            //     column(so_FY; '') { }
            //     column(so_FY_Payment_Month; '') { }
            //     column(so_Facility; "Location Code") { }
            //     column(so_Facility_Id; "Location Code") { }
            //     column(so_Transaction_Date; "Posting Date") { }
            //     column(so_Payment_Date; '') { }
            //     column(so_Expected_Payment_Date; '') { }
            //     column(so_Account_Holder; "Bill-to Customer No.") { }
            //     column(so_Second_Broker; '') { }
            //     column(so_End_Client; '') { }
            //     column(so_Volume; Quantity) { }
            //     column(so_Invoice_Amount; "Item Charge Base Amount") { }
            //     column(so_Open_Balance; "Item Charge Base Amount") { }
            //     column(so_Price; "Unit Price") { }
            //     column(so_Status; 'Delivered') { }
            //     column(so_Payment_Status; '') { }
            //     column(so_Contract_ID; "Order No.") { }
            //     column(so_Invoice; '') { }
            //     column(so_Type; Type) { }
            //     column(so_Comments; '') { }
            //     column(so_Facility_Print; GetFacilityName("Location Code", "Location Code")) { }
            // }

            dataitem(ContractDetail; "DIMA CORC Report Details")
            {
                UseTemporary = true;

                DataItemTableView = sorting(
                    "Contract Entry No.",
                    "Sort Order",
                    "Entry No.");

                DataItemLinkReference = Contract;
                DataItemLink = "Contract Entry No." = field("Entry No.");

                RequestFilterFields = "Transaction Date",
                          "Payment Date",
                          "Payment Status",
                          "Facility Id";

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
                column(th_Facility_Print; "Facility Print") { }
                column(DetailSourceType; "Source Type") { }

                trigger OnPreDataItem()
                begin
                    SetRange("Contract Entry No.", Contract."Entry No.");
                end;
            }

            trigger OnAfterGetRecord()
            begin
                ContractDetail.DeleteAll();

                LoadTransactionHistory();
                LoadSalesShipments();
            end;
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
                    Caption = 'Opciones';

                    field(ShowFacilityName; ShowFacilityName)
                    {
                        ApplicationArea = All;
                        Caption = 'Mostrar nombre abreviado del almacén';
                        ToolTip = 'Especifica si se debe imprimir el nombre abreviado del almacén en lugar de su nombre original.';
                    }
                }
            }
        }
    }

    var
        ShowFacilityName: Boolean;

    local procedure GetFacilityName(FacilityId: Code[20]; OriginalFacility: Text[100]): Text[100]
    begin
        if not ShowFacilityName then
            exit(OriginalFacility);

        case FacilityId of
            'PROD-CON':
                exit('Concepción');

            'PROD-GUA':
                exit('Guarayos');

            'PROD-RIB':
                exit('Riberalta');
        end;

        exit(OriginalFacility);
    end;


    local procedure LoadTransactionHistory()
    var
        History: Record "DIMA Hist. de Transacciones";
    begin
        History.SetRange("Contract ID", Contract."Contract ID");

        if History.FindSet() then
            repeat
                ContractDetail.Init();

                ContractDetail."Contract Entry No." := Contract."Entry No.";
                ContractDetail."Sort Order" := 1;
                ContractDetail."Source Type" :=
                    ContractDetail."Source Type"::History;

                ContractDetail."Entry No." := History."Entry No.";
                ContractDetail."Transaction Id" := History."Transaction Id";
                ContractDetail."Client Id" := History."Client Id";
                ContractDetail.FY := Format(History.FY);
                ContractDetail."FY Payment Month" :=
                    Format(History."FY Payment Month");

                ContractDetail.Facility := History.Facility;
                ContractDetail."Facility Id" := History."Facility Id";

                ContractDetail."Transaction Date" := History."Transaction Date";
                ContractDetail."Payment Date" := History."Payment Date";
                ContractDetail."Expected Payment Date" :=
                    History."Expected Payment Date";

                ContractDetail."Account Holder" := History."Account Holder";
                ContractDetail."Second Broker" := History."Second Broker";
                ContractDetail."End Client" := History."End Client";

                ContractDetail.Volume := History.Volume;
                ContractDetail."Invoice Amount" := History."Invoice Amount";
                ContractDetail."Open Balance" := History."Open Balance";
                ContractDetail.Price := History.Price;

                ContractDetail.Status := Format(History.Status);
                ContractDetail."Payment Status" :=
                    Format(History."Payment Status");

                ContractDetail."Contract ID" := History."Contract ID";
                ContractDetail.Invoice := History.Invoice;
                ContractDetail.Type := Format(History.Type);
                ContractDetail.Comments := History.Comments;

                ContractDetail."Facility Print" :=
                    GetFacilityName(
                        History."Facility Id",
                        History."Facility Id");

                ContractDetail.Insert();
            until History.Next() = 0;
    end;


    local procedure LoadSalesShipments()
    var
        ShipmentLine: Record "Sales Shipment Line";
    begin
        ShipmentLine.SetRange("Order No.", Contract."Order No.");

        if ShipmentLine.FindSet() then
            repeat
                ContractDetail.Init();

                ContractDetail."Contract Entry No." := Contract."Entry No.";
                ContractDetail."Sort Order" := 2;
                ContractDetail."Source Type" :=
                    ContractDetail."Source Type"::Shipment;

                ContractDetail."Entry No." := ShipmentLine."Line No.";
                ContractDetail."Transaction Id" := ShipmentLine."Document No.";
                ContractDetail."Client Id" := ShipmentLine."Bill-to Customer No.";

                ContractDetail.Facility := ShipmentLine."Location Code";
                ContractDetail."Facility Id" := ShipmentLine."Location Code";

                ContractDetail."Transaction Date" := ShipmentLine."Posting Date";

                ContractDetail."Account Holder" :=
                    ShipmentLine."Bill-to Customer No.";

                ContractDetail.Volume := ShipmentLine.Quantity;
                ContractDetail."Invoice Amount" :=
                    ShipmentLine."Item Charge Base Amount";
                ContractDetail."Open Balance" :=
                    ShipmentLine."Item Charge Base Amount";
                ContractDetail.Price := ShipmentLine."Unit Price";

                ContractDetail.Status := 'Delivered';
                ContractDetail."Contract ID" := ShipmentLine."Order No.";
                ContractDetail.Type := Format('');

                ContractDetail."Facility Print" :=
                    GetFacilityName(
                        ShipmentLine."Location Code",
                        ShipmentLine."Location Code");

                ContractDetail.Insert();
            until ShipmentLine.Next() = 0;
    end;

}
