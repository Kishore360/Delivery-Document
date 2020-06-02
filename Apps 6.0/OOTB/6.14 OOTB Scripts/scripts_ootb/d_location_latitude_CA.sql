SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_location.geo_key' ELSE 'SUCCESS' END as Message
FROM  
(select * from #MDS_TABLE_SCHEMA.Locations_final  where cdctype<>'D') SRC 
LEFT JOIN (select * from #DWH_TABLE_SCHEMA.d_location) TRGT
ON SRC.ID =TRGT.row_id  and   SRC.sourceinstance = TRGT.source_id
where  COALESCE(TRGT.latitude,'') <> COALESCE(NULL,'')