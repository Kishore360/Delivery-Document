SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for d_outage.operational_flag_c' ELSE 'SUCCESS' END as Message FROM 
fidelity_mdsdb.us_lp_module_final  SRC 
JOIN fidelity_mdwdb.d_lp_module TRGT 
ON (SRC.row_id = TRGT.row_id  AND SRC.sourceinstance = TRGT.source_id ) 
 WHERE SRC.product_position_c <>(TRGT.product_position_c) and SRC.cdctype<>'D';
 
 

