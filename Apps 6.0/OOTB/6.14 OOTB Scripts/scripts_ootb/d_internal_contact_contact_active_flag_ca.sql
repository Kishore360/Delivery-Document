SELECT 
    CASE
        WHEN COUNT(1) > 0 THEN 'FAILURE'
        ELSE 'SUCCESS'
    END AS Result,
    CASE
        WHEN COUNT(1) > 0 THEN 'MDS to DWH data validation failed for d_internal_contact.contact_active_flag'
        ELSE 'SUCCESS'
    END AS Message
FROM
    (SELECT 
        a.*, b.*
    FROM
        (SELECT 
        sourceinstance AS srm_sourceinstance, ID, is_active
    FROM
        #MDS_TABLE_SCHEMA.srm_resources_final
    WHERE
        cdctype <> 'D') AS a
    INNER JOIN (SELECT 
        prid, sourceinstance AS b_sourceinstance
    FROM
        #MDS_TABLE_SCHEMA.prj_resources_final
    WHERE
        cdctype <> 'D' AND PRISROLE = 0) AS b ON a.id = b.prid
        AND a.srm_sourceinstance = b.b_sourceinstance) src
        LEFT OUTER JOIN
    #DWH_TABLE_SCHEMA.d_internal_contact trg ON (CONCAT('INTERNAL_CONTACT~', src.id) = trg.row_id
        AND src.srm_sourceinstance = trg.source_id)
WHERE
    COALESCE(CASE
                WHEN src.is_active = 1 THEN 'Y'
                ELSE 'N'
            END,
            '') <> COALESCE(trg.contact_active_flag, '')
;
