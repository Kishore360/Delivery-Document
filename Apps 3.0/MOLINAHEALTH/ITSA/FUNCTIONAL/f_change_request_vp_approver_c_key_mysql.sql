SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (
select count(1) as cnt
from   molinahealth_mdsdb.change_request_final a
left join  molinahealth_mdsdb.u_change_approver_final d on d.sys_id=a.u_business_area
left join molinahealth_mdwdb.d_internal_contact c
on concat('INTERNAL_CONTACT~',d.u_vp_approver) = c.row_id
and a.sourceinstance = c.source_id
 left  JOIN   molinahealth_mdwdb.f_change_request b
on  b.ROW_ID = a.SYS_ID and a.sourceinstance=b.source_id
 where 
case when u_vp_approver is NULL then 0 
when c.row_id is NULL and u_vp_approver is not NULL then -1 
else
c.row_key <> b.vp_approver_c_key end )b


