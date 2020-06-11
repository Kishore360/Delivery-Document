
SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_location.created_on' ELSE 'SUCCESS' END as Message
  FROM ( SELECT * FROM #MDS_TABLE_SCHEMA.hlx_sit_site_final WHERE CDCTYPE<>'D') SRC 
LEFT JOIN #DWH_TABLE_SCHEMA.d_location TRGT 
	ON (SRC.site_id =TRGT.row_id 
	AND SRC.sourceinstance =TRGT.source_id )
WHERE  COALESCE(SRC.phone_number_site_fax,'UNSPECIFIED') <> COALESCE(TRGT.fax_phone_number,'UNSPECIFIED') 
