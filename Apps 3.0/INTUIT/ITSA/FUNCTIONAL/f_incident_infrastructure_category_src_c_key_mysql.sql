SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (
select count(1) as cnt 
from intuit_mdsdb.incident_final b left join intuit_mdwdb.d_calendar_date d on 
COALESCE(CONCAT('U_INFRASTRUCTURE_CATEGORY','~','INCIDENT','~','~','~',b.u_infrastructure_category),'UNSPECIFIED')=d.row_id
left join intuit_mdwdb.f_incident f on b.sys_id=f.row_id and b.sourceinstance=f.source_id
where d.row_key <>f.infrastructure_category_src_c_key)temp

 