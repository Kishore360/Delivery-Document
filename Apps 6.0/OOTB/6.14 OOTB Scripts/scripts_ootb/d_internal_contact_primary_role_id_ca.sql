SELECT 
    CASE
        WHEN COUNT(1) > 0 THEN 'FAILURE'
        ELSE 'SUCCESS'
    END AS Result,
    CASE
        WHEN COUNT(1) > 0 THEN 'MDS to DWH data validation failed for d_internal_contact.primary_role_id'
        ELSE 'SUCCESS'
    END AS Message
FROM
    (SELECT 
        COALESCE(prj.PRPRIMARYROLEID, 'UNSPECIFIED') AS prPrimaryRoleID,
            srm.*
    FROM
        #MDS_TABLE_SCHEMA.srm_resources_final srm
    LEFT JOIN #MDS_TABLE_SCHEMA.prj_resources_final prj ON srm.ID = prj.prid
    WHERE
        srm.cdctype <> 'D'
            AND prj.cdctype <> 'D') src
        LEFT OUTER JOIN
    #DWH_TABLE_SCHEMA.d_internal_contact trg ON (CONCAT('INTERNAL_CONTACT~', src.id) = trg.row_id
        AND src.sourceinstance = trg.source_id)
WHERE
    COALESCE(src.prPrimaryRoleID, '') <> COALESCE(trg.primary_role_id, '')
;