 
SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT > 0 THEN 'MDS to DWH data validation failed for f_incident.state_src_key' ELSE 'SUCCESS' END as Message
FROM 
(
SELECT Count(1) as CNT 
FROM png_mdsdb.change_request_final SRC
LEFT JOIN png_mdwdb.d_change_request TRGT ON (SRC.sys_id =TRGT.row_id  AND SRC.sourceinstance= TRGT.source_id  )
JOIN png_mdwdb.d_lov LKP ON LKP.dimension_class like '%REQUIRE_DOWNTIME_C~CHANGE_REQUEST%' and  
(concat('REQUIRE_DOWNTIME_C~CHANGE_REQUEST~~~',upper(u_require_downtime))= LKP.row_id AND SRC.sourceinstance= LKP.source_id ) 
 WHERE COALESCE(LKP.row_key,CASE WHEN SRC.u_require_downtime IS NULL THEN 0 else -1 end)<> (TRGT.require_downtime_src_c_key)
 AND TRGT.soft_deleted_flag='N'
 ) temp; 

 
 