
SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (
select count(1) as cnt
from wpl_mdsdb.problem_final a
 JOIN   wpl_mdwdb.d_problem b
on  b.ROW_ID=a.SYS_ID and a.sourceinstance=b.source_id
 where convert_tz(a.u_sunrise_presentation_date,'GMT','America/New_York') <> b.final_rca_completed_c
 and a.CDCTYPE='X') temp;