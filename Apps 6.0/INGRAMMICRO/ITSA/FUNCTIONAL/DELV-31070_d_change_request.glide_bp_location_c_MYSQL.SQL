SELECT CASE WHEN count(1) = 0 THEN 'SUCCESS' ELSE 'Fail' END as result from ingrammicro_mdsdb.change_request_final src
JOIN ingrammicro_mdwdb.d_change_request trgt
ON src.sys_id = trgt.row_id and src.sourceinstance = trgt.source_id
LEFT JOIN
( SELECT tmp.sys_id,tmp.sourceinstance,  GROUP_CONCAT(distinct CASE WHEN    lkp.sys_id is NULL THEN tmp.bp_location ELSE lkp.u_location   END   ORDER BY 1 SEPARATOR ', ' ) as u_bp_locations FROM (select   substring_index(
    substring_index(u_bp_location, ',', n), 
    ',', 
    -1
  ) as bp_location , sys_id,sourceinstance
from ingrammicro_mdsdb.change_request_final
join (SELECT a.N + b.N * 10 + 1 as n
   FROM
     (SELECT 0 AS N UNION ALL SELECT 1 UNION ALL SELECT 2 UNION ALL SELECT 3 UNION ALL SELECT 4 UNION ALL SELECT 5 UNION ALL SELECT 6 UNION ALL SELECT 7 UNION ALL SELECT 8 UNION ALL SELECT 9) a,
     (SELECT 0 AS N UNION ALL SELECT 1 UNION ALL SELECT 2 UNION ALL SELECT 3 UNION ALL SELECT 4 UNION ALL SELECT 5 UNION ALL SELECT 6 UNION ALL SELECT 7 UNION ALL SELECT 8 UNION ALL SELECT 9) b 
	 
	
   ORDER BY n)n
  on char_length(u_bp_location) 
    - char_length(replace(u_bp_location, ',', '')) 
    >= n - 1) tmp
		LEFT JOIN ingrammicro_mdsdb.u_bp_location_final lkp 
	ON tmp.bp_location = lkp.sys_id and tmp.sourceinstance = lkp.sourceinstance
	GROUP BY 1,2
	) LKP 
ON LKP.sys_id = trgt.row_id and LKP.sourceinstance = trgt.source_id 
WHERE glide_bp_location_c <> COALESCE(u_bp_locations,'UNSPECIFIED')

