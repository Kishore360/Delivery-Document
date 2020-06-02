SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_project_task.actual_start_on' ELSE 'SUCCESS' END as Message 
FROM  (select * from  #MDS_TABLE_SCHEMA.prtask_final SRC  where cdctype<>'D') SRC 
inner join(select * from  #MDS_TABLE_SCHEMA.inv_investments_final where odf_object_code='project' and cdctype<>'D') SRC1 
on SRC.prprojectid=SRC1.id
INNER join(select * from  #MDS_TABLE_SCHEMA.inv_projects_final WHERE is_program=0 and is_template=0)SRC10
 ON  SRC1.id=SRC10.prid
inner join (select * from  #MDS_TABLE_SCHEMA.prj_ev_history_final   where object_type='TASK') SRC11
on  SRC.prid = SRC11.object_id and SRC.sourceinstance = SRC11.sourceinstance
   left join ( SELECT
            prassignment.PRTASKID AS row_id,
            MIN(prj_blb_slices.SLICE_DATE) AS ACTUAL_START_ON,
            prtimeentry.sourceinstance AS source_id,
            MAX(prj_blb_slices.SLICE_DATE) AS ACTUAL_END_ON    
        FROM
             #MDS_TABLE_SCHEMA.prtimeentry_final prtimeentry      
        INNER JOIN
             #MDS_TABLE_SCHEMA.prassignment_final prassignment 
                ON prtimeentry.PRASSIGNMENTID = prassignment.PRID 
                and prtimeentry.sourceinstance=prassignment.sourceinstance 
        LEFT OUTER JOIN
             #MDS_TABLE_SCHEMA.prj_blb_slices_final prj_blb_slices 
                ON prtimeentry.PRID = prj_blb_slices.PRJ_OBJECT_ID 
                and prtimeentry.sourceinstance=prj_blb_slices.sourceinstance 
        LEFT OUTER JOIN
             #MDS_TABLE_SCHEMA.prj_blb_slicerequests_final prj_blb_slicerequests 
                ON prj_blb_slices.SLICE_REQUEST_ID=prj_blb_slicerequests.ID 
                AND prj_blb_slices.sourceinstance=prj_blb_slicerequests.sourceinstance    
        WHERE
            UPPER(prj_blb_slicerequests.REQUEST_NAME)='DAILYRESOURCETIMECURVE' 
            AND prtimeentry.cdctype<>'D'    
        GROUP BY
            1,
            3) SRC2
   on SRC2.row_id = SRC.prid and SRC2.source_id = SRC. sourceinstance
    LEFT JOIN  #DWH_TABLE_SCHEMA.f_project_task TRGT 
   on SRC.PRID = TRGT.row_id and SRC.sourceinstance = TRGT.source_id
            left join  #DWH_TABLE_SCHEMA.d_lov_map LKP
   on 
  LKP.row_id=concat('PROJECT_TASK~STATE~',SRC.PRSTATUS) and 
   LKP.source_id=TRGT.source_id
  where case when  LKP.dimension_wh_code = 'CLOSED' then 
  COALESCE(convert_tz(SRC2.ACTUAL_START_ON,'<<TENANT_SSI_TIME_ZONE>>','<<DW_TARGET_TIME_ZONE>>'),'')else  null END  <>  coalesce(TRGT.actual_start_on,'')