 SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for D_LOCATION.LOCATION_NAME' ELSE 'SUCCESS' END as Message
 FROM
 ((select SRC.cdctype,SRC.geocity,SRC.geocountry,SRC.georegion,SRC.sourceinstance from #MDS_TABLE_SCHEMA.web_session_records_raw_final SRC )
union
  (select SRC.cdctype,SRC.geocity,SRC.geocountry,SRC.georegion, SRC.sourceinstance from #MDS_TABLE_SCHEMA.mobile_session_records_raw_final SRC)
) SRC

  LEFT JOIN #DWH_TABLE_SCHEMA.d_location TRGT 
  
 
ON (CONCAT(COALESCE(SRC.geocity,'UNSPECIFIED'),', ',COALESCE(SRC.georegion,'UNSPECIFIED') , ', ',COALESCE(SRC.geocountry,'UNSPECIFIED'))=TRGT.row_id ) 
AND SRC.sourceinstance=TRGT.source_id
WHERE COALESCE(CONCAT(COALESCE(SRC.geocity,'UNSPECIFIED'), ', ',COALESCE(SRC.georegion,'UNSPECIFIED'), ', ',COALESCE(SRC.geocountry,'UNSPECIFIED')),'') <> COALESCE(TRGT.LOCATION_NAME,'') 


 