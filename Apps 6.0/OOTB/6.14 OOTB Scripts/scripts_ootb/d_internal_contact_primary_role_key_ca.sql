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
        PRPRIMARYROLEID AS prPrimaryRoleID,
            srm.*
    FROM
        #MDS_TABLE_SCHEMA.srm_resources_final srm
    LEFT JOIN #MDS_TABLE_SCHEMA.prj_resources_final prj ON srm.ID = prj.prid
    WHERE
        srm.cdctype <> 'D'
            AND prj.cdctype <> 'D' AND prj.PRISROLE=0) src
            LEFT JOIN #DWH_TABLE_SCHEMA.d_resource_role lkp on (src.prprimaryroleid=lkp.row_id
        AND src.sourceinstance = lkp.source_id
        )
        LEFT OUTER JOIN
    #DWH_TABLE_SCHEMA.d_internal_contact trg ON (CONCAT('INTERNAL_CONTACT~', src.id) = trg.row_id
        AND src.sourceinstance = trg.source_id) 
WHERE
COALESCE(lkp.row_key,
            CASE
                WHEN src.prPrimaryRoleID IS NULL THEN 0
                ELSE '-1'
            END)
     <> COALESCE(trg.primary_role_key, '')