SELECT 
CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as RESULT,
CASE WHEN cnt > 0 THEN 'MDS to DWH data validation failed for d_configuration_item.gbl_department_name_c' ELSE 'SUCCESS' END as MESSAGE
FROM 
(
SELECT count(1) as cnt
from 
mcd_mdsdb.u_gbl_final a
JOIN mcd_mdwdb.d_gbl_c b on b.row_id=a.sys_id and b.source_id=a.sourceinstance
 where a.u_department<>b.u_department )a
 
 
 