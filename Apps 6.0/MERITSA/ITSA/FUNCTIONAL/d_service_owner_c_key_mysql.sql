SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for f_task_c.urgency' ELSE 'SUCCESS' END as Message 
FROM mercury_mdsdb.cmdb_ci_service_final  SRC 
JOIN mercury_mdwdb.d_service TRGT 
ON (concat('BUSINESS_SERVICE~',SRC.sys_id ) = TRGT.row_id  
AND SRC.sourceinstance = TRGT.source_id )
join mercury_mdwdb.d_internal_contact LKP
on COALESCE(CONCAT('INTERNAL_CONTACT~',SRC.owned_by),'UNSPECIFIED')=LKP.row_id
WHERE coalesce(LKP.row_key,case when SRC.owned_by is null then  0 else -1 end )<>TRGT.owner_c_key  and SRC.CDCTYPE<>'D';
