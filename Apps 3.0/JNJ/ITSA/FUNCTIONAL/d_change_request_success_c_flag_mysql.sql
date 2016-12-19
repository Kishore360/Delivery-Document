SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (
select count(1) as cnt from jnj_mdwdb.d_change_request TRGT
join jnj_mdwdb.d_lov_map a12 on TRGT.change_request_status_c_key = a12.row_key
JOIN (select ax.row_id,ax.source_id,SUM(CASE WHEN TIMESTAMPDIFF(HOUR, ax.work_end_on, a15.opened_on) BETWEEN 0 AND 120 THEN 1 ELSE 0	END) as res
from jnj_mdwdb.d_change_request ax
join jnj_mdwdb.f_change_request a13 on ax.row_key = a13.change_request_key
join jnj_mdwdb.f_incident a14 on a14.change_request_key = ax.row_key
join jnj_mdwdb.d_incident a15 on a15.row_key = a14.incident_key)SRC
ON SRC.row_id=TRGT.row_id and SRC.source_id=TRGT.source_id
WHERE TRGT.success_c_flag <> CASE WHEN (a12.dimension_code ='SUCCESSFUL' AND res <=0)  THEN 'Y' ELSE 'N' END 
)E;