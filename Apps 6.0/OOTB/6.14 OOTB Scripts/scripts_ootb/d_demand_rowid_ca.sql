SELECT 
    CASE
        WHEN COUNT(1) > 0 THEN 'FAILURE'
        ELSE 'SUCCESS'
    END AS Result,
    CASE
        WHEN COUNT(1) > 0 THEN 'MDS to DWH data validation failed for d_demand.row_id'
        ELSE 'SUCCESS'
    END AS Message
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
WHERE
    COALESCE(src.id, '') <> COALESCE(trg.row_id, '')
;