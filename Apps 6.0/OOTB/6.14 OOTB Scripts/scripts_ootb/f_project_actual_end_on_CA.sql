SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_project_task.schedule_variance' ELSE 'SUCCESS' END as Message 
  FROM (select * from    #MDS_TABLE_SCHEMA.inv_investments_final  where  cdctype<>'D') SRC 
INNER JOIN(select * from   #MDS_TABLE_SCHEMA.inv_projects_final where IS_PROGRAM=0 and IS_TEMPLATE = 0 and cdctype<>'D')SRC1
on SRC.ID=SRC1.PRID
left join (select min(prj_blb_slices.slice_date),max(prj_blb_slices.slice_date) as actual_end_date,sum(prj_blb_slices.slice) as effort,SRC4.prprojectid,
prtimeentry.prassignmentid,SRC4.prid, SRC3.prtaskid,prj_blb_slices.PRJ_OBJECT_ID, prj_blb_slicerequests.ID,prj_blb_slices.SLICE_REQUEST_ID 
FROM (select * from  #MDS_TABLE_SCHEMA.prtimeentry_final)prtimeentry
left join(select * from  #MDS_TABLE_SCHEMA.prassignment_final)SRC3
on  prtimeentry.prassignmentid=SRC3.prid
LEFT JOIN(select * from  #MDS_TABLE_SCHEMA.prtask_final)SRC4
on SRC3.prtaskid=SRC4.prid
LEFT JOIN(select * from   #MDS_TABLE_SCHEMA.prj_blb_slices_final) prj_blb_slices 
  ON prtimeentry.PRID=prj_blb_slices.PRJ_OBJECT_ID 
  AND SRC3.sourceinstance=prj_blb_slices.sourceinstance 
 INNER JOIN ( select * from   #MDS_TABLE_SCHEMA.prj_blb_slicerequests_final)prj_blb_slicerequests 
  ON prj_blb_slices.SLICE_REQUEST_ID=prj_blb_slicerequests.ID 
  AND prj_blb_slices.sourceinstance=prj_blb_slicerequests.sourceinstance    
  WHERE UPPER(prj_blb_slicerequests.REQUEST_NAME)='DAILYRESOURCETIMECURVE' group by SRC4.prprojectid)SRC10
 on SRC.ID=SRC10.prprojectid
 LEFT JOIN (select * from   #DWH_TABLE_SCHEMA.f_project)TRGT   
ON SRC.id =TRGT.row_id 	and SRC.sourceinstance=TRGT.source_id
LEFT JOIN (select * from   #DWH_TABLE_SCHEMA.d_lov_map)LKP
ON CONCAT('PROJECT~STATE~',SRC.PROGRESS)  = LKP.row_id
and TRGT.source_id=LKP.source_id
where CASE WHEN LKP.dimension_wh_code IN ('CLOSED') then CONVERT_TZ(SRC10.actual_end_date,'<<TENANT_SSI_TIME_ZONE>>','<<DW_TARGET_TIME_ZONE>>') else null end <>
COALESCE(TRGT.actual_end_on,'')