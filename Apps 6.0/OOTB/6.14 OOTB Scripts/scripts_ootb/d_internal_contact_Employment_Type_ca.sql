SELECT distinct
COALESCE(src1.Lookup_Code, '') , COALESCE(trg.Employment_Type, '')
FROM
    (SELECT * FROM (SELECT 
        a.*, b.*
    FROM
        (SELECT 
        sourceinstance, ID,person_type
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
    LEFT JOIN (SELECT 
        COALESCE(cmn.lookup_code, 'UNSPECIFIED') AS Lookup_Code,cmn.id as cmn_id
    FROM
        #MDS_TABLE_SCHEMA.cmn_lookups_final cmn
    WHERE
        cmn.cdctype <> 'D'
            AND cmn.lookup_type = 'SRM_RESOURCE_TYPE') cmn ON src.person_type = cmn.cmn_id) src1
        LEFT OUTER JOIN
    #DWH_TABLE_SCHEMA.d_internal_contact trg ON (CONCAT('INTERNAL_CONTACT~', src1.id) = trg.row_id
        AND src1.sourceinstance = trg.source_id)
WHERE
    COALESCE(src1.Lookup_Code, '') <> COALESCE(trg.Employment_Type, '');