SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for f_pulse_c.incident_key' ELSE 'SUCCESS' END as Message 
FROM aon_mdsdb.u_aon_pulse_final SRC
JOIN aon_mdwdb.f_pulse_c TRGT  
ON (SRC.sys_id  = TRGT.row_id  
AND SRC.sourceinstance = TRGT.source_id )
join aon_mdwdb.d_incident LKP
on SRC.u_reference_13=LKP.row_id
WHERE coalesce(LKP.row_key,case when SRC.u_reference_13 is null then  0 else -1 end ) <> TRGT.incident_key
