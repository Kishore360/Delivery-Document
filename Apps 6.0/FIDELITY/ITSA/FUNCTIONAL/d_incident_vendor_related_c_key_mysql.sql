SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for d_time_sheet_c.description' ELSE 'SUCCESS' END as Message 
FROM  
fidelity_mdsdb.incident_final SRC 
JOIN fidelity_mdwdb.d_lov LKP 
on COALESCE(CONCAT('VENDOR_RELATED~INCIDENT~',SRC.u_vendor_related,'UNSPECIFIED')) =LKP.row_id and SRC.sourceinstance=LKP.source_id
JOIN  fidelity_mdwdb.d_incident TRGT 
ON (SRC.sys_id = TRGT.row_id AND SRC.sourceinstance= TRGT.source_id)
WHERE coalesce(LKP.row_key,case when SRC.u_vendor_related  is null then 0 else -1 end)<> TRGT.vendor_related_c_key and SRC.cdctype<>'D'; 





