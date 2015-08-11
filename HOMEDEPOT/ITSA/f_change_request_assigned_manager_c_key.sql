
SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (
select count(1) as cnt
from homedepot_mdsdb.change_request_final a
left join homedepot_mdwdb.d_internal_contact c
on concat('INTERNAL_CONTACT~',a.u_assigned_manager ) = c.row_id
and a.sourceinstance = c.source_id
 left  JOIN   homedepot_mdwdb.f_change_request b
on  b.ROW_ID = a.SYS_ID and a.sourceinstance=b.source_id
 where c.row_key <> b.assigned_manager_c_key)b