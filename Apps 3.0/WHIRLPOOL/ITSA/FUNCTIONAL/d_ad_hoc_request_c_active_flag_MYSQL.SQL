SELECT CASE WHEN cnt>0  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN cnt>0 THEN 'MDS to DWH data validation failed for d_ad_hoc_request_c.active_flag' ELSE 'SUCCESS' END as Message 
 FROM (select count(1) as cnt from whirlpool_mdsdb.u_ad_hoc_request_final  SRC 
 JOIN whirlpool_mdwdb.d_ad_hoc_request_c TRGT ON SRC.sys_id=TRGT.row_id and SRC.sourceinstance=TRGT.source_id
 where case when SRC.active=1 then 'Y' else 'N' end<>TRGT.active_flag)ma;
 
 