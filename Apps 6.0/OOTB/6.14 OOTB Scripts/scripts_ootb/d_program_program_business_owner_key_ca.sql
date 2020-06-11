SELECT CASE
        WHEN COUNT(1) > 0 THEN 'FAILURE'
        ELSE 'SUCCESS'
    END AS Result,
    CASE
        WHEN COUNT(1) > 0 THEN 'MDS to DWH data validation failed for d_program.program_business_owner_key'
        ELSE 'SUCCESS'
    END AS Message
FROM
    (SELECT 
        srm.*, odf.obj_stakeholder1 AS obj_stakeholder1
    FROM
        #MDS_TABLE_SCHEMA.inv_investments_final srm
    LEFT JOIN #MDS_TABLE_SCHEMA.odf_ca_project_final odf ON srm.ID = odf.id
    WHERE
        srm.cdctype <> 'D'
            AND srm.ODF_OBJECT_CODE = 'project'
            AND odf.cdctype <> 'D'
            AND is_open_for_te = 0) src
        LEFT OUTER JOIN
    #DWH_TABLE_SCHEMA.d_program trg ON (src.id = trg.row_id
        AND src.sourceinstance = trg.source_id)
        LEFT JOIN
    #DWH_TABLE_SCHEMA.d_internal_contact LKP ON (CONCAT('INTERNAL_CONTACT~',
            src.obj_stakeholder1) = LKP.row_id
        AND src.sourceinstance = LKP.source_id)
WHERE
    COALESCE(LKP.row_key,
            CASE
                WHEN src.obj_stakeholder1 IS NULL THEN 0
                ELSE '-1'
            END) <> COALESCE(trg.program_business_owner_key, '')