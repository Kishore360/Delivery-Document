SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for D_LOCATION.ROW_ID' ELSE 'SUCCESS' END as Message
 FROM
(
select cdctype,geocity,geocountry,georegion,sourceinstance from #MDS_TABLE_SCHEMA.web_session_records_raw_final
union
select cdctype,geocity,geocountry,georegion, sourceinstance from  #MDS_TABLE_SCHEMA.mobile_session_records_raw_final 
) SRC

LEFT JOIN #DWH_TABLE_SCHEMA.d_location TRGT 
ON ( CONCAT(COALESCE(SRC.geocity,''), ', ',COALESCE(SRC.georegion,'') , ', ',COALESCE(SRC.geocountry,''))=TRGT.ROW_ID  
 AND SRC.sourceinstance=TRGT.source_id )
WHERE COALESCE(CASE WHEN SRC.cdctype='D' THEN 'Y' ELSE 'N' END,'') <> COALESCE(TRGT.SOFT_DELETED_FLAG,'') 