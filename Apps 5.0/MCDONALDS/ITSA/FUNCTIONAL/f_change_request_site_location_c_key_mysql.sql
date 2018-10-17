SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_location.site_c_key' ELSE 'SUCCESS' END as Message
 FROM mcdonalds_mdsdb.change_request_final SRC 
 join mcdonalds_mdwdb.d_configuration_item trgt on SRC.sys_id=trgt.row_id and SRC.sourceinstance=trgt.source_id
 LEFT JOIN mcdonalds_mdsdb.cmdb_ci_final LKP 
 ON ( SRC.cmdb_ci= LKP.u_site_location 
AND SRC.sourceinstance= LKP.source_id )
 WHERE COALESCE(LKP.row_key,CASE WHEN LKP.name IS NULL THEN 0 else -1 end)<> (trgt.cmdb_location_c_key)
 
 
 select SRC.cmdb_ci, LKP.sys_id , LKP.u_site_location,LKP1.name, LKP1.u_site_short_name,
LKP1.u_site_code,LKP1.u_site_long_name,LKP1.u_site_3_letter_code,LKP1.location,LKP1.u_location_type,LKP1.u_region
 FROM mcdonalds_mdsdb.change_request_final SRC 
 LEFT JOIN mcdonalds_mdsdb.cmdb_ci_final LKP 
 ON ( SRC.cmdb_ci= LKP.sys_id 
AND SRC.sourceinstance= LKP.sourceinstance ) 
left join  mcdonalds_mdsdb.u_cmdb_location_final LKP1 on LKP.u_site_location=LKP1.sys_id
where LKP.u_site_location is not null