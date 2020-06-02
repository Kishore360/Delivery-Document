SELECT CASE
        WHEN COUNT(1) > 0 THEN 'FAILURE'
        ELSE 'SUCCESS'
    END AS Result,
    CASE
        WHEN COUNT(1) > 0 THEN 'MDS to DWH data validation failed for d_program.program_risk_src_key'
        ELSE 'SUCCESS'
    END AS Message
    

FROM
    (SELECT 
        srm.*,
            COALESCE(CONCAT('Program~Risk~', CASE
                WHEN (inv.RCF_FLEXIBILITY + inv.RCF_FUNDING + inv.RCF_HUMAN_INTERFACE + inv.RCF_IMPLEMENTATION + inv.RCF_INTERDEPENDENCY + inv.RCF_OBJECTIVES + inv.RCF_ORG_CULTURE + inv.RCF_RESOURCE_AVAIL + inv.RCF_SPONSORSHIP + inv.RCF_SUPPORTABILITY + inv.RCF_TECHNICAL) / 6 BETWEEN 0 AND 33 THEN 0
                WHEN (inv.RCF_FLEXIBILITY + inv.RCF_FUNDING + inv.RCF_HUMAN_INTERFACE + inv.RCF_IMPLEMENTATION + inv.RCF_INTERDEPENDENCY + inv.RCF_OBJECTIVES + inv.RCF_ORG_CULTURE + inv.RCF_RESOURCE_AVAIL + inv.RCF_SPONSORSHIP + inv.RCF_SUPPORTABILITY + inv.RCF_TECHNICAL) / 6 BETWEEN 34 AND 67 THEN 50
                WHEN (inv.RCF_FLEXIBILITY + inv.RCF_FUNDING + inv.RCF_HUMAN_INTERFACE + inv.RCF_IMPLEMENTATION + inv.RCF_INTERDEPENDENCY + inv.RCF_OBJECTIVES + inv.RCF_ORG_CULTURE + inv.RCF_RESOURCE_AVAIL + inv.RCF_SPONSORSHIP + inv.RCF_SUPPORTABILITY + inv.RCF_TECHNICAL) / 6 BETWEEN 68 AND 100 THEN 100
                ELSE NULL
            END), NULL) AS rcf_columns
    FROM
        #MDS_TABLE_SCHEMA.inv_investments_final srm
    LEFT JOIN #MDS_TABLE_SCHEMA.inv_projects_final inv ON srm.ID = inv.PRID
	LEFT JOIN #MDS_TABLE_SCHEMA.inv_projects_final inv_pr ON srm.id =inv_pr.prid
    WHERE
        srm.cdctype <> 'D'
            AND srm.ODF_OBJECT_CODE = 'project'
            AND inv.cdctype <> 'D'
			AND inv_pr.cdctype <>'D'
            AND srm.cdctype <> 'D'
            AND inv.is_program = 1
			AND inv_pr.is_program=1) src
        LEFT OUTER JOIN
    #DWH_TABLE_SCHEMA.d_program trg ON (src.id = trg.row_id
        AND src.sourceinstance = trg.source_id)
        LEFT JOIN
    #DWH_TABLE_SCHEMA.d_lov LKP ON (src.rcf_columns = LKP.src_rowid
        AND src.sourceinstance = LKP.source_id)
WHERE
    COALESCE(LKP.row_key,
            CASE
                WHEN src.rcf_columns IS NULL THEN 0
                ELSE '-1'
            END) <> COALESCE(trg.program_risk_src_key, '')
;

