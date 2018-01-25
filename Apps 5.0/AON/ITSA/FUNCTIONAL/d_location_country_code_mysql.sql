 SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_location.country_code' ELSE 'SUCCESS' END as Message
 FROM aon_mdsdb.cmn_location_final SRC
join aon_mdwdb.d_location TRGT
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
where SRC.country<>TRGT.country_code