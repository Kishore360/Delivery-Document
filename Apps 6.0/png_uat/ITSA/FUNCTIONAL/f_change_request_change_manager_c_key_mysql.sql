
   SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match' 
ELSE 'Data Matched' END AS Message 
FROM (
select count(1) as cnt
from png_mdsdb.change_request_final s
  JOIN png_mdwdb.f_change_request t 
on  t.ROW_ID=s.SYS_ID and s.sourceinstance=t.source_id 
left join png_mdwdb.d_internal_contact l
on  concat('INTERNAL_CONTACT~',s.u_pg_change_manager )= l.row_id
 and s.sourceinstance=l.source_id
WHERE t.change_manager_c_key <> COALESCE(l.row_key,CASE WHEN s.u_pg_change_manager IS NULL THEN 0 else -1 end)) temp;


