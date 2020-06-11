SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_resource_allocation.allocation_start_on' ELSE 'SUCCESS' END as Message
FROM (select * from #MDS_TABLE_SCHEMA.prteam_final  where cdctype<>'D') SRC   
INNER JOIN
(select * from #MDS_TABLE_SCHEMA.inv_investments_final where odf_object_code in ('project','idea') AND cdctype<>'D' and id not in 
(select PRID from #MDS_TABLE_SCHEMA.inv_projects_final WHERE IS_PROGRAM=1 OR IS_TEMPLATE=1))SRC3
on SRC.PRPROJECTID=SRC3.ID
left join(select * from #MDS_TABLE_SCHEMA.srm_resources_final where cdctype<>'D')SRC5
on SRC.prresourceid=SRC5.id
left JOIN (select * from #MDS_TABLE_SCHEMA.prj_blb_slices_final where cdctype<>'D')SRC1
on SRC.prid=SRC1.prj_object_id
and SRC.sourceinstance=SRC1.sourceinstance
inner JOIN(select * from #MDS_TABLE_SCHEMA.prj_blb_slicerequests_final where 
 request_name='DAILYRESOURCEALLOCCURVE' and cdctype<>'D')SRC2 
on SRC1.slice_request_id=SRC2.ID
and SRC1.sourceinstance=SRC2.sourceinstance
LEFT JOIN (select * from  #DWH_TABLE_SCHEMA.f_resource_allocation)TRGT   
ON CONCAT('ALLOCATION','~',SRC.prid,date_format(SRC1.slice_date,'%Y%m%d')) =TRGT.row_id 
and SRC.sourceinstance=TRGT.source_id
WHERE COALESCE(convert_tz(SRC.pravailstart,'<<TENANT_SSI_TIME_ZONE>>','<<DW_TARGET_TIME_ZONE>>'),convert_tz(SRC3.schedule_start,'<<TENANT_SSI_TIME_ZONE>>','<<DW_TARGET_TIME_ZONE>>'))<> COALESCE(TRGT.allocation_start_on,'')





