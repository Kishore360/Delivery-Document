SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
from(
select count(1) as cnt
from rei_mdsdb.incident_final a
JOIN rei_mdwdb.d_incident b
on a.sourceinstance=b.source_id
and a.sys_id = b.row_id
join
rei_mdsdb.sys_user_final c
on a.opened_by=c.sys_id  and a.sourceinstance= c.sourceinstance
where case when c.manager= '0e039e450a0a3c1f00ab757f305c61bf' then 'Y' else 'N' end<>b.service_desk_flag_c)a;