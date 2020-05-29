SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_demand.demand_work_status_src_key' ELSE 'SUCCESS' END as Message
FROM
    (SELECT 
        odf.obj_work_status AS obj_work_status, srm.*
    FROM
        #MDS_TABLE_SCHEMA.inv_investments_final srm
    LEFT JOIN #MDS_TABLE_SCHEMA.odf_ca_inv_final odf ON srm.id = odf.id
    WHERE
        srm.cdctype <> 'D'
            AND srm.ODF_OBJECT_CODE = 'idea'
            AND odf.cdctype <> 'D') src
        LEFT OUTER JOIN
    #DWH_TABLE_SCHEMA.d_demand trg ON (src.id = trg.row_id
        AND src.sourceinstance = trg.source_id)
        LEFT JOIN
    #DWH_TABLE_SCHEMA.d_lov LKP ON (COALESCE(CONCAT('Demand~Work_Status',
                    '~',
                    src.obj_work_status),
            'UNSPECIFIED') = LKP.src_rowid
        AND src.sourceinstance = LKP.source_id)
WHERE
    COALESCE(LKP.row_key,
            CASE
                WHEN src.obj_work_status IS NULL THEN 0
                ELSE '-1'
            END) <> COALESCE(trg.demand_work_status_src_key, '')
;