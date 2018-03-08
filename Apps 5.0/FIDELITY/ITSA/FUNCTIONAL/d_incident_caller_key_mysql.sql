SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_incident.caller_key' ELSE 'SUCCESS' END as Message
FROM
fidelity_mdsdb.incident_final SRC
LEFT JOIN fidelity_mdwdb.d_internal_contact TRGT 
ON (SRC.sourceinstance =TRGT.source_id 
and coalesce(concat('INTERNAL_CONTACT~',SRC.caller_id),'UNSPECIFIED' )= LKP.row_id )
JOIN fidelity_mdwdb.d_incident trgt1
on SRC.sys_id = trgt1.row_id and SRC.sourceinstance = trgt1.source_id
WHERE coalesce(LKP.row_key,case when SRC.caller_id is null then 0 else -1 end) 
<>trgt1.caller_key

