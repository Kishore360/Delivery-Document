SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for d_outage.operational_flag_c' ELSE 'SUCCESS' END as Message FROM 
fidelity_mdsdb.sys_template_final  SRC 
JOIN fidelity_mdwdb.d_template_c TRGT 
ON (SRC.sys_id = TRGT.row_id  AND SRC.sourceinstance = TRGT.source_id ) 
 WHERE COALESCE(SRC.name, 'UNSPECIFIED') <>(TRGT.name_c) and SRC.cdctype<>'D';
 
 

