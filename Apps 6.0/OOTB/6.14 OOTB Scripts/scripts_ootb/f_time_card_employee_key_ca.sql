SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_time_card.employee_key' ELSE 'SUCCESS' END as Message
FROM
    (SELECT 
        prt.PRID AS prt_PRID,
            prt.sourceinstance AS prt_sourceinstance,
            prsheet.prresourceid AS prresourceid,
            prsheet.sourceinstance AS prsheet_sourceinstance
    FROM
        #MDS_TABLE_SCHEMA.prtimeentry_final prt
    LEFT JOIN #MDS_TABLE_SCHEMA.prtimesheet_final prsheet ON prt.PRTIMESHEETID = prsheet.PRID
    WHERE
        prt.CDCTYPE <> 'D'
            AND prsheet.CDCTYPE <> 'D') src
        LEFT OUTER JOIN
    (SELECT REQUEST_NAME,
        SLICE_DATE, prj_object_id
    FROM
        #MDS_TABLE_SCHEMA.prj_blb_slices_final a
    LEFT JOIN #MDS_TABLE_SCHEMA.prj_blb_slicerequests_final b ON a.SLICE_REQUEST_ID = b.ID
    WHERE
      a.cdctype <> 'D'
            AND b.cdctype <> 'D') pr_slices ON src.prt_PRID = pr_slices.prj_object_id
        LEFT JOIN
    #DWH_TABLE_SCHEMA.f_time_card trg ON CONCAT(src.prt_PRID,
            COALESCE(DATE_FORMAT(pr_slices.SLICE_DATE, '%Y%m%d'),
                    'UNSPECIFIED')) = trg.row_id
        AND src.prt_sourceinstance = trg.source_id
        LEFT JOIN
    #DWH_TABLE_SCHEMA.d_internal_contact lkp ON (COALESCE(CONCAT('INTERNAL_CONTACT~', src.prresourceid),
            'UNSPECIFIED') = lkp.row_id
        AND src.prsheet_sourceinstance = lkp.source_id)
WHERE
   pr_slices.REQUEST_NAME = 'DAILYRESOURCETIMECURVE'
            AND
    COALESCE(lkp.row_key,
            CASE
                WHEN src.prresourceid IS NULL THEN 0
                ELSE '-1'
            END) <> COALESCE(trg.employee_key, '');