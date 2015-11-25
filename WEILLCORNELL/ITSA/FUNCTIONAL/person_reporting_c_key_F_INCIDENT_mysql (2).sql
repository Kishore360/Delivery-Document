SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result  ,
CASE WHEN cnt > 0 THEN 'Data did not Match.'  ELSE 'Data Matched' END AS Message  
FROM 
(  select count(1) as cnt from weillcornell_mdsdb.incident_final a  
inner join weillcornell_mdwdb.f_incident  b on a.sys_id=b.row_id and a.sourceinstance=b.source_id and b.row_key <100  
and a.sys_id not in (select B.sys_id from weillcornell_mdsdb.incident_final B
					join weillcornell_mdsdb.sys_user_final C
					on C.sys_id = B.caller_id
					join weillcornell_mdsdb.cmdb_ci_final D
					on D.sys_id = B.u_business_service
					where UPPER(C.user_name) = 'GUEST'
					and UPPER(D.name) = 'ONLINE DIRECTORY')
left outer join weillcornell_mdwdb.d_internal_contact c 
on COALESCE(CONCAT('INTERNAL_CONTACT~',a.u_person_reporting),0)=COALESCE(c.row_id,0) 
where a.u_person_reporting is not null  and case when  a.u_person_reporting is null then '0'  else case when c.row_key is null then '-1' else c.row_key end end <>b.person_reporting_c_key ) c;