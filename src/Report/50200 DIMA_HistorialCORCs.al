
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
            column(ContractFilter__TABLECAPTION__________ContractFilter; 'Filtro(s) en Cabecera' + ': ' + ContractFilter) { }
            column(ContractFilter; ContractFilter) { }
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
                          "Status",
                          "Payment Status",
                          "Facility Id",
                          "FY Payment Month";

                column(th_ContractDetailFilter__TABLECAPTION__________ContractDetailFilter; 'Filtro(s) en Detalle' + ': ' + ContractDetailFilter) { }
                column(th_ContractDetailFilter; ContractDetailFilter) { }
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

    trigger OnPreReport()
    begin
        ContractFilter := Contract.GetFilters();
        ContractDetailFilter := ContractDetail.GetFilters();
    end;

    var
        ShowFacilityName: Boolean;
        ContractFilter: Text;
        ContractDetailFilter: Text;

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
                ContractDetail."FY Payment Month" := History."FY Payment Month";
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

                ContractDetail.Status := History.Status;
                ContractDetail."Payment Status" := History."Payment Status";

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
        SalesInvoiceLine: Record "Sales Invoice Line";
        CustLedgEntry: Record "Cust. Ledger Entry";
        ProcessedInvoices: Dictionary of [Text, Boolean];
        InvoiceNos: Text[250];
        InvoiceAmount: Decimal;
        OpenBalance: Decimal;
        PaymentStatus: Enum "DIMA Payment Status";
        InvoiceNo: Text;
        ExpectedPaymentDate: Date;
        PaymentDate: Date;
    begin
        ShipmentLine.SetRange("Order No.", Contract."Order No.");

        if ShipmentLine.FindSet() then
            repeat
                Clear(ProcessedInvoices);
                Clear(InvoiceNos);
                Clear(InvoiceAmount);
                Clear(OpenBalance);

                // Buscar las facturas asociadas a esta línea de remisión.
                SalesInvoiceLine.Reset();
                SalesInvoiceLine.SetRange(
                    "Shipment No.", ShipmentLine."Document No.");
                SalesInvoiceLine.SetRange(
                    "Shipment Line No.", ShipmentLine."Line No.");

                if SalesInvoiceLine.FindSet() then
                    repeat
                        InvoiceNo := SalesInvoiceLine."Document No.";

                        // Evitar contabilizar dos veces una misma factura.
                        if not ProcessedInvoices.ContainsKey(InvoiceNo) then begin
                            ProcessedInvoices.Add(InvoiceNo, true);

                            // Consultar el movimiento de cliente de la factura.
                            CustLedgEntry.Reset();
                            CustLedgEntry.SetRange(
                                "Document Type",
                                CustLedgEntry."Document Type"::Invoice);
                            CustLedgEntry.SetRange(
                                "Document No.", InvoiceNo);

                            if CustLedgEntry.FindFirst() then begin
                                CustLedgEntry.CalcFields(
                                    Amount,
                                    "Remaining Amount");
                                InvoiceAmount += CustLedgEntry."Amount";
                                OpenBalance += CustLedgEntry."Remaining Amount";
                                ExpectedPaymentDate := CustLedgEntry."Due Date";
                                PaymentDate := CustLedgEntry."Closed at Date";

                                if InvoiceNos <> '' then
                                    InvoiceNos += ', ';

                                InvoiceNos += InvoiceNo;
                            end;
                        end;
                    until SalesInvoiceLine.Next() = 0;

                // Determine payment status.
                if InvoiceNos = '' then
                    PaymentStatus := ContractDetail."Payment Status"::" "
                else
                    if OpenBalance < 0 then
                        PaymentStatus := ContractDetail."Payment Status"::Overpaid
                    else
                        if OpenBalance = 0 then
                            PaymentStatus := ContractDetail."Payment Status"::Paid
                        else
                            if OpenBalance >= InvoiceAmount then
                                PaymentStatus := ContractDetail."Payment Status"::Pending
                            else
                                PaymentStatus := ContractDetail."Payment Status"::Partial;

                // Insertar la remisión en la tabla temporal.
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
                ContractDetail."Payment Date" := PaymentDate;

                if PaymentDate <> 0D then
                    ContractDetail."FY Payment Month" := Enum::"DIMA Payment Months".FromInteger(Date2DMY(PaymentDate, 2));

                ContractDetail."Expected Payment Date" :=
                    ExpectedPaymentDate;

                ContractDetail."Account Holder" :=
                    ShipmentLine."Bill-to Customer No.";

                ContractDetail.Volume := ShipmentLine.Quantity;

                ContractDetail."Invoice Amount" := InvoiceAmount;
                ContractDetail."Open Balance" := OpenBalance;
                ContractDetail."Payment Status" := PaymentStatus;
                ContractDetail.Invoice := InvoiceNos;

                ContractDetail.Price := ShipmentLine."Unit Price";
                ContractDetail.Status := ContractDetail.Status::Delivered;
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
