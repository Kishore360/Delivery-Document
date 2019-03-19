 SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (
select count(1) as cnt 
from cardinalhealth_mdsdb.cmdb_ci_outage_final a
JOIN  cardinalhealth_mdwdb.f_outage_c b
on  b.row_id = a.sys_id and a.sourceinstance=b.source_id
join cardinalhealth_mdwdb.d_calendar_date lkp
on COALESCE(DATE_FORMAT(CONVERT_TZ(a.end,'GMT','America/New_York'),'%Y%m%d'),
COALESCE(DATE_FORMAT(CONVERT_TZ(a.sys_updated_on,'GMT','America/New_York'),'%Y%m%d'),
'UNSPECIFIED')) = lkp.row_id
where coalesce(lkp.row_key)<> b.outage_end_key)c

