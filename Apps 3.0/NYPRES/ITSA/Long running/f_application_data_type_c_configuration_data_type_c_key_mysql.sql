SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_outage_c.closure_subcategory_src_c_key' ELSE 'SUCCESS' END as Message
from nypres_mdsdb.cmdb_ci_appl_final inc
CROSS JOIN
  (SELECT a.N + b.N * 10 + 1 AS n
   FROM
     (SELECT 0 AS N UNION ALL SELECT 1 UNION ALL SELECT 2 UNION ALL SELECT 3 UNION ALL SELECT 4 UNION ALL SELECT 5 UNION ALL SELECT 6 UNION ALL SELECT 7 UNION ALL SELECT 8 UNION ALL SELECT 9) a,
      (SELECT 0 AS N UNION ALL SELECT 1 UNION ALL SELECT 2 UNION ALL SELECT 3 UNION ALL SELECT 4 UNION ALL SELECT 5 UNION ALL SELECT 6 UNION ALL SELECT 7 UNION ALL SELECT 8 UNION ALL SELECT 9) b
   ORDER BY n) n
ON n.n <= 1 + (LENGTH(COALESCE(TRIM(inc.u_data_type),'UNSPECIFIED')) - LENGTH(REPLACE(COALESCE(TRIM(inc.u_data_type),'UNSPECIFIED'), ',', '')))
left join nypres_mdwdb.d_configuration_data_type_c t on  
COALESCE(SUBSTRING_INDEX(SUBSTRING_INDEX(TRIM(inc.u_data_type), ',', n.n), ',', -1),'UNSPECIFIED')=t.row_id and inc.sourceinstance=t.source_id
join nypres_mdwdb.d_configuration_item it
on inc.sys_id=it.row_id and inc.sourceinstance=it.source_id
join  nypres_mdwdb.f_application_data_type_c as c
                on concat(inc.sys_id,'~',COALESCE(SUBSTRING_INDEX(SUBSTRING_INDEX(TRIM(inc.u_data_type), ',', n.n), ',', -1),'UNSPECIFIED')) = c.row_id
where it.row_key <> c.configuration_item_key and c.configuration_data_type_c_key <> t.row_key
-- and u_data_type in ('0daccdcf6f262100005eaf512e3ee45a,8d7c01436f662100005eaf512e3ee4fa')
and c.soft_deleted_flag = 'N'
;


