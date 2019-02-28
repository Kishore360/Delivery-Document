SELECT CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN CNT > 0  THEN 'MDS to DWH data validation failed for d_location.site_short_name_c' ELSE 'SUCCESS' END as Message 
FROM 
(select count(1) as CNT from mcdonalds_mdsdb.u_cmdb_location_final src
 left join mcdonalds_mdwdb.d_location  trgt
on src.sys_id = trgt.row_id and src.sourceinstance = trgt.source_id
where coalesce(src.u_site_short_name,'UNSPECIFIED') <> trgt.site_short_name_c
)temp
;




