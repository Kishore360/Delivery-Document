SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH Row COUNT failed for f_time_card' END as Message
FROM
   
        (SELECT 
    COUNT(*) src_count
FROM
    (SELECT 
        *
    FROM
        (SELECT 
        *
    FROM
        #MDS_TABLE_SCHEMA.prtimeentry_final prt
    WHERE
        prt.CDCTYPE <> 'D') src
    LEFT OUTER JOIN (SELECT 
        REQUEST_NAME, SLICE_DATE, prj_object_id
    FROM
        #MDS_TABLE_SCHEMA.prj_blb_slices_final a
    LEFT JOIN #MDS_TABLE_SCHEMA.prj_blb_slicerequests_final b ON a.SLICE_REQUEST_ID = b.ID
    WHERE
        a.cdctype <> 'D' AND b.cdctype <> 'D') pr_slices ON src.prid = pr_slices.prj_object_id) src1
WHERE
    src1.REQUEST_NAME = 'DAILYRESOURCETIMECURVE') src_1,
    (SELECT 
        COUNT(*) tgt_count
    FROM
        #DWH_TABLE_SCHEMA.f_time_card
    ) trg
WHERE

    src_count <> tgt_count
;	