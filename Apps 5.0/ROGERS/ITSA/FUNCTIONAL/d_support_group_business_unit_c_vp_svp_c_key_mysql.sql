SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, CASE WHEN count(1) 
 THEN 'MDS to DWH data validation failed for d_support_group_business_unit_c.vp_svp_c_key' ELSE 'SUCCESS' END as Message
-- select distinct LKP.row_id,COALESCE(CONCAT('INTERNAL_CONTACT~',SRC.u_manager_manager_manager_manager),'UNSPECIFIED')
 FROM rogers_mdsdb.u_support_group_businessunit_final  SRC  
JOIN rogers_mdwdb.d_support_group_business_unit_c TRGT 
ON SRC.sys_id= TRGT.row_id  AND SRC.sourceinstance = TRGT.source_id 
join rogers_mdwdb.d_internal_contact LKP
on COALESCE(CONCAT('INTERNAL_CONTACT~',SRC.u_manager_manager_manager_manager),'UNSPECIFIED')=LKP.row_id and SRC.sourceinstance=LKP.row_id
 WHERE  coalesce(LKP.row_key,case when SRC.u_manager_manager_manager_manager is null then -1 else 0 end)<>TRGT.vp_svp_c_key
and SRC.CDCTYPE='X';
