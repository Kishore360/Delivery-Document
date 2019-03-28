SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (
select count(1) as cnt 
from cardinalhealth_mdsdb.rm_defect_final a
 left  JOIN  cardinalhealth_mdwdb.d_defect_rm_c b
on  a.sys_id=b.row_id and a.sourceinstance=b.source_id
where  CONVERT_TZ(a.closed_at,'GMT','America/New_York')<>b.closed_date )ma
