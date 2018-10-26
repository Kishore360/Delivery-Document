SELECT 
CASE WHEN cnt>0  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 

CASE WHEN cnt>0  THEN 'MDS to DWH data validation failed for f_incident.Resolved and closed age' ELSE 'SUCCESS' END as Message 

FROM (select count(1) as cnt from 
(select * from pdchs_mdsdb.incident_final where cdctype<>'D')  src  

left join pdchs_mdwdb.f_incident f on src.sys_id=f.row_id AND src.sourceinstance=f.source_id
 
join pdchs_mdwdb.d_lov_map d on (f.state_src_key=d.src_key AND d.dimension_wh_code in ('RESOLVED','CLOSED') AND d.dimension_class='STATE~INCIDENT')
join pdchs_mdwdb.d_lov c on f.age_key=c.row_key 

where src.CDCTYPE<>'D'

AND 

(case when (timestampdiff(SECOND,CONVERT_TZ(src.opened_at,'GMT','America/New_York'), 
CONVERT_TZ(coalesce(src.resolved_at, src.closed_at),'GMT','America/New_York')))> 0 then
(timestampdiff(SECOND, CONVERT_TZ(src.opened_at,'GMT','America/New_York'), 
CONVERT_TZ(coalesce(src.resolved_at, src.closed_at),'GMT','America/New_York'))) else 0 end) <> f.age
 
and 

(f.age-(case when (timestampdiff(SECOND,CONVERT_TZ(src.opened_at,'GMT','America/New_York'), 
CONVERT_TZ(coalesce(src.resolved_at, src.closed_at),'GMT','America/New_York')))> 0 then
(timestampdiff(SECOND, CONVERT_TZ(src.opened_at,'GMT','America/New_York'), 
CONVERT_TZ(coalesce(src.resolved_at, src.closed_at),'GMT','America/New_York'))) else 0 end)) not in (3600,-3600)) temp;