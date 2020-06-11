SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_time_card.project_key' ELSE 'SUCCESS' END as Message
FROM
    (SELECT 
       prt.prid as prt_prid,prt.sourceinstance as prt_sourceinstance,
            prsheet.*,
            COALESCE(prtask.prid, 'UNSPECIFIED') AS pr_task_prid,prtask.sourceinstance as prtask_sourceinstance,
            COALESCE(prtask.prprojectid, 'UNSPECIFIED') AS prprojectid
    FROM
        #MDS_TABLE_SCHEMA.prtimeentry_final prt
    LEFT JOIN #MDS_TABLE_SCHEMA.prassignment_final prsheet ON prt.PRASSIGNMENTID = prsheet.PRID
        AND prt.sourceinstance = prsheet.sourceinstance
    LEFT JOIN #MDS_TABLE_SCHEMA.prtask_final prtask ON prsheet.PRTASKID = prtask.PRID
    WHERE
        prt.CDCTYPE <> 'D'
            AND prsheet.CDCTYPE <> 'D'
            AND prtask.CDCTYPE <> 'D') src
        LEFT OUTER JOIN
    (SELECT 
        REQUEST_NAME, SLICE_DATE, prj_object_id
    FROM
        #MDS_TABLE_SCHEMA.prj_blb_slices_final a
    LEFT JOIN #MDS_TABLE_SCHEMA.prj_blb_slicerequests_final b ON a.SLICE_REQUEST_ID = b.ID
    WHERE
        a.cdctype <> 'D' AND b.cdctype <> 'D') pr_slices ON src.prid = pr_slices.prj_object_id
        LEFT JOIN
    #DWH_TABLE_SCHEMA.f_time_card trg ON CONCAT(src.prt_prid,
            COALESCE(DATE_FORMAT(pr_slices.SLICE_DATE, '%Y%m%d'),
                    'UNSPECIFIED')) = trg.row_id
        AND src.prt_sourceinstance = trg.source_id
        LEFT JOIN
    #DWH_TABLE_SCHEMA.d_project lkp ON (src.prprojectid = lkp.row_id
        AND src.prtask_sourceinstance = lkp.source_id)
WHERE
    pr_slices.REQUEST_NAME = 'DAILYRESOURCETIMECURVE'
        AND COALESCE(lkp.row_key,
            CASE
                WHEN src.prprojectid IS NULL THEN 0
                ELSE '-1'
            END) <> COALESCE(trg.project_key, '');
