SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_time_card.timecard_number' ELSE 'SUCCESS' END as Message
FROM
    (SELECT 
        prsheet.PRRESOURCEID prsheet_PRRESOURCEID,prt.sourceinstance prt_sourceinstance,prt.PRID as prt_PRID,prtask.PRID as prtask_prid,prt.CDCTYPE as prt_cdctype,prtask.CDCTYPE as prtask_cdctype
    FROM
        #MDS_TABLE_SCHEMA.prtimeentry_final prt
        LEFT JOIN #MDS_TABLE_SCHEMA.prassignment_final prassign on prt.prassignmentid=prassign.prid
    LEFT JOIN #MDS_TABLE_SCHEMA.prtimesheet_final prsheet ON prt.PRTIMESHEETID = prsheet.PRID
    LEFT JOIN #MDS_TABLE_SCHEMA.prtask_final prtask ON prassign.prtaskid=prtask.prid 
    WHERE
        prt.cdctype <> 'D'
            AND prsheet.CDCTYPE <> 'D' and prtask.cdctype<>'D') src
        LEFT OUTER JOIN
    (SELECT 
        SLICE_DATE, prj_object_id, REQUEST_NAME
    FROM
        #MDS_TABLE_SCHEMA.prj_blb_slices_final a
    LEFT JOIN #MDS_TABLE_SCHEMA.prj_blb_slicerequests_final b ON a.SLICE_REQUEST_ID = b.ID
    WHERE
        a.cdctype <> 'D' AND b.cdctype <> 'D') pr_slices ON src.prt_PRID = pr_slices.prj_object_id
        LEFT JOIN
    #DWH_TABLE_SCHEMA.f_time_card trg ON CONCAT(src.prt_PRID,
            COALESCE(DATE_FORMAT(pr_slices.SLICE_DATE, '%Y%m%d'),
                    'UNSPECIFIED')) = trg.row_id
        AND src.prt_sourceinstance = trg.source_id
WHERE
pr_slices.REQUEST_NAME = 'DAILYRESOURCETIMECURVE'
AND
    COALESCE(CONCAT(COALESCE(src.prsheet_PRRESOURCEID, 'UNSPECIFIED'),
                    '~',
                    COALESCE(src.prtask_prid, 'UNSPECIFIED'),
                    '~',
                    COALESCE(DATE_FORMAT(pr_slices.SLICE_DATE, '%Y%m%d'),
                            'UNSPECIFIED')),
            '') <> COALESCE(trg.timecard_number, '')
        ;            
