SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed' ELSE 'SUCCESS' END as Message
 FROM cardinalhealth_mdwdb.d_internal_contact SRC 
 LEFT JOIN cardinalhealth_mdwdb.f_incident TRGT 
 ON (SRC.row_key =TRGT.opened_by_key ) 
 AND SRC.source_id= TRGT.source_id  )
 WHERE  COALESCE(SRC.location_key,0) <> TRGT.location_of_opened_by_c_key