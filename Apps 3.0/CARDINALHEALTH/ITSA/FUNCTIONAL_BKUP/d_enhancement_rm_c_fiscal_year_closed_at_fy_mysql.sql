 SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (
select count(1) as cnt 
from cardinalhealth_mdsdb.rm_enhancement_final a
 left  JOIN  cardinalhealth_mdwdb.d_enhancement_rm_c b
on  b.ROW_ID = a.SYS_ID and a.sourceinstance=b.source_id
where case when (extract(month from a.closed_at)>6) then  (extract(year from a.closed_at)+1) else 
 (extract(year from a.closed_at)) end<>b.fiscal_year_closed_at)c