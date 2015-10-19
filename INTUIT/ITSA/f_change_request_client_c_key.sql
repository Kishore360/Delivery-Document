SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (
select count(1) as cnt 
from intuit_mdsdb.change_request_final s
left join intuit_mdwdb.f_change_request t
on s.sys_id=t.row_id and s.sourceinstance = t.source_id
left join intuit_mdwdb.d_internal_contact lkp
on COALESCE(CONCAT('INTERNAL_CONTACT~',s.u_client),'UNSPECIFIED')=lkp.row_id and s.sourceinstance = lkp.source_id
where lkp.row_key<>client_c_key) temp