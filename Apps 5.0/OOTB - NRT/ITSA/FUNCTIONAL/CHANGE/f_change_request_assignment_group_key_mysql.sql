

SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN CNT >0 THEN 'MDS to DWH data validation failed for f_change_request.assignment_group_key' ELSE 'SUCCESS' END as Message
 FROM (SELECT count(1) as CNT
 FROM (select * from <<tenant>>_mdsdb.change_request_final where cdctype<>'D') SRC
 LEFT JOIN <<tenant>>_mdwdb.f_change_request TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id and TRGT.soft_deleted_flag='N'  )
 LEFT JOIN <<tenant>>_mdwdb.d_internal_organization LKP 
 ON ( COALESCE(CONCAT('GROUP','~',SRC.ASSIGNMENT_GROUP),0)= LKP.row_id 
 
AND SRC.sourceinstance= LKP.source_id )
left join (select source_id,max(lastupdated) as lastupdated from <<tenant>>_mdwdb.d_o_data_freshness group by source_id) f1 on (f1.source_id = SRC.sourceinstance)
 where (SRC.cdctime<=f1.lastupdated) and COALESCE(LKP.row_key,CASE WHEN SRC.assignment_group IS NULL THEN 0 else -1 end)<> TRGT.assignment_group_key)temp;
