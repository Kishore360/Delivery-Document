SELECT CASE WHEN count(1) <> 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) <>0 THEN 'MDS to DWH data validation failed for d_internal_organization.changed_on' 
 ELSE 'SUCCESS' END as Message
  FROM  wow_workdb.ds_internal_organization  SRC 
 LEFT JOIN wow_mdwdb.d_internal_organization TRGT 
 ON ((SRC.row_id ) =(TRGT.row_id ) 
 AND (SRC.source_id )= (TRGT.source_id ) )
 WHERE (CONVERT_TZ(SRC.created_on,'GMT','MST') )<>  TRGT.created_on
 and (CONVERT_TZ(SRC.changed_on,'GMT','MST') )<>  TRGT.changed_on; 