select 
case 
when sum(failures_cnt) > 0 and length(group_concat(distinct failures)) >= 1024 then concat('Failed. Data does not match for ',sum(failures_cnt),' records. Few sys ids are : ',substring_index(group_concat(distinct failures),',',-31))

when sum(failures_cnt) > 0 and length(group_concat(distinct failures)) < 1024
then concat('Failed. Data does not match for ',sum(failures_cnt),' records. Sys Ids : ',substring_index(group_concat(distinct failures),',',-sum(failures_cnt)))

when sum(warnings_cnt) > 0 and length(group_concat(distinct warnings)) >= 1024 then concat('Warning. Look up does not exists for ',sum(warnings_cnt),' records. Few (sys_id || incident) - ',substring_index(group_concat(distinct warnings),',',-sum(warnings_cnt)))

when sum(warnings_cnt) > 0 and length(group_concat(distinct warnings)) < 1024 then concat('Warning. Look up does not exists for ',sum(warnings_cnt),' records. (sys_id || incident) : ',substring_index(group_concat(distinct warnings),',',-sum(warnings_cnt)))

else 'Success. All warehouse records are matching with source.' end Result

from 
(select

case when src.incident is not null and lkp.row_id is null then concat(src.row_id,' || ',src.incident) else '' end as warnings,

case when src.incident is not null and lkp.row_id is null then 1 else 0 end as warnings_cnt,

case when COALESCE(lkp.row_key,case when src.incident is null then 0 else -1 end) <> COALESCE(trgt.incident_key,0) then src.row_id else '' end as failures,

case when COALESCE(lkp.row_key,case when src.incident is null then 0 else -1 end) <> COALESCE(trgt.incident_key,0) then 1 else 0 end as failures_cnt

from 
( SELECT CONCAT(inc.sys_id,'~',COALESCE(SUBSTRING_INDEX(SUBSTRING_INDEX(TRIM(inc.u_affected_business_unit), ',', n.n), ',', -1),'UNSPECIFIED')) AS row_id, inc.sourceinstance AS source_id,	inc.sys_id as incident
	FROM molinahealth_mdsdb.incident_final inc
	CROSS JOIN
	  (SELECT a.N + b.N * 10 + 1 AS n
		FROM
	  (SELECT 0 AS N UNION ALL SELECT 1 UNION ALL SELECT 2 UNION ALL SELECT 3 UNION ALL SELECT 4 UNION ALL SELECT 5 UNION ALL SELECT 6 UNION ALL SELECT 7 UNION ALL SELECT 8 UNION ALL SELECT 9) a,
	  (SELECT 0 AS N UNION ALL SELECT 1 UNION ALL SELECT 2 UNION ALL SELECT 3 UNION ALL SELECT 4 UNION ALL SELECT 5 UNION ALL SELECT 6 UNION ALL SELECT 7 UNION ALL SELECT 8 UNION ALL SELECT 9) b
		ORDER BY n) n
	 ON n.n <= 1 + (LENGTH(COALESCE(TRIM(inc.u_affected_business_unit),'UNSPECIFIED')) - LENGTH(REPLACE(COALESCE(TRIM(inc.u_affected_business_unit),'UNSPECIFIED'), ',', ''))) ) src
left join molinahealth_mdwdb.f_incident_affected_business_unit_c trgt on src.row_id = trgt.row_id and src.source_id = trgt.source_id
left join molinahealth_mdwdb.d_incident lkp on src.incident = lkp.row_id and src.source_id = lkp.source_id) fnl ;