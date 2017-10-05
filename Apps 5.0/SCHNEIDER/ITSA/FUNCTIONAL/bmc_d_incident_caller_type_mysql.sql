SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, CASE WHEN count(1)  
THEN 'MDS to DWH data validation failed for d_incident.caller_type' ELSE 'SUCCESS' END as Message from schneider_mdsdb.hpd_help_desk_final  SRC JOIN schneider_mdwdb.d_incident TRGT
ON SRC.entry_id = TRGT.row_id  AND SRC.sourceinstance = TRGT.source_id 
join
(
select EV.value,EV.sourceinstance,max(EV.enumId) as enumid
FROM schneider_mdsdb.field_enum_values_final EV
JOIN schneider_mdsdb.field_final F ON (EV.fieldId=F.fieldId AND EV.schemaId=F.schemaId AND EV.sourceinstance = F.sourceinstance)
JOIN schneider_mdsdb.arschema_final S ON (F.schemaId=S.schemaId and F.sourceinstance = S.sourceinstance)
WHERE  F.fieldName  ='Contact Client Type'
and S.NAME='hpd:help desk' group by EV.value, EV.sourceinstance) choice
on choice.enumid=SRC.contact_client_type and choice.sourceinstance=SRC.sourceinstance
WHERE TRGT.caller_type <> choice.value
