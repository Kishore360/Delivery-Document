SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for d_outage.operational_flag_c' ELSE 'SUCCESS' END as Message FROM 
fidelity_mdsdb.cmdb_ci_final  SRC 
JOIN fidelity_mdwdb.d_configuration_item TRGT 
ON (SRC.sys_id = TRGT.row_id  AND SRC.sourceinstance = TRGT.source_id )
join fidelity_mdwdb.d_application LKP
on CONCAT('APPLICATION~',SRC.sys_id)  = LKP.row_id and SRC.sourceinstance=LKP.source_id
 WHERE coalesce(LKP.row_key, case when SRC.sys_id is null then 0 else -1 end ) <>(TRGT.application_c_key) and SRC.cdctype<>'D';
 
 

