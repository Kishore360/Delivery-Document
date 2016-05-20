SELECT CASE WHEN count(1) <> 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) <>0 THEN 'MDS to DWH data validation failed for d_internal_organization.changed_on' 
 ELSE 'SUCCESS' END as Message
  FROM  app_test.ds_internal_organization_final  SRC 
 LEFT JOIN wow_mdwdb.d_internal_organization TRGT 
 ON ((SRC.row_id ) =(TRGT.row_id ) 
 AND (SRC.source_id )= (TRGT.source_id ) )
JOIN  app_test.lsm_ls_source_timezone L 
ON ((SRC.source_id )  = (L.sourceid ))
 WHERE (_tz(SRC.created_on,source_time_zone,target_time_zone) )<> 
 TRGT.created_on )
 and (_tz(SRC.changed_on,source_time_zone,target_time_zone) )<> 
 TRGT.changed_on );