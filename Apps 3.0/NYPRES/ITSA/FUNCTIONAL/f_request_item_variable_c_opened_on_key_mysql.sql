
SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (
select count(1) as cnt
from nypres_mdsdb.sc_req_item_final a
left join nypres_mdwdb.f_request_item_variable_c c 
on  a.sys_id = c.ROW_ID and a.sourceinstance=c.source_id
left  JOIN  nypres_mdwdb.d_calendar_date b
on b.row_id = date_format(convert_tz(a.opened_at,'GMT','America/New_York'),'%Y%m%d') 
where b.row_key <> c.opened_on_key) g