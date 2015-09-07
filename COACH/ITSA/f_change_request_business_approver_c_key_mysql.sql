
SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (
select count(1) as cnt
from coach_mdsdb.change_request_final a
left join coach_mdwdb.d_internal_contact c
on concat('INTERNAL_CONTACT~',a.u_business_approver) = c.row_id
and a.sourceinstance = c.source_id
 left  JOIN   coach_mdwdb.f_change_request b
on  b.ROW_ID = a.SYS_ID and a.sourceinstance=b.source_id
 where 
case when u_business_approver is NULL then 0 
when c.row_id is NULL and u_business_approver is not NULL then -1 
else
c.row_key <> b.business_approver_c_key end )b

