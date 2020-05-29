SELECT CASE
        WHEN COUNT(1) > 0 THEN 'FAILURE'
        ELSE 'SUCCESS'
    END AS Result,
    CASE
        WHEN COUNT(1) > 0 THEN 'MDS to DWH data validation failed for d_demand.created_on'
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
   COALESCE(convert_tz(src.CREATED_DATE,'<<TENANT_SSI_TIME_ZONE>>','<<DW_TARGET_TIME_ZONE>>'), '')<> COALESCE(trg.created_on, '')
;


