SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_demand.demand_status_src_key' ELSE 'SUCCESS' END as Message
FROM
    (SELECT 
        srm.*
    FROM
        #MDS_TABLE_SCHEMA.inv_investments_final srm
    WHERE
        srm.cdctype <> 'D'
            AND srm.ODF_OBJECT_CODE = 'idea') src
        LEFT OUTER JOIN
    #DWH_TABLE_SCHEMA.d_demand trg ON (src.id = trg.row_id
        AND src.sourceinstance = trg.source_id)
        LEFT JOIN
    #DWH_TABLE_SCHEMA.d_lov LKP ON (CONCAT('Demand~', 'Status', '~', src.status) = LKP.src_rowid
        AND src.sourceinstance = LKP.source_id)
WHERE
    COALESCE(LKP.row_key,
            CASE
                WHEN src.status IS NULL THEN 0
                ELSE '-1'
            END) <> COALESCE(trg.demand_status_src_key, '');
