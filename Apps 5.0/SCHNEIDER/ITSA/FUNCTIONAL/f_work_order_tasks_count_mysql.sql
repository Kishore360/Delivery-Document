SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for f_work_order.tasks_count' ELSE 'SUCCESS' END as Message FROM schneider_mdsdb.woi_workorder_final  SRC JOIN schneider_mdwdb.f_work_order TRGT ON (SRC.work_order_id = TRGT.row_id  AND SRC.sourceinstance = TRGT.source_id ) 
inner join (select woi_assoc.request_id02, woi_assoc.sourceinstance, count(woi_assoc.request_id02) as cnt
from schneider_mdsdb.woi_associations_final woi_assoc
join (SELECT enum_values.value,enum_values.enumId, enum_values.sourceinstance
FROM schneider_mdsdb.field_enum_values_final enum_values
JOIN schneider_mdsdb.field_final field ON (enum_values.fieldId=field.fieldId AND enum_values.schemaId=field.schemaId and enum_values.sourceinstance = field.sourceinstance)
JOIN schneider_mdsdb.arschema_final schma ON (field.schemaId=schma.schemaId and field.sourceinstance = schma.sourceinstance) where field.fieldName ='Request Type01' AND schma.NAME='WOI:Associations' and enum_values.value = 'Task') req_type on woi_assoc.request_type01 = req_type.enumId and woi_assoc.sourceinstance = req_type.sourceinstance group by woi_assoc.request_id02, woi_assoc.sourceinstance) src1 on TRGT.row_id = src1.request_id02 and TRGT.source_id = src1.sourceinstance
where TRGT.tasks_count <> src1.cnt;