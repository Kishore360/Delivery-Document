

SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,
CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 

from(select count(1) as cnt
 
from rambus_mdwdb.f_change_request a 

left outer join rambus_mdsdb.change_request_final b 

on a.row_id =b.sys_id 

and a.source_id=b.sourceinstance

where a.sub_category_src_c_key<>COALESCE(CONCAT('SUBCATEGORY','~','INCIDENT','~','~','~',UPPER(b.u_technical_service)),'UNSPECIFIED')) z;