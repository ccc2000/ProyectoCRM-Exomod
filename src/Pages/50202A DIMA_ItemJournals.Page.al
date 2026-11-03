
namespace DIMA.Inventory.API;

using Microsoft.Inventory.Journal;

page 50202 "DIMA API Item Journals"
{
    PageType = API;
    SourceTable = "Item Journal Batch";

    APIPublisher = 'dima';
    APIGroup = 'inventory';
    APIVersion = 'v1.0';

    EntityName = 'itemJournal';
    EntitySetName = 'itemJournals';

    ODataKeyFields = SystemId;
    DelayedInsert = true;

    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field(id; Rec.SystemId)
                {
                    Editable = false;
                }

                field(name; Rec.Name)
                {
                }

                field(journalTemplateName; Rec."Journal Template Name")
                {
                }

                part(itemJournalLines; "DIMA API Item Journal Lines")
                {
                    EntityName = 'itemJournalLine';
                    EntitySetName = 'itemJournalLines';

                    SubPageLink =
                        "Journal Template Name" = field("Journal Template Name"),
                        "Journal Batch Name" = field(Name);
                }
            }
        }
    }
}
