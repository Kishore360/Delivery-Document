SELECT 
    CASE
        WHEN COUNT(1) > 0 THEN 'FAILURE'
        ELSE 'SUCCESS'
    END AS Result,
    CASE
        WHEN COUNT(1) > 0 THEN 'MDS to DWH data validation failed for d_demand.demand_business_alignment_src_key'
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
        LEFT JOIN
    #DWH_TABLE_SCHEMA.d_lov LKP ON trg.business_alignment_score BETWEEN LKP.lower_range_value AND LKP.upper_range_value
        AND LKP.dimension_class = 'WH_Demand~BusinessAlignment'
        AND LKP.row_key IN (0 , - 1)
WHERE
    COALESCE(LKP.row_key, - 1) <> COALESCE(trg.demand_business_alignment_src_key,
            '')
;    