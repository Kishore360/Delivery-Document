SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for d_internal_organization.manager' ELSE 'SUCCESS' END as Message 
FROM  (select * from mcdonalds_mdsdb.sys_user_group_final where cdctype<>'D')  SRC 
JOIN mcdonalds_mdwdb.d_internal_organization TRGT 
ON (concat('GROUP~',SRC.sys_id) = TRGT.row_id  
AND SRC.sourceinstance = TRGT.source_id )  
LEFT JOIN mcdonalds_mdwdb.d_internal_contact LKP 
ON ( concat( 'INTERNAL_CONTACT~' ,upper( SRC.manager)) = LKP.row_id  
AND SRC.sourceinstance = LKP.source_id )  
left join (select source_id,max(lastupdated) as lastupdated from mcdonalds_mdwdb.d_o_data_freshness group by source_id) f1 on (f1.source_id = SRC.sourceinstance)
where (src.cdctime<=f1.lastupdated) and COALESCE(LKP.row_key,CASE WHEN SRC.manager IS NULL THEN 0 else -1 end)<> (TRGT.manager_c_key) 
