SELECT CASE
        WHEN COUNT(1) > 0 THEN 'FAILURE'
        ELSE 'SUCCESS'
    END AS Result,
    CASE
        WHEN COUNT(1) > 0 THEN 'MDS to DWH data validation failed for d_program.changed_on'
        ELSE 'SUCCESS'
    END AS Message
FROM
    (SELECT 
        srm.*
    FROM
        #MDS_TABLE_SCHEMA.inv_investments_final srm
		LEFT JOIN #MDS_TABLE_SCHEMA.inv_projects_final inv_pr ON srm.id =inv_pr.prid
    WHERE
        srm.cdctype <> 'D'
		AND inv_pr.cdctype <>'D'
            AND srm.ODF_OBJECT_CODE = 'project' and is_open_for_te=0
			AND inv_pr.is_program=1) src
        LEFT OUTER JOIN
    #DWH_TABLE_SCHEMA.d_program trg ON (src.id = trg.row_id
        AND src.sourceinstance = trg.source_id)
WHERE
COALESCE(convert_tz(src.last_updated_date,'<<TENANT_SSI_TIME_ZONE>>','<<DW_TARGET_TIME_ZONE>>'),'')<> COALESCE(trg.changed_on, '');

