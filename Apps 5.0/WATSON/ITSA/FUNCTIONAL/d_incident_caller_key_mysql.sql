SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for d_incident.caller_key' ELSE 'SUCCESS' END as Message 
FROM watson_mdsdb.incident_final SRC 
JOIN watson_mdwdb.d_incident TRGT 
ON SRC.sys_id=TRGT.row_id 
and SRC.sourceinstance=TRGT.source_id
join watson_mdwdb.d_internal_contact LKP
on COALESCE(CONCAT('INTERNAL_CONTACT~',SRC.caller_id),'UNSPECIFIED')=LKP.row_id
WHERE coalesce(LKP.row_key,case when SRC.caller_id is null then  0 else -1 end )<>TRGT.caller_key