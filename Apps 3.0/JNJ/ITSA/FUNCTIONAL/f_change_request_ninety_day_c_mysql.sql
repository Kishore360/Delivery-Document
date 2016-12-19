SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (
select count(1) as cnt from jnj_mdwdb.f_change_request TRGT
JOIN (SELECT a11.row_id,a11.source_id, SUM(CASE WHEN TIMESTAMPDIFF(HOUR,a12.work_end_on,a14.opened_on) BETWEEN 0 AND 2160 THEN 1 ELSE 0 END ) as res
from jnj_mdwdb.d_change_request a12
join jnj_mdwdb.f_change_request a11 on a11.change_request_key = a12.row_key
join jnj_mdwdb.d_incident a14 on a13.change_request_key = a12.row_key
join jnj_mdwdb.f_incident a13 on a13.incident_key = a14.row_key) SRC
ON TRGT.row_id = SRC.row_id and TRGT.source_id = SRC.source_id
WHERE TRGT.ninety_day_c <> res