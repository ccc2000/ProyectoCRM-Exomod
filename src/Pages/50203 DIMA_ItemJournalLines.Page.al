
namespace DIMA.Inventory.API;

using Microsoft.Inventory.Journal;

page 50203 "DIMA API Item Journal Lines"
{
    PageType = API;
    SourceTable = "Item Journal Line";

    APIPublisher = 'dima';
    APIGroup = 'inventory';
    APIVersion = 'v1.0';

    EntityName = 'itemJournalLine';
    EntitySetName = 'itemJournalLines';

    ODataKeyFields = SystemId;
    DelayedInsert = true;
    Extensible = false;

    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field(id; Rec.SystemId)
                {
                    Caption = 'Id';
                    Editable = false;
                }

                field(lineNumber; Rec."Line No.")
                {
                    Caption = 'Line No.';
                }

                field(itemNumber; Rec."Item No.")
                {
                    Caption = 'Item No.';
                }

                field(postingDate; Rec."Posting Date")
                {
                    Caption = 'Posting Date';
                }

                field(entryType; Rec."Entry Type")
                {
                    Caption = 'Entry Type';
                }

                field(documentNumber; Rec."Document No.")
                {
                    Caption = 'Document No.';
                }

                field(description; Rec.Description)
                {
                    Caption = 'Description';
                }

                field(locationCode; Rec."Location Code")
                {
                    Caption = 'Location Code';
                }

                field(quantity; Rec.Quantity)
                {
                    Caption = 'Quantity';
                }

                field(unitOfMeasureCode; Rec."Unit of Measure Code")
                {
                    Caption = 'Unit of Measure Code';
                }

                field(lastModifiedDateTime; Rec.SystemModifiedAt)
                {
                    Caption = 'Last Modified Date Time';
                    Editable = false;
                }
            }
        }
    }

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        Rec."Posting Date" := WorkDate();
        Rec."Entry Type" := Rec."Entry Type"::"Positive Adjmt.";
    end;

    trigger OnInsertRecord(BelowxRec: Boolean): Boolean
    var
        TempItemJournalLine: Record "Item Journal Line" temporary;
        ItemJournalBatch: Record "Item Journal Batch";
        LastItemJournalLine: Record "Item Journal Line";
        JournalTemplateName: Code[10];
        JournalBatchName: Code[10];
    begin
        // 1. Conservar los datos recibidos.
        TempItemJournalLine := Rec;

        // 2. Obtener el diario padre desde el SubPageLink.
        JournalTemplateName := Rec.GetRangeMin("Journal Template Name");
        JournalBatchName := Rec.GetRangeMin("Journal Batch Name");

        // 3. Comprobar que existe la sección del diario.
        ItemJournalBatch.Get(
            JournalTemplateName,
            JournalBatchName);

        // 4. Inicializar el nuevo registro.
        Rec.Init();

        Rec.Validate(
            "Journal Template Name",
            JournalTemplateName);

        Rec.Validate(
            "Journal Batch Name",
            JournalBatchName);

        // 5. Generar número de línea automáticamente.
        LastItemJournalLine.LockTable();

        LastItemJournalLine.SetRange(
            "Journal Template Name",
            JournalTemplateName);

        LastItemJournalLine.SetRange(
            "Journal Batch Name",
            JournalBatchName);

        if LastItemJournalLine.FindLast() then
            Rec."Line No." := LastItemJournalLine."Line No." + 10000
        else
            Rec."Line No." := 10000;

        // Permitir un número de línea enviado explícitamente.
        if TempItemJournalLine."Line No." <> 0 then
            Rec."Line No." := TempItemJournalLine."Line No.";

        // 6. Validar los datos del movimiento.
        if TempItemJournalLine."Posting Date" <> 0D then
            Rec.Validate(
                "Posting Date",
                TempItemJournalLine."Posting Date");

        Rec.Validate(
            "Entry Type",
            TempItemJournalLine."Entry Type");

        Rec.Validate(
            "Item No.",
            TempItemJournalLine."Item No.");

        Rec.Validate(
            "Location Code",
            TempItemJournalLine."Location Code");

        if TempItemJournalLine."Unit of Measure Code" <> '' then
            Rec.Validate(
                "Unit of Measure Code",
                TempItemJournalLine."Unit of Measure Code");

        Rec.Validate(
            "Document No.",
            TempItemJournalLine."Document No.");

        if TempItemJournalLine.Description <> '' then
            Rec.Validate(
                Description,
                TempItemJournalLine.Description);

        Rec.Validate(
            Quantity,
            TempItemJournalLine.Quantity);

        exit(true);
    end;
}
