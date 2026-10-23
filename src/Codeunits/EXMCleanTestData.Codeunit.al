/*
codeunit 50111 "EXM Clean Test Data"
{
    Permissions =
        tabledata "Sales Header" = D,
        tabledata "Sales Line" = D,
        tabledata "Sales Shipment Header" = D,
        tabledata "Sales Shipment Line" = D,
        tabledata "Sales Invoice Header" = D,
        tabledata "Sales Invoice Line" = D,
        tabledata "Sales Cr.Memo Header" = D,
        tabledata "Sales Cr.Memo Line" = D,
        tabledata "Cust. Ledger Entry" = D,
        tabledata "Detailed Cust. Ledg. Entry" = D,
        tabledata "Purchase Header" = D,
        tabledata "Purchase Line" = D,
        tabledata "Purch. Rcpt. Header" = D,
        tabledata "Purch. Rcpt. Line" = D,
        tabledata "Purch. Inv. Header" = D,
        tabledata "Purch. Inv. Line" = D,
        tabledata "Purch. Cr. Memo Hdr." = D,
        tabledata "Purch. Cr. Memo Line" = D,
        tabledata "Vendor Ledger Entry" = D,
        tabledata "Detailed Vendor Ledg. Entry" = D,
        tabledata "Warehouse Receipt Header" = D,
        tabledata "Warehouse Receipt Line" = D,
        tabledata "Warehouse Shipment Header" = D,
        tabledata "Warehouse Shipment Line" = D,
        tabledata "Item Ledger Entry" = D,
        tabledata "Value Entry" = D,
        tabledata "G/L Entry" = D,
        tabledata "G/L Register" = D,
        tabledata "VAT Entry" = D;

    trigger OnRun()
    begin
        CleanAllData();
    end;

    local procedure CleanAllData()
    var
        SalesHeader: Record "Sales Header";
        SalesLine: Record "Sales Line";
        SalesShptHeader: Record "Sales Shipment Header";
        SalesShptLine: Record "Sales Shipment Line";
        SalesInvHeader: Record "Sales Invoice Header";
        SalesInvLine: Record "Sales Invoice Line";
        SalesCrMemoHeader: Record "Sales Cr.Memo Header";
        SalesCrMemoLine: Record "Sales Cr.Memo Line";
        CustLedgerEntry: Record "Cust. Ledger Entry";
        DetailedCustLedgEntry: Record "Detailed Cust. Ledg. Entry";
        PurchHeader: Record "Purchase Header";
        PurchLine: Record "Purchase Line";
        PurchRcptHeader: Record "Purch. Rcpt. Header";
        PurchRcptLine: Record "Purch. Rcpt. Line";
        PurchInvHeader: Record "Purch. Inv. Header";
        PurchInvLine: Record "Purch. Inv. Line";
        PurchCrMemoHdr: Record "Purch. Cr. Memo Hdr.";
        PurchCrMemoLine: Record "Purch. Cr. Memo Line";
        VendLedgerEntry: Record "Vendor Ledger Entry";
        DetailedVendLedgEntry: Record "Detailed Vendor Ledg. Entry";
        WhseReceiptHeader: Record "Warehouse Receipt Header";
        WhseReceiptLine: Record "Warehouse Receipt Line";
        WhseShptHeader: Record "Warehouse Shipment Header";
        WhseShptLine: Record "Warehouse Shipment Line";
        ItemLedgerEntry: Record "Item Ledger Entry";
        ValueEntry: Record "Value Entry";
        GLEntry: Record "G/L Entry";
        GLRegister: Record "G/L Register";
        VATEntry: Record "VAT Entry";
    begin
        // Ventas abiertas
        SalesLine.DeleteAll();
        SalesHeader.DeleteAll();

        // Envíos venta contabilizados
        SalesShptLine.DeleteAll();
        SalesShptHeader.DeleteAll();

        // Facturas y notas crédito venta
        SalesCrMemoLine.DeleteAll();
        SalesCrMemoHeader.DeleteAll();
        SalesInvLine.DeleteAll();
        SalesInvHeader.DeleteAll();

        // Movimientos cliente
        DetailedCustLedgEntry.DeleteAll();
        CustLedgerEntry.DeleteAll();

        // Almacén
        WhseShptLine.DeleteAll();
        WhseShptHeader.DeleteAll();
        WhseReceiptLine.DeleteAll();
        WhseReceiptHeader.DeleteAll();

        // Compras abiertas
        PurchLine.DeleteAll();
        PurchHeader.DeleteAll();

        // Recepciones, facturas y notas crédito compra
        PurchRcptLine.DeleteAll();
        PurchRcptHeader.DeleteAll();
        PurchInvLine.DeleteAll();
        PurchInvHeader.DeleteAll();
        PurchCrMemoLine.DeleteAll();
        PurchCrMemoHdr.DeleteAll();

        // Movimientos proveedor
        DetailedVendLedgEntry.DeleteAll();
        VendLedgerEntry.DeleteAll();

        // Inventario
        ValueEntry.DeleteAll();
        ItemLedgerEntry.DeleteAll();

        // Contabilidad — siempre al final
        VATEntry.DeleteAll();
        GLEntry.DeleteAll();
        GLRegister.DeleteAll();

        Message('Todos los datos de prueba fueron eliminados correctamente.');
    end;
}

*/