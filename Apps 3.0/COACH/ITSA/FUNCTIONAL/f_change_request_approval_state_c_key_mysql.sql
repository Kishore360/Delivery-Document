


SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (
select count(1) as cnt
from coach_mdsdb.change_request_final a
 left JOIN  coach_mdwdb.f_change_request b
on  b.ROW_ID = a.SYS_ID and a.sourceinstance=b.source_id
 left join coach_mdwdb.d_lov c 
on  CONCAT('APPROVAL_STATE~CHANGE_REQUEST~~~',a.u_approval_state)=c.row_id 
 where c.row_key <> b.approval_state_c_key and  dimension_class like '%APPROVAL_STATE%' )b

