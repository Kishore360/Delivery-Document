SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_mobile_application_summary.LOCATION_KEY' ELSE 'SUCCESS' END as Message 
FROM #MDS_TABLE_SCHEMA.mobile_session_records_final SRC1
left join #MDS_TABLE_SCHEMA.mobile_session_records_raw_final SRC
on SRC.sessionguid=SRC1.sessionguid
LEFT JOIN #DWH_TABLE_SCHEMA.f_mobile_application_summary TRGT
ON  SRC1.__numerify__primary_key=TRGT.row_id  AND SRC.sourceinstance=TRGT.source_id 
left join #DWH_TABLE_SCHEMA.d_location app
ON CONCAT(COALESCE(SRC.geocity,''), ', ',COALESCE(SRC.georegion,'') , ', ',COALESCE(SRC.geocountry,''))=app.row_id  
AND SRC.sourceinstance=app.source_id 
where coalesce(app.row_key, case when CONCAT(COALESCE(SRC.geocity,''),
 ', ',COALESCE(SRC.georegion,'') , ', ',COALESCE(SRC.geocountry,'')) is null then 0 else -1 end)
<>coalesce(TRGT.location_key,'')




 
 
 
 


 
 
 
 