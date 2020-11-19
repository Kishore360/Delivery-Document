SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for d_outage.operational_flag_c' ELSE 'SUCCESS' END as Message FROM 
fidelity_mdsdb.task_ci_final  SRC 
JOIN fidelity_mdwdb.f_affected_ci TRGT 
ON (SRC.sys_id = TRGT.row_id  AND SRC.sourceinstance = TRGT.source_id )
join  fidelity_mdwdb.d_application LKP
on  COALESCE(CONCAT('APPLICATION~', SRC.ci_item ), 'UNSPECIFIED')= LKP.row_id and
SRC.sourceinstance=LKP.source_id
 WHERE coalesce(LKP.row_key, case when SRC.ci_item is null then 0 else -1 end )  <>(TRGT.affected_ci_application_c_key) and SRC.cdctype<>'D';
 
 

