SELECT CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN CNT > 0  THEN 'MDS to DWH data validation failed for d_location.parent_location_c_key' ELSE 'SUCCESS' END as Message 
FROM 
(select count(1) as CNT from mcd_mdsdb.u_cmdb_location_final src
 left join mcd_mdwdb.d_location  trgt
on src.sys_id = trgt.row_id and src.sourceinstance = trgt.source_id
where coalesce(src.location,'UNSPECIFIED') <> trgt.parent_location_c_key
)temp
;



