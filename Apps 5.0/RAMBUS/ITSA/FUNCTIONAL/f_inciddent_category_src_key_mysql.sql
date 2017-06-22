SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
from(select count(*) as cnt
FROM rambus_mdwdb.f_incident a
INNER JOIN rambus_mdsdb.incident_final b ON a.row_id =b.sys_id AND a.source_id=b.sourceinstance
LEFT OUTER JOIN rambus_mdwdb.d_lov c ON c.row_id= COALESCE(CONCAT('CATEGORY','~','INCIDENT','~','~','~',UPPER(b.u_application)),'UNSPECIFIED')  AND c.source_id =  b.sourceinstance AND DATE_FORMAT(a.pivot_date, '%Y-%m-%d %H:%i:%s')
where a.category_src_key<>c.row_key and a.incident_class_c = 'INCIDENT') a ;
