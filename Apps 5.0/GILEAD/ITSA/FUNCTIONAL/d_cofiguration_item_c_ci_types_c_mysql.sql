
SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN cnt >0 THEN 'MDS to DWH data validation failed for f_incident.impact_src_code' 
ELSE 'MDS to DWH data validation passed for f_incident.impact_src_code' END as Message from 
(select count(1) cnt 
FROM gilead_mdsdb.cmdb_ci_final SRC 
JOIN gilead_mdwdb.d_configuration_item TRGT 
ON SRC.sys_id = TRGT.row_id 
and  SRC.sourceinstance = TRGT.source_id  
LEFT JOIN 
(select   substring_index(
    substring_index(u_class_names, ',', n), 
    ',', 
    -1
  ) as class_name , u_ci_type
from gilead_mdsdb.u_cmdb_ci_types_final
join (SELECT a.N + b.N * 10 +1 AS n
   FROM
     (SELECT 0 AS N UNION ALL SELECT 1 UNION ALL SELECT 2 UNION ALL SELECT 3 UNION ALL SELECT 4 UNION ALL SELECT 5 UNION ALL SELECT 6 UNION ALL SELECT 7 UNION ALL SELECT 8 UNION ALL SELECT 9) a,
     (SELECT 0 AS N UNION ALL SELECT 1 UNION ALL SELECT 2 UNION ALL SELECT 3 UNION ALL SELECT 4 UNION ALL SELECT 5 UNION ALL SELECT 6 UNION ALL SELECT 7 UNION ALL SELECT 8 UNION ALL SELECT 9) b
	
   ORDER BY n) cmdb_ci_types
  on char_length(u_class_names) 
    - char_length(replace(u_class_names, ',', '')) 
    >= n - 1) LKP
ON SRC.sys_class_name = LKP.class_name
WHERE CASE WHEN SRC.sys_class_name is NULL THEN 'UNSPECIFIED' WHEN SRC.sys_class_name is NOT NULL THEN COALESCE(LKP.u_ci_type,'UNKNOWN') END  <> TRGT.ci_types_c)b
