


 SELECT 
 CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN CNT >0 THEN 'MDS to DWH data validation failed' ELSE 'SUCCESS' END as Message
 FROM (SELECT count(1) as CNT
 FROM cardinalhealth_mdsdb.sys_user_final incf 
 JOIN cardinalhealth_mdwdb.d_internal_contact dfi
 on dfi.row_id = CONCAT('INTERNAL_CONTACT~',incf.sys_id) and dfi.source_id= incf.sourceinstance
where incf.u_rate<> dfi.rate_C)temp


