SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for f_task_c.urgency' ELSE 'SUCCESS' END as Message 
FROM mercuryins_mdsdb.task_final SRC
JOIN mercuryins_mdwdb.f_task_c TRGT  
ON (SRC.sys_id  = TRGT.row_id  
AND SRC.sourceinstance = TRGT.source_id )
join mercuryins_mdwdb.d_service LKP
on COALESCE( CONCAT('BUSINESS_SERVICE','~',SRC.cmdb_ci),'UNSPECIFIED')=LKP.row_id
WHERE coalesce(LKP.row_key,case when SRC.cmdb_ci is null then  0 else -1 end )<>TRGT.business_service_key
