

SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_resource_allocation.parent_project_key' ELSE 'SUCCESS' END as Message
FROM
    (SELECT 
        prassignment.sourceinstance AS source_id,
            CONCAT('ASSIGNED~', prassignment.PRID, '~', prassignment.PRRESOURCEID, '~', DATE_FORMAT(prj_blb_slices.SLICE_DATE, '%Y%m%d')) AS row_id,
            prassignment.cdctype AS cdctype,
            prassignment.PRTASKID AS PROJECTTASKID,
            prtask.PRPROJECTID AS PROJECTID,
            prassignment.PRRESOURCEID AS RESOURCEID,
            prj_blb_slices.SLICE_DATE AS SLICE_DATE,
            SUM(prj_blb_slices.SLICE) AS SLICE_VALUE,
            prassignment.PRID AS PRID,
            prassignment.sourceinstance prassignment_sourceinstance,
            prassignment.PRFINISH AS assign_PRFINISH,
            prtask.PRFINISH AS prtask_PRFINISH,
            prassignment.last_updated_by as pr_last_updated_by
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
    #DWH_TABLE_SCHEMA.f_resource_allocation trg ON src.row_id = trg.row_id
        AND src.prassignment_sourceinstance = trg.source_id
WHERE
    trg.row_id LIKE '%ASSIGNED%'
COALESCE(src.prprojectid,'')<> COALESCE(trg.parent_project_key,'');


