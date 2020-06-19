SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM(
select count(*) as cnt 
from gilead_mdwdb.d_incident a join 
 gilead_mdsdb.incident_final b on a.row_id=b.sys_id and a.source_id=b.sourceinstance
 left join(
select documentkey, case when oldvalue is null and count(1)=2 then 'N'
when count(1)=1 then 'N'
else 'Y' end as circularcount from gilead_mdsdb.sys_audit_final where tablename='incident' 
and fieldname='assignment_group'  group by 1) c on b.sys_id=c.documentkey
where a.circular_assignment_c_flag <> coalesce(c.circularcount,'N')) c;
