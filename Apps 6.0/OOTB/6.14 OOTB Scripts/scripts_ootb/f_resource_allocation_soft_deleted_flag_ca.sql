
SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_resource_allocation.soft_deleted_flag' ELSE 'SUCCESS' END as Message
FROM
(SELECT
 prassignment.sourceinstance prassignment_sourceinstance,
 CONCAT('ASSIGNED~',prassignment.PRID,
 '~',
 prassignment.PRRESOURCEID,
 '~',
 DATE_FORMAT(prj_blb_slices.SLICE_DATE,
 '%Y%m%d')) AS row_id,
 prassignment.cdctype AS cdctype,
 prassignment.PRTASKID AS PROJECTTASKID,
 prtask.PRPROJECTID AS PROJECTID,
 prassignment.PRRESOURCEID AS RESOURCEID,
 prj_blb_slices.SLICE_DATE AS SLICE_DATE,
 SUM(prj_blb_slices.SLICE) AS SLICE_VALUE,
 prassignment.PRID AS PRID  ,
  role_id,
 prtask.prprojectid prprojectid,
 prtask.prid as prtask_prid,
 prassignment.CDCTYPE as prassignment_CDCTYPE
FROM
 #MDS_TABLE_SCHEMA.prassignment_final prassignment      
INNER JOIN
 #MDS_TABLE_SCHEMA.prtask_final prtask 
  ON prassignment.PRTASKID=prtask.PRID 
  AND prassignment.sourceinstance=prtask.sourceinstance 
LEFT OUTER JOIN
 #MDS_TABLE_SCHEMA.inv_investments_final inv_investments 
  ON prtask.PRPROJECTID=inv_investments.ID 
  AND prtask.sourceinstance=inv_investments.sourceinstance 
LEFT OUTER JOIN
 #MDS_TABLE_SCHEMA.inv_projects_final inv_projects 
  ON inv_investments.ID=inv_projects.PRID 
  AND inv_investments.sourceinstance=inv_projects.sourceinstance 
LEFT OUTER JOIN
 #MDS_TABLE_SCHEMA.prj_blb_slices_final prj_blb_slices 
  ON prassignment.PRID=prj_blb_slices.PRJ_OBJECT_ID 
  AND prassignment.sourceinstance=prj_blb_slices.sourceinstance 
INNER JOIN
 #MDS_TABLE_SCHEMA.prj_blb_slicerequests_final prj_blb_slicerequests 
  ON prj_blb_slices.SLICE_REQUEST_ID=prj_blb_slicerequests.ID 
  AND prj_blb_slices.sourceinstance=prj_blb_slicerequests.sourceinstance    
WHERE
 UPPER(inv_investments.ODF_OBJECT_CODE)='PROJECT' 
 AND inv_projects.IS_TEMPLATE=0 
 AND UPPER(prj_blb_slicerequests.REQUEST_NAME) IN (
  'DAILYRESOURCEACTCURVE','DAILYRESOURCEESTCURVE' ) and    
 prassignment.CDCTYPE<>'D' and prtask.CDCTYPE<>'D' and inv_investments.CDCTYPE<>'D' and inv_projects.CDCTYPE<>'D'
GROUP BY 1, 2, 3, 4, 5, 6, 7, 9 
) src
left join #DWH_TABLE_SCHEMA.f_resource_allocation trg on
 src.row_id=trg.row_id
and src.prassignment_sourceinstance=trg.source_id
where 
COALESCE(CASE WHEN src.prassignment_CDCTYPE IN ('D','Y','N')  THEN 'Y' ELSE 'N' end,'')<> COALESCE(trg.soft_deleted_flag,'');