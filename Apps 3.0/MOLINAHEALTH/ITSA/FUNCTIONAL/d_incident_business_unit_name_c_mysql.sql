select 
case 
when sum(failures_cnt) > 0 and length(group_concat(distinct failures)) >= 1024 then concat('Failed. Data does not match for ',sum(failures_cnt),' records. Few sys ids are : ',substring_index(group_concat(distinct failures),',',-31))

when sum(failures_cnt) > 0 and length(group_concat(distinct failures)) < 1024
then concat('Failed. Data does not match for ',sum(failures_cnt),' records. Sys Ids : ',substring_index(group_concat(distinct failures),',',-sum(failures_cnt)))

else 'Success. All warehouse records are matching with source.' end Result

from 
(select

case when COALESCE(src.business_unit_name_c,'UNSPECIFIED') <> COALESCE(trgt.business_unit_name_c,'UNSPECIFIED') then src.row_id else '' end as failures,

case when COALESCE(src.business_unit_name_c,'UNSPECIFIED') <> COALESCE(trgt.business_unit_name_c,'UNSPECIFIED') then 1 else 0 end as failures_cnt

from 
( SELECT crd.sys_id AS row_id, crd.sourceinstance AS source_id,	group_concat(business_unit.name) AS business_unit_name_c
	FROM molinahealth_mdsdb.incident_final crd
	CROSS JOIN
	  (SELECT a.N + b.N * 10 + 1 AS n
		FROM
	  (SELECT 0 AS N UNION ALL SELECT 1 UNION ALL SELECT 2 UNION ALL SELECT 3 UNION ALL SELECT 4 UNION ALL SELECT 5 UNION ALL SELECT 6 UNION ALL SELECT 7 UNION ALL SELECT 8 UNION ALL SELECT 9) a,
	  (SELECT 0 AS N UNION ALL SELECT 1 UNION ALL SELECT 2 UNION ALL SELECT 3 UNION ALL SELECT 4 UNION ALL SELECT 5 UNION ALL SELECT 6 UNION ALL SELECT 7 UNION ALL SELECT 8 UNION ALL SELECT 9) b
		ORDER BY n) n
	 ON n.n <= 1 + (length(trim(crd.u_affected_business_unit)) - length(replace(trim(crd.u_affected_business_unit), ',', '')))
	 LEFT JOIN molinahealth_mdsdb.u_business_unit_final business_unit 
	  ON substring_index(substring_index(trim(crd.u_affected_business_unit), ',', n.n), ',', -1) = business_unit.sys_id
   GROUP BY 1,2) src
left join molinahealth_mdwdb.d_incident trgt on src.row_id = trgt.row_id and src.source_id = trgt.source_id  ) fnl ;