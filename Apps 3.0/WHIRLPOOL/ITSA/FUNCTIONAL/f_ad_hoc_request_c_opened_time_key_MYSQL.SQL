SELECT CASE WHEN cnt>0  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN cnt>0 THEN 'MDS to DWH data validation failed for f_ad_hoc_request_c.opened_time_key' ELSE 'SUCCESS' END as Message 
 FROM (select count(1) as cnt  from 
 whirlpool_mdsdb.u_ad_hoc_request_final a
 left join whirlpool_mdwdb.f_ad_hoc_request_c b
 on a.sys_id=b.row_id and a.sourceinstance=b.source_id
 LEFT JOIN whirlpool_mdwdb.d_calendar_time LKP 
on LKP.row_id = COALESCE(DATE_FORMAT(CONVERT_TZ(a.opened_at,'GMT','America/New_York'),'%H%i'),'UNSPECIFIED') and LKP.source_id=a.sourceinstance
WHERE COALESCE(LKP.row_key,case when a.opened_at is null then 0 else -1 end)<>(b.opened_time_key)
)ma
 


