SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for d_outage.operational_flag_c' ELSE 'SUCCESS' END as Message FROM 
fidelity_mdsdb.u_fmr_product_line_final  SRC 
JOIN fidelity_mdwdb.d_fmr_product_line_c TRGT 
ON (SRC.sys_id = TRGT.row_id  AND SRC.sourceinstance = TRGT.source_id ) 
 WHERE COALESCE(SRC.u_discovery_scanner_descriptio, 'UNSPECIFIED') <>(TRGT.description_c) and SRC.cdctype<>'D';
 
 

