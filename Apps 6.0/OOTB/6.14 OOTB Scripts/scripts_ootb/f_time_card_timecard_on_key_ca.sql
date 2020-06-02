SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_time_card.timecard_on_key' ELSE 'SUCCESS' END as Message
FROM
    (SELECT 
        prt.*
    FROM
        #MDS_TABLE_SCHEMA.prtimeentry_final prt
    LEFT JOIN #MDS_TABLE_SCHEMA.prj_blb_slices_final prsheet ON prsheet.PRJ_OBJECT_ID = prt.PRID
    WHERE
        prt.CDCTYPE <> 'D'
            AND prsheet.CDCTYPE <> 'D') src
        LEFT OUTER JOIN
    (SELECT 
        REQUEST_NAME, SLICE_DATE, prj_object_id,
            DATE_FORMAT(a.SLICE_DATE, '%Y%m%d') AS src_slice_date
    FROM
        #MDS_TABLE_SCHEMA.prj_blb_slices_final a
    LEFT JOIN #MDS_TABLE_SCHEMA.prj_blb_slicerequests_final b ON a.SLICE_REQUEST_ID = b.ID
    WHERE
        a.cdctype <> 'D' AND b.cdctype <> 'D') pr_slices ON src.prid = pr_slices.prj_object_id
        LEFT JOIN
    #DWH_TABLE_SCHEMA.f_time_card trg ON CONCAT(src.PRID,
            COALESCE(DATE_FORMAT(pr_slices.SLICE_DATE, '%Y%m%d'),
                    'UNSPECIFIED')) = trg.row_id
        AND src.sourceinstance = trg.source_id
WHERE
    pr_slices.REQUEST_NAME = 'DAILYRESOURCETIMECURVE'
        AND COALESCE(pr_slices.src_slice_date, '') <> COALESCE(trg.timecard_on_key, '');


