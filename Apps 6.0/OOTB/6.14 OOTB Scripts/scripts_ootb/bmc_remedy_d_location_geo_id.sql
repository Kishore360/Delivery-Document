
SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_location.geo_id' ELSE 'SUCCESS' END as Message
 

FROM ( SELECT * FROM #MDS_TABLE_SCHEMA.hlx_sit_site_final WHERE CDCTYPE<>'D') SRC 
LEFT JOIN #DWH_TABLE_SCHEMA.d_location TRGT 
ON SRC.site_id =TRGT.row_id AND SRC.sourceinstance =TRGT.source_id 
WHERE COALESCE(0, 'UNSPECIFIED')  <> COALESCE(TRGT.geo_key,'')
