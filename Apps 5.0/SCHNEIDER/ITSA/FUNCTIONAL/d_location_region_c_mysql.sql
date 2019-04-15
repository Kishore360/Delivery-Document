SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for d_location.region_c' ELSE 'SUCCESS' END as Message 
-- select SRC.site_id,TRGT.row_id ,coalesce(SRC.region,'UNSPECIFIED'),(TRGT.region_c) 
-- select count(1)  
FROM schneider_mdsdb.hpd_help_desk_final  SRC 
JOIN schneider_mdwdb.d_location TRGT 
ON (SRC.site_id = TRGT.row_id  AND SRC.sourceinstance = TRGT.source_id )
 WHERE coalesce(SRC.region,'UNSPECIFIED')  = (TRGT.region_c) 
 and TRGT.soft_deleted_flag='N';
