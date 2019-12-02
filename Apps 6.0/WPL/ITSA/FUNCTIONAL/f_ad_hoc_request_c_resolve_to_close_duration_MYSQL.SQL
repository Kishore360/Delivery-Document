SELECT CASE WHEN cnt>0  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN cnt>0 THEN 'MDS to DWH data validation failed for f_ad_hoc_request_c.resolve_to_close_duration' ELSE 'SUCCESS' END as Message 
 FROM (select count(1) as cnt from 
 wpl_mdsdb.u_ad_hoc_request_final a
 left join wpl_mdwdb.f_ad_hoc_request_c b
 on a.sys_id=b.row_id and a.sourceinstance=b.source_id
 
 where case WHEN (convert_tz(a.u_adhoc_resolved_dt,'GMT','America/New_York') is null or convert_tz(a.closed_at,'GMT','America/New_York') is null) THEN NULL   
	 WHEN TIMESTAMPDIFF(SECOND,convert_tz(a.u_adhoc_resolved_dt,'GMT','America/New_York'),convert_tz(a.closed_at,'GMT','America/New_York')) < 0 THEN NULL
	 ELSE TIMESTAMPDIFF(SECOND,convert_tz(a.u_adhoc_resolved_dt,'GMT','America/New_York'),convert_tz(a.closed_at,'GMT','America/New_York')) end<>b. resolve_to_close_duration
	 and a.cdctype='X')ma
  ;


