SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_resource_allocation.Program_key' ELSE 'SUCCESS' END as Message
FROM
(SELECT 
prassignment.sourceinstance AS source_id,
CONCAT('ASSIGNED~', prassignment.PRID, '', prassignment.PRRESOURCEID, '', DATE_FORMAT(prj_blb_slices.SLICE_DATE, '%Y%m%d')) AS row_id,
prassignment.cdctype AS cdctype,
prassignment.PRTASKID AS PROJECTTASKID,
prtask.PRPROJECTID AS PROJECTID,
prassignment.PRRESOURCEID AS RESOURCEID,
prj_blb_slices.SLICE_DATE AS SLICE_DATE,
SUM(prj_blb_slices.SLICE) AS SLICE_VALUE,
prassignment.PRID AS PRID,
prassignment.sourceinstance prassignment_sourceinstance,
prassignment.PRTASKID prassignment_PRTASKID
FROM
#MDS_TABLE_SCHEMA.prassignment_final prassignment
INNER JOIN #MDS_TABLE_SCHEMA.prtask_final prtask ON prassignment.PRTASKID = prtask.PRID
AND prassignment.sourceinstance = prtask.sourceinstance
LEFT OUTER JOIN #MDS_TABLE_SCHEMA.inv_investments_final inv_investments ON prtask.PRPROJECTID = inv_investments.ID
AND prtask.sourceinstance = inv_investments.sourceinstance
LEFT OUTER JOIN #MDS_TABLE_SCHEMA.inv_projects_final inv_projects ON inv_investments.ID = inv_projects.PRID
AND inv_investments.sourceinstance = inv_projects.sourceinstance
LEFT OUTER JOIN #MDS_TABLE_SCHEMA.prj_blb_slices_final prj_blb_slices ON prassignment.PRID = prj_blb_slices.PRJ_OBJECT_ID
AND prassignment.sourceinstance = prj_blb_slices.sourceinstance
INNER JOIN #MDS_TABLE_SCHEMA.prj_blb_slicerequests_final prj_blb_slicerequests ON prj_blb_slices.SLICE_REQUEST_ID = prj_blb_slicerequests.ID
AND prj_blb_slices.sourceinstance = prj_blb_slicerequests.sourceinstance
WHERE
UPPER(inv_investments.ODF_OBJECT_CODE) = 'PROJECT'
AND inv_projects.IS_TEMPLATE = 0
AND UPPER(prj_blb_slicerequests.REQUEST_NAME) IN ('DAILYRESOURCEACTCURVE' , 'DAILYRESOURCEESTCURVE')
AND prassignment.CDCTYPE <> 'D'
AND prtask.CDCTYPE <> 'D'
AND inv_investments.CDCTYPE <> 'D'
AND inv_projects.CDCTYPE <> 'D'
GROUP BY 1 , 2 , 3 , 4 , 5 , 6 , 7 , 9) src
LEFT JOIN
(SELECT 
SRC_1.PRPROJECTID AS SRC_1_PRPROJECTID,
d_prog.ROW_KEY AS program_key,
SRC_1.sourceinstance AS source_id
FROM
(SELECT 
prtask1.PRPROJECTID,
prassignment1.sourceinstance
FROM
#MDS_TABLE_SCHEMA.prassignment_final prassignment1
INNER JOIN #MDS_TABLE_SCHEMA.prtask_final prtask1 ON prassignment1.PRTASKID = prtask1.PRID
WHERE
prassignment1.CDCTYPE <> 'D') SRC_1
LEFT OUTER JOIN 
(SELECT 
t1.SUB_PROJECT_ID, t1.PARENT_ID, t2.IS_PROGRAM
FROM
(SELECT 
sub_proj.PRREFPROJECTID AS SUB_PROJECT_ID,
task.PRPROJECTID AS PARENT_ID,
task.CREATED_DATE AS created_date
FROM
#MDS_TABLE_SCHEMA.prsubproject_final sub_proj
LEFT OUTER JOIN 
#MDS_TABLE_SCHEMA.prtask_final task ON task.PRID = sub_proj.PRTASKID) t1
JOIN 
(SELECT 
SUB_PROJECT_ID,
IS_PROGRAM,
MIN(created_date) AS created_date
FROM
(SELECT 
sub_proj.PRREFPROJECTID AS SUB_PROJECT_ID,
task.PRPROJECTID AS PARENT_ID,
'N' AS is_top_flag,
task.CREATED_DATE AS created_date,
inv_proj_parent.IS_PROGRAM
FROM
#MDS_TABLE_SCHEMA.prsubproject_final sub_proj
LEFT OUTER JOIN 
#MDS_TABLE_SCHEMA.prtask_final task ON task.PRID = sub_proj.PRTASKID
LEFT OUTER JOIN 
(SELECT 
*
FROM
#MDS_TABLE_SCHEMA.inv_investments_final
WHERE
IS_ACTIVE = 1
AND UPPER(ODF_OBJECT_CODE) = 'PROJECT') inv_invest_sub ON sub_proj.PRREFPROJECTID = inv_invest_sub.ID
LEFT OUTER JOIN 
(SELECT 
*
FROM
#MDS_TABLE_SCHEMA.inv_investments_final
WHERE
IS_ACTIVE = 1
AND UPPER(ODF_OBJECT_CODE) = 'PROJECT') inv_invest_parent ON task.PRPROJECTID = inv_invest_parent.ID
LEFT OUTER JOIN 
(SELECT 
*
FROM
#MDS_TABLE_SCHEMA.inv_projects_final
WHERE
IS_TEMPLATE = 0 AND IS_PROGRAM = 0) inv_proj_sub ON inv_invest_sub.ID = inv_proj_sub.PRID
LEFT OUTER JOIN 
(SELECT 
*
FROM
#MDS_TABLE_SCHEMA.inv_projects_final
WHERE
IS_TEMPLATE = 0) inv_proj_parent ON inv_invest_parent.ID = inv_proj_parent.PRID) A
GROUP BY SUB_PROJECT_ID , IS_PROGRAM) t2 ON t1.SUB_PROJECT_ID = t2.SUB_PROJECT_ID
AND t1.created_date = t2.created_date AND t2.IS_PROGRAM=1) SRC_3 ON SRC_1.PRPROJECTID = SRC_3.SUB_PROJECT_ID
LEFT OUTER JOIN #DWH_TABLE_SCHEMA.d_program d_prog ON d_prog.row_id = SRC_3.PARENT_ID) src_2 ON src.PROJECTID = src_2.SRC_1_PRPROJECTID
AND src.source_id = src_2.source_id
LEFT JOIN
#DWH_TABLE_SCHEMA.f_resource_allocation trg ON src.row_id = trg.row_id
AND src.prassignment_sourceinstance = trg.source_id
WHERE
trg.row_id LIKE '%ASSIGNED%'
AND COALESCE(src_2.program_key, 0) <> COALESCE(trg.program_key, '');