SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for f_task_c.urgency' ELSE 'SUCCESS' END as Message 
FROM (SELECT CONCAT(cr.sys_id,'~',COALESCE(SUBSTRING_INDEX(SUBSTRING_INDEX(TRIM(cr.number), ',', n.n), ',', -1),'UNSPECIFIED')) AS row_id,
       cr.sourceinstance AS source_id,
      cr.number AS change_request_number
FROM mercury_mdsdb.change_request_final cr
CROSS JOIN
  (SELECT a.N + b.N * 10 + c.N * 100 + 1 AS n
   FROM
     (SELECT 0 AS N UNION ALL SELECT 1 UNION ALL SELECT 2 UNION ALL SELECT 3 UNION ALL SELECT 4 UNION ALL SELECT 5 UNION ALL SELECT 6 UNION ALL SELECT 7 UNION ALL SELECT 8 UNION ALL SELECT 9) a,
     (SELECT 0 AS N UNION ALL SELECT 1 UNION ALL SELECT 2 UNION ALL SELECT 3 UNION ALL SELECT 4 UNION ALL SELECT 5 UNION ALL SELECT 6 UNION ALL SELECT 7 UNION ALL SELECT 8 UNION ALL SELECT 9) b,	  
	 (SELECT 0 AS N UNION ALL SELECT 1 UNION ALL SELECT 2 UNION ALL SELECT 3 UNION ALL SELECT 4 UNION ALL SELECT 5 UNION ALL SELECT 6 UNION ALL SELECT 7 UNION ALL SELECT 8 UNION ALL SELECT 9) c
   ORDER BY n) n
ON cr.cdctype<>'D' and n.n <= 1 + (LENGTH(COALESCE(TRIM(cr.number),'UNSPECIFIED')) 
- LENGTH(REPLACE(COALESCE(TRIM(cr.number),'UNSPECIFIED'), ',', ''))) where cr.cdctype='X') SRC 
JOIN mercury_mdwdb.f_cmdb_ci_name_c TRGT 
ON SRC.row_id=TRGT.row_id and SRC.source_id=TRGT.source_id
WHERE SRC.change_request_number<>TRGT.change_request_number;
SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match' 
ELSE 'Data Matched' END AS Message  from 	

(select count(1) cnt  from mercury_mdwdb.f_cmdb_ci_name_c t right join (
select sys_id,coalesce(substring_index( substring_index(u_ci_name,',',x),',','-1'),'UNSPECIFIED') as name_id
, length(u_ci_name)-length(replace(u_ci_name,',',''))+1 as count ,u_ci_name
from mercury_mdsdb.change_request_final a 
join (select (t*10+u+1) x from
(select 0 t union select 1 union select 2 union select 3 union select 4 union
select 5 union select 6 union select 7 union select 8 union select 9) A,
(select 0 u union select 1 union select 2 union select 3 union select 4 union
select 5 union select 6 union select 7 union select 8 union select 9) B
order by x)  n
  on   length(u_ci_name)-length(replace(u_ci_name,',',''))+1 > x-1 and a.cdctype='X') a on t.row_id =concat(a.sys_id,'~',a.name_id)
left join mercury_mdwdb.d_configuration_item b on a.name_id=b.row_id and b.soft_deleted_flag='N' 

WHERE COALESCE(b.row_key,CASE WHEN a.u_ci_name IS NULL THEN 0 else -1 end)<>(t.change_ci_name_c_key))x