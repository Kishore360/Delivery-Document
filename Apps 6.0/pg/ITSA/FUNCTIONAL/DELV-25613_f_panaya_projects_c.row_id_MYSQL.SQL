
SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT > 0 THEN 'MDS to DWH data validation failed for f_panaya_projects_c.row_id' ELSE 'SUCCESS' END as Message
FROM 
(
Select Count(1) as CNT 
From png_mdsdb.u_pg_panaya_projects_final SRC 
LEFT JOIN 
(
SELECT    
substring_index(substring_index(u_change_task_id, ',', n), ',', -1) as change_task_id,sys_id
from png_mdsdb.u_pg_panaya_projects_final a 
JOIN  
(
SELECT a.N + b.N * 10 + 1 as n
FROM
(SELECT 0 AS N UNION ALL SELECT 1 UNION ALL SELECT 2 UNION ALL SELECT 3 UNION ALL SELECT 4 UNION ALL SELECT 5 UNION ALL SELECT 6 UNION ALL SELECT 7 UNION ALL SELECT 8 UNION ALL SELECT 9) a,
(SELECT 0 AS N UNION ALL SELECT 1 UNION ALL SELECT 2 UNION ALL SELECT 3 UNION ALL SELECT 4 UNION ALL SELECT 5 UNION ALL SELECT 6 UNION ALL SELECT 7 UNION ALL SELECT 8 UNION ALL SELECT 9) b ORDER BY n
) number  
on char_length(u_change_task_id) - char_length(replace(u_change_task_id, ',', '')) >= n - 1
) SRC1 ON SRC.sys_id=SRC1.sys_id
LEFT JOIN png_mdwdb.f_panaya_projects_c TRGT ON 
CONCAT(SRC.sys_id,COALESCE(SRC1.change_task_id,'UNSPECIFIED'),'~',COALESCE(SRC1.sys_id,'UNSPECIFIED'))=TRGT.row_id
AND SRC.sourceinstance=TRGT.source_id
WHERE CONCAT(SRC.sys_id,COALESCE(SRC1.change_task_id,'UNSPECIFIED'),'~',COALESCE(SRC1.sys_id,'UNSPECIFIED'))<>TRGT.row_id
AND SRC.cdctype='X'

) temp;


