SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_resource_availability.created_on' ELSE 'SUCCESS' END as Message
FROM (select * from  #MDS_TABLE_SCHEMA.prj_blb_slices_final  where cdctype<>'D') SRC 
INNER JOIN (select * from #MDS_TABLE_SCHEMA.prj_blb_slicerequests_final where cdctype<>'D' and request_name='DAILYRESOURCEAVAILCURVE')SRC1
on  SRC.slice_request_id=SRC1.ID
and SRC.sourceinstance=SRC1.sourceinstance
LEFT JOIN (select * from #DWH_TABLE_SCHEMA.f_resource_availability)TRGT   
	ON concat(SRC.prj_object_id,'~',date_format(slice_date,'%Y%m%d')) =TRGT.row_id 
	and SRC.sourceinstance=TRGT.source_id
WHERE COALESCE(convert_tz(SRC.created_date,'<<TENANT_SSI_TIME_ZONE>>','<<DW_TARGET_TIME_ZONE>>'),'')<> COALESCE(TRGT.created_on,'')