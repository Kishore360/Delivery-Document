SELECT CASE WHEN cnt>0  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN cnt>0 THEN 'MDS to DWH data validation failed for f_ad_hoc_request_c.open_to_close_duration' ELSE 'SUCCESS' END as Message 
 FROM (select count(1) as cnt from 
 whirlpool_mdsdb.u_ad_hoc_request_final a
 left join whirlpool_mdwdb.f_ad_hoc_request_c b
 on a.sys_id=b.row_id and a.sourceinstance=b.source_id
 where CASE WHEN (a.opened_at is null or a.closed_at is null) THEN NULL   
	 WHEN TIMESTAMPDIFF(SECOND,a.opened_at,a.closed_at) < 0 THEN NULL
	 ELSE TIMESTAMPDIFF(SECOND,a.opened_at,a.closed_at) end<>b.open_to_close_duration)ma
  ;


