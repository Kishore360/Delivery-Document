 SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (  select count(*) as cnt from weillcornell_mdsdb.incident_final a
inner join weillcornell_mdwdb.f_incident  b on a.sys_id =b.row_id  and b.row_key <100
left outer join weillcornell_mdwdb.d_internal_contact c on concat('INTERNAL_CONTACT~',a.u_person_reporting)=c.row_id where a.u_person_reporting is not null
 and case when  a.u_person_reporting is null then '0' 
 else case when c.row_key is null then '-1' else c.row_key end end <>b.person_reporting_c_key ) c;
 
 
