SELECT 
    CASE
        WHEN COUNT(1) > 0 THEN 'FAILURE'
        ELSE 'SUCCESS'
    END AS Result,
    CASE
        WHEN COUNT(1) > 0 THEN 'MDS to DWH data validation failed for d_internal_contact.row_id'
        ELSE 'SUCCESS'
    END AS Message
FROM
    (SELECT 
        a.*, b.*
    FROM
        (SELECT 
        sourceinstance, ID
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
        AND a.sourceinstance = b.b_sourceinstance) src
        LEFT OUTER JOIN
    #DWH_TABLE_SCHEMA.d_internal_contact trg ON (CONCAT('INTERNAL_CONTACT~', src.id) = trg.row_id
        AND src.sourceinstance = trg.source_id)
WHERE
    COALESCE(CONCAT('INTERNAL_CONTACT~', src.id), '') <> COALESCE(trg.row_id, '');