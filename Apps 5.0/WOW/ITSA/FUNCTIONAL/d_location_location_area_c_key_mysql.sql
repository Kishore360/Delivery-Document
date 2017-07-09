SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for d_location.location_area_c_key' ELSE 'SUCCESS' END as Message 
FROM wow_mdwdb.d_location trgt
RIGHT JOIN wow_mdsdb.cmn_location_final src
on src.sys_id = trgt.row_id and src.sourceinstance = trgt.source_id
LEFT JOIN wow_mdwdb.d_lov lkp
ON COALESCE(CONCAT('AREA_C~LOCATION~~~',src.u_area),'UNSPECIFIED') =lkp.row_id and src.sourceinstance = lkp.source_id
where COALESCE(lkp.row_key,CASE WHEN src.u_area IS NULL THEN 0 else -1 end)<> trgt.location_area_c_key
;