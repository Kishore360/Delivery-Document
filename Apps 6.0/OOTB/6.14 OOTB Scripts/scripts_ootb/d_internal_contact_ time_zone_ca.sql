SELECT 
    CASE
        WHEN COUNT(1) > 0 THEN 'failure'
        ELSE 'success'
    END AS result,
    CASE
        WHEN COUNT(1) > 0 THEN 'mds to dwh data validation failed for d_internal_contact.time_zone'
        ELSE 'success'
    END AS message
FROM
    (SELECT 
        a.*, b.*
    FROM
        (SELECT 
        *
    FROM
        (SELECT 
        sourceinstance AS srm_sourceinstance, ID
    FROM
        #MDS_TABLE_SCHEMA.srm_resources_final
    WHERE
        cdctype <> 'D') SRM
    LEFT JOIN (SELECT 
        timezone,ID as cmn_id
    FROM
        #MDS_TABLE_SCHEMA.cmn_sec_users_final
    WHERE
        cdctype <> 'D') cmn_sec ON SRM.ID = cmn_sec.cmn_id) AS a
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
    COALESCE(src.timezone, '') <> COALESCE(trg.time_zone, '')
;