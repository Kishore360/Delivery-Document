SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_incident.caused_by_change_key' ELSE 'SUCCESS' END as Message
FROM #DWH_TABLE_SCHEMA.f_incident TGT
left join (
select hpd_assoc.request_id02, hpd_assoc.sourceinstance,assoc_type_val, min(request_id01) as latest_change
from #MDS_TABLE_SCHEMA.hlx_hpd_associations_final hpd_assoc 

join(select hpd_assoc.request_id02, hpd_assoc.sourceinstance, assoc_type.value as assoc_type_val, assoc_type.value as assoc_type_id
, min(hpd_assoc.submit_date) as latest_date
from #MDS_TABLE_SCHEMA.hlx_hpd_associations_final hpd_assoc
join (SELECT enum_values.value,enum_values.enumId, enum_values.sourceinstance
FROM #MDS_TABLE_SCHEMA.hlx_field_enum_values_final enum_values
JOIN #MDS_TABLE_SCHEMA.hlx_field_final field ON (enum_values.fieldId=field.fieldId AND enum_values.schemaId=field.schemaId and enum_values.sourceinstance = field.sourceinstance)
JOIN #MDS_TABLE_SCHEMA.hlx_arschema_final schma ON (field.schemaId=schma.schema_Id and field.sourceinstance = schma.sourceinstance and schma.overlaygroup=0) where field.fieldName ='Association Type01' AND schma.NAME='HPD:Associations' 
AND enum_values.value = ('Caused By')
) assoc_type 
on hpd_assoc.association_type01 = assoc_type.value and hpd_assoc.sourceinstance = assoc_type.sourceinstance

join (SELECT enum_values.value,enum_values.enumId, enum_values.sourceinstance
FROM #MDS_TABLE_SCHEMA.hlx_field_enum_values_final enum_values
JOIN #MDS_TABLE_SCHEMA.hlx_field_final field ON (enum_values.fieldId=field.fieldId AND enum_values.schemaId=field.schemaId 
and enum_values.sourceinstance = field.sourceinstance)
JOIN #MDS_TABLE_SCHEMA.hlx_arschema_final schma ON (field.schemaId=schma.schema_Id and field.sourceinstance = schma.sourceinstance 
and schma.overlaygroup=0 ) where field.fieldName ='Request Type01' AND schma.NAME='HPD:Associations' 
and enum_values.value = 'Infrastructure Change') req_type 

on hpd_assoc.request_type01 = req_type.value and hpd_assoc.sourceinstance = req_type.sourceinstance

group by hpd_assoc.request_id02, hpd_assoc.sourceinstance,assoc_type.value,assoc_type.value) base

on(base.request_id02=hpd_assoc.request_id02
and base.sourceinstance=hpd_assoc.sourceinstance
and base.latest_date=hpd_assoc.submit_date
and base.assoc_type_id=hpd_assoc.association_type01)

group by hpd_assoc.request_id02, hpd_assoc.sourceinstance,assoc_type_val) SRC 
on TGT.row_id = SRC.request_id02 and TGT.source_id = SRC.sourceinstance


left join #DWH_TABLE_SCHEMA.d_change_request LKP
on(LKP.row_id=coalesce(case when assoc_type_val='Caused By' then SRC.latest_change end,'UNSPECIFIED'))


where coalesce(TGT.caused_by_change_key,'') <>  coalesce(LKP.row_key,'')