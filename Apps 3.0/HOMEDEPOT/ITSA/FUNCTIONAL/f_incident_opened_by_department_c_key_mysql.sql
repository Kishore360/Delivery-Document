SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (
select count(1) as cnt  
from homedepot_mdsdb.incident_final a
 left  JOIN   homedepot_mdwdb.f_incident b
on  b.ROW_ID=a.SYS_ID and a.sourceinstance=b.source_id
LEFT JOIN homedepot_mdwdb.d_internal_contact LKP
on LKP.row_id =CONCAT('INTERNAL_CONTACT~',a.opened_by) and a.sourceinstance = LKP.source_id
LEFT JOIN homedepot_mdwdb.d_internal_organization dio
on dio.row_id = CONCAT('DEPARTMENT~',LKP.department_code) and LKP.source_id = dio.source_id
WHERE COALESCE(dio.row_key,CASE WHEN LKP.department_code IS NULL THEN 0 else -1 end)<> (b.opened_by_department_c_key))a ;