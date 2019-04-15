SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,
CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
from(select count(1) as cnt 
from rambus_mdwdb.f_change_request a
INNER JOIN rambus_mdsdb.change_request_final b 
ON a.row_id =b.sys_id AND a.source_id=b.sourceinstance
LEFT OUTER JOIN rambus_mdwdb.d_lov c
ON c.row_id= COALESCE(CONCAT('CATEGORY','~','INCIDENT','~','~','~',UPPER(b.u_application)),'UNSPECIFIED') 
where a.category_src_key <> c.row_key) z 
