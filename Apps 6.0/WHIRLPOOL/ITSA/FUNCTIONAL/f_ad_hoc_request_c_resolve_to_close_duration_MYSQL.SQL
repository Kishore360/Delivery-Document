SELECT CASE WHEN cnt>0  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN cnt>0 THEN 'MDS to DWH data validation failed for f_ad_hoc_request_c.resolve_to_close_duration' ELSE 'SUCCESS' END as Message 
 FROM (select count(1) as cnt from 
 whirlpool_mdsdb.u_ad_hoc_request_final a
 left join whirlpool_mdwdb.f_ad_hoc_request_c b
 on a.sys_id=b.row_id and a.sourceinstance=b.source_id
 
 where case WHEN (a.u_adhoc_resolved_dt is null or a.closed_at is null) THEN NULL   
	 WHEN TIMESTAMPDIFF(SECOND,a.u_adhoc_resolved_dt,a.closed_at) < 0 THEN NULL
	 ELSE TIMESTAMPDIFF(SECOND,a.u_adhoc_resolved_dt,a.closed_at) end<>b. resolve_to_close_duration
	 and a.cdctype='X')ma
  ;


