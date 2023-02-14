using RisksService from './risk-service';

annotate RisksService.Risks with {
    title   @title : 'Title';
    prio    @title : 'Priority';
    descr   @title : 'Description';
    miti    @title : 'Mitigation';
    impact  @title : 'Impact';
}

annotate RisksService.Mitigations with {
    ID  @(
        UI.Hidden,
        Common: {
            Text : description,
        }
    );
    description @title : 'Description';
    owner   @title : 'Owner';
    timeline    @title : 'Timeline';
    risks   @title : 'Risks';
}

annotate RisksService.Risks with @(
    UI:{
        HeaderInfo  : {
            $Type : 'UI.HeaderInfoType',
            TypeName : 'Risk',
            TypeNamePlural : 'Risks',
            Title : {
                $Type : 'UI.DataField',
                Value : title
            },
            Description : {
                $Type: 'UI.DataField',
                Value: descr
            }
        },
        SelectionFields  : [
            prio
        ],
        LineItem  : [
            {Value : title },
            {
                Value : miti_ID,
                ![@HTML5.CssDefaults] : { width: '100%'}
            },
            {
                Value: prio ,
                Criticality : criticality
            },
            {
                Value: impact,
                Criticality: criticality
            }

        ],
        Facets  : [
            {
                $Type : 'UI.ReferenceFacet',
                Label : 'Main',
                Target : '@UI.FieldGroup#Main'
            }
        ],
        FieldGroup#Main : {
            $Type : 'UI.FieldGroupType',
            Data :  [
                { Value: miti_ID },
                {
                    Value: prio,
                    Criticality: criticality,
                },
                {
                    Value : impact,
                    Criticality: criticality
                }
            ]
            
        },
    }

){

};

annotate RisksService.Risks with {
    miti @(
        Common :{
            //Show text not ID for mitigation in the context Risk
            Text: miti.description , TextArrangement : #TextOnly,

            ValueList : {
                Label: 'Mitigations',
                CollectionPath : 'Mitigations',
                Parameters : [
                    {
                        $Type : 'Common.ValueListParameterOut',
                        LocalDataProperty: miti_ID,
                        ValueListProperty: 'ID'
                    },
                    {
                        $Type : 'Common.ValueListParameterDisplayOnly',
                        ValueListProperty: 'description',

                    }
                ]
            }
        }
    );
}




