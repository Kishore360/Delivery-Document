SELECT CASE WHEN cnt>0  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN cnt>0 THEN 'MDS to DWH data validation failed for f_ad_hoc_request_c.open_to_resolve_duration' ELSE 'SUCCESS' END as Message 
 FROM (select count(1) as cnt from 
 whirlpool_mdsdb.u_ad_hoc_request_final a
 left join whirlpool_mdwdb.f_ad_hoc_request_c b
 on a.sys_id=b.row_id and a.sourceinstance=b.source_id
 where CASE WHEN (a.opened_at is null or a.u_adhoc_resolved_dt is null) THEN NULL   
	 WHEN TIMESTAMPDIFF(SECOND,a.opened_at,a.u_adhoc_resolved_dt) < 0 THEN NULL
     ELSE TIMESTAMPDIFF(SECOND,a.opened_at,a.u_adhoc_resolved_dt) end <>b.open_to_resolve_duration)ma
  ;


