

SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for d_work_order.requested_level' ELSE 'SUCCESS' END as Message FROM schneider_mdsdb.woi_workorder_final  SRC JOIN schneider_mdwdb.d_work_order TRGT ON (SRC.request_id = TRGT.row_id  AND SRC.sourceinstance = TRGT.source_id ) join
(
select EV.value,EV.sourceinstance,max(EV.enumId) as enumid
FROM schneider_mdsdb.field_enum_values_final EV
JOIN schneider_mdsdb.field_final F ON (EV.fieldId=F.fieldId AND EV.schemaId=F.schemaId AND EV.sourceinstance = F.sourceinstance)
JOIN schneider_mdsdb.arschema_final S ON (F.schemaId=S.schemaId and F.sourceinstance = S.sourceinstance)
WHERE  S.NAME='WOI:WORKORDER'  and F.fieldname='Add Request For:' group by EV.value, EV.sourceinstance) choice 
on choice.enumid=SRC.add_request_for_ and choice.sourceinstance=SRC.sourceinstance
where TRGT.requested_level  <>  choice.value ;
