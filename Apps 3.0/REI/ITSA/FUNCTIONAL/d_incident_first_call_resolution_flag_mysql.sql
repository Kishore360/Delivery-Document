SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
from(

select count(1) as cnt
from rei_mdsdb.incident_final b
inner join rei_mdwdb.d_incident a
on
(a.row_id = b.sys_id AND a.source_id=b.sourceinstance AND b.opened_by=b.u_original_resolver AND b.u_original_resolver =b.u_last_resolver AND
 DATE(b.opened_at) = DATE(u_last_resolution_date) AND DATE(b.opened_at) = DATE(b.u_original_resolution_date)) 
join
rei_mdsdb.sys_user_final s
 on b.opened_by=s.sys_id  and b.sourceinstance= s.sourceinstance 
where case when s.manager= '0e039e450a0a3c1f00ab757f305c61bf' then 'Y' else 'N' end<> a.first_call_resolution_flag)a;

