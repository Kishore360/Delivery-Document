SELECT CASE WHEN cnt>0  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN cnt>0 THEN 'MDS to DWH data validation failed for f_ad_hoc_request_c.pivot_date' ELSE 'SUCCESS' END as Message 
 FROM (select count(1) as cnt from 
 whirlpool_mdsdb.u_ad_hoc_request_final a
 left join whirlpool_mdwdb.f_ad_hoc_request_c b
 on a.sys_id=b.row_id and a.sourceinstance=b.source_id 
 where COALESCE(CONVERT_TZ (a.opened_at,'GMT','America/New_York'),
CONVERT_TZ (a.closed_at,'GMT','America/New_York'))<>b.pivot_date)ma
  ;


