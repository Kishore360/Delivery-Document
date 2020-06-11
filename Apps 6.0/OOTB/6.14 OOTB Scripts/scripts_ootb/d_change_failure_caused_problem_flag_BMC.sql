SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_change_failure.problems_caused_by_change' ELSE 'SUCCESS' END as Message
from
 (SELECT * FROM   #MDS_TABLE_SCHEMA.hlx_chg_infrastructure_change_final WHERE CDCTYPE<>'D')SRC_main
left join
(SELECT SRC.sourceinstance AS source_id, SRC.Infrastructure_Change_ID AS row_id, COUNT(SRC1.Request_ID01) AS incident_count,
SRC1.Request_ID01 AS request_id FROM   #MDS_TABLE_SCHEMA.hlx_chg_infrastructure_change_final SRC      
INNER JOIN    #MDS_TABLE_SCHEMA.hlx_chg_associations_final SRC1 
ON SRC.Infrastructure_Change_ID=SRC1.Request_ID02 and SRC.sourceinstance=SRC1.sourceinstance 
INNER JOIN   #MDS_TABLE_SCHEMA.hlx_field_enum_values_final field_enum_values 
ON SRC1.Association_Type01=field_enum_values.enumId 
and SRC1.sourceinstance=field_enum_values.sourceinstance 
and field_enum_values.value='Caused' 
INNER JOIN   #MDS_TABLE_SCHEMA.hlx_field_final field 
ON field_enum_values.fieldId=field.fieldId 
and field_enum_values.schemaId=field.schemaId 
and field_enum_values.sourceinstance=field.sourceinstance 
INNER JOIN   #MDS_TABLE_SCHEMA.hlx_arschema_final arschema 
ON field.schemaId=arschema.schema_Id 
and field.sourceinstance=arschema.sourceinstance 
and arschema.overlayGroup=0    
WHERE arschema.name='CHG:Infrastructure Change' GROUP BY 1,2,4)SRC_temp
on SRC_main.infrastructure_change_id=SRC_temp.row_id          
left join
(SELECT SRC1.sourceinstance AS source_id, concat(SRC1.Incident_Number,'~',SRC3.Problem_Investigation_ID) AS row_id, count(incident_number)
 as problem_count, 
SRC1.cdctype AS cdctype, SRC1.Incident_Number AS incident_number        
FROM   #MDS_TABLE_SCHEMA.hlx_hpd_help_desk_final SRC1      
INNER JOIN   #MDS_TABLE_SCHEMA.hlx_hpd_associations_final SRC2 
ON SRC1.Incident_Number = SRC2.Request_ID02 
and SRC1.sourceinstance = SRC2.sourceinstance 
INNER JOIN   #MDS_TABLE_SCHEMA.hlx_pbm_problem_investigation_final SRC3 
ON SRC3.Problem_Investigation_ID = SRC2.Request_ID01 
and SRC3.sourceinstance = SRC2.sourceinstance 
INNER JOIN   #MDS_TABLE_SCHEMA.hlx_field_enum_values_final SRC4 
ON SRC2.Association_Type01 = SRC4.enumId 
and SRC2.sourceinstance = SRC4.sourceinstance 
and SRC4.value = 'Related to' 
INNER JOIN   #MDS_TABLE_SCHEMA.hlx_field_final SRC5 
ON SRC4.fieldId = SRC5.fieldId  
and SRC4.schemaId = SRC5.schemaId  
and SRC4.sourceinstance = SRC5.sourceinstance 
INNER JOIN   #MDS_TABLE_SCHEMA.hlx_arschema_final arschema 
ON SRC5.schemaId = arschema.schema_Id 
and arschema.overlayGroup = 0 
and SRC5.sourceinstance = arschema.sourceinstance    
WHERE arschema.name = 'PBM:Problem Investigation' group by 1,2,4
)src_temp1
on SRC_temp.request_id=src_temp1.incident_number   
left join(select * from   #DWH_TABLE_SCHEMA.d_change_failure where year(effective_to)=2999)TRGT
on SRC_main.infrastructure_change_id=TRGT.row_id
and SRC_main.sourceinstance=TRGT.source_id
where coalesce(case when src_temp1.problem_count> 0 then 'Y' else 'N' end) <> COALESCE(TRGT.caused_problem_flag,'') 
