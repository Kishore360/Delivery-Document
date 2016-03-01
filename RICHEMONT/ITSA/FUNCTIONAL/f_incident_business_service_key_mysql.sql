
SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (
select count(1) as cnt 
from richemont_mdsdb.incident_final a
left join richemontdev_mdwdb.d_service c 
on coalesce(concat('BUSINESS_SERVICE~',a.u_business_service),'UNSPECIFIED')=c.row_id
and  a.sourceinstance=c.source_id
left join richemontdev_mdwdb.f_incident b on a.sourceinstance=b.source_id and a.sys_id=b.row_id
WHERE c.row_key<>b.business_service_key  
)i; 

