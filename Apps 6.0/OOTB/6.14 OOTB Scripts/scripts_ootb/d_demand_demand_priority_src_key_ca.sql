SELECT 
    CASE
        WHEN COUNT(1) > 0 THEN 'FAILURE'
        ELSE 'SUCCESS'
    END AS Result,
    CASE
        WHEN COUNT(1) > 0 THEN 'MDS to DWH data validation failed for d_demand.demand_priority_src_key'
        ELSE 'SUCCESS'
    END AS Message
FROM
    (SELECT 
        srm.*,idea.priority as idea_priority
    FROM
        #MDS_TABLE_SCHEMA.inv_investments_final srm
        LEFT JOIN #MDS_TABLE_SCHEMA.inv_ideas_final idea on srm.id=idea.id
    WHERE
        srm.cdctype <> 'D'
            AND srm.ODF_OBJECT_CODE = 'idea') src
        LEFT OUTER JOIN
    #DWH_TABLE_SCHEMA.d_demand trg ON (src.id = trg.row_id
        AND src.sourceinstance = trg.source_id)
        LEFT JOIN
    #DWH_TABLE_SCHEMA.d_lov LKP ON (CONCAT('Demand~', 'Priority~', src.idea_priority) = LKP.src_rowid
        AND src.sourceinstance = LKP.source_id)
 WHERE COALESCE(LKP.row_key,CASE WHEN src.idea_priority IS NULL THEN 0 else '-1' end)<> COALESCE(trg.demand_priority_src_key ,'')
;