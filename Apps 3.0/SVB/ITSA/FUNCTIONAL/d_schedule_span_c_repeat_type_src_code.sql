 SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (
select count(1) as cnt 
from svb_mdsdb.cmn_schedule_span_final a
 left  JOIN  svb_mdwdb.d_schedule_span_c  b
on  b.ROW_ID = a.SYS_ID and a.sourceinstance=b.source_id
where  a.repeat_type<>b.repeat_type_src_code
 )c
