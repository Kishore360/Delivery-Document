 SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (
select count(1) as cnt 
from 
svb_mdwdb.d_schedule_span_c d 
join 
svb_mdsdb.cmn_schedule_span_final p
on d.row_id = p.sys_id and d.source_id = p.sourceinstance
join svb_mdwdb.d_schedule_c l
on p.schedule= l.row_id
where  COALESCE(l.row_key,case when p.schedule is null then 0 else -1 end)<>d.schedule_c_key
 )c
