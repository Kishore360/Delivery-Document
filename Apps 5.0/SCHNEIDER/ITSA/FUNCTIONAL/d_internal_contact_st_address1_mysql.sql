SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for d_internal_contact.st_address1' ELSE 'SUCCESS' END
FROM schneider_mdsdb.ctm_people_final SRC
JOIN schneider_mdwdb.d_internal_contact TRGT ON CONCAT('INTERNAL_CONTACT','~',SRC.person_id) = TRGT.row_id AND SRC.sourceinstance = TRGT.source_id  
join (
select EV.value,EV.sourceinstance,max(EV.enumId) as enumid
FROM schneider_mdsdb.field_enum_values_final EV
JOIN schneider_mdsdb.field_final F ON (EV.fieldId=F.fieldId AND EV.schemaId=F.schemaId AND EV.sourceinstance = F.sourceinstance)
JOIN schneider_mdsdb.arschema_final S ON (F.schemaId=S.schemaId and F.sourceinstance = S.sourceinstance)
WHERE  F.fieldName  ='Client Type' and S.NAME='CTM:People' group by EV.value, EV.sourceinstance) choice
on choice.enumid=SRC.client_type and choice.sourceinstance=SRC.sourceinstance
WHERE (case when choice.value='Office-Based Employee' then COALESCE(SRC.Site_street,'UNSPECIFIED') 
when choice.value='Home-Based Employee'  then COALESCE(SRC.Home_street,'UNSPECIFIED')  else COALESCE( SRC.Default_street, 'UNSPECIFIED') end ) <> (TRGT.st_address1)