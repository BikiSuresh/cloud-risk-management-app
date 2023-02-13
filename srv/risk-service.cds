using {sap.ui.risksmanagement as db} from '../db/schema';

@path: 'service/risk'
service RisksService {
    entity Risks as projection on db.Risks;
    annotate Risks with @odata.draft.enabled;
    entity Mitigations as projection on db.Mitigations;
    annotate Mitigations with @odata.draft.enabled;
}