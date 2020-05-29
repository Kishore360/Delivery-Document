SELECT  CASE
        WHEN COUNT(1) > 0 THEN 'FAILURE'
        ELSE 'SUCCESS'
    END AS Result,
    CASE
        WHEN COUNT(1) > 0 THEN 'MDS to DWH data validation failed for d_demand.demand_risk_src_key'
        ELSE 'SUCCESS'
		END AS Message
FROM
    (SELECT 
        srm.*,case  when  risk>=0 and risk<= 33 THEN 0 when risk >=34 and risk<=67 THEN 50 when risk>=67 and risk<=100 then 100 end as risk_score
    FROM
        #MDS_TABLE_SCHEMA.inv_investments_final srm
    WHERE
        srm.cdctype <> 'D'
            AND srm.ODF_OBJECT_CODE = 'idea') src
        LEFT OUTER JOIN
    #DWH_TABLE_SCHEMA.d_demand trg ON (src.id = trg.row_id
        AND src.sourceinstance = trg.source_id)
        LEFT JOIN
    #DWH_TABLE_SCHEMA.d_lov LKP ON (CONCAT('Demand~', 'Risk~', src.risk_score) = LKP.src_rowid
        AND src.sourceinstance = LKP.source_id)
WHERE
    COALESCE(LKP.row_key,
            CASE
                WHEN src.risk_score IS NULL THEN 0
                ELSE '-1'
            END) <> COALESCE(trg.demand_risk_src_key, '')
;