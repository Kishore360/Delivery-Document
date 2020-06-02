SELECT 
   COALESCE(src1.dept_id, '') , COALESCE(trg.department_code, '')
FROM
    (SELECT 
        *
    FROM
        (SELECT 
        a.*, b.*
    FROM
        (SELECT 
        sourceinstance as srm_sourceinstance, ID
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
    LEFT JOIN (SELECT 
        RECORD_ID, sourceinstance as prj_sourceinstance,UNIT_ID
    FROM
        #MDS_TABLE_SCHEMA.prj_obs_associations_final
    WHERE
        cdctype <> 'D') AS prj ON src.id = prj.RECORD_ID
        AND src.srm_sourceinstance = prj.prj_sourceinstance
    LEFT JOIN (SELECT 
        ID AS dept_id, OBS_UNIT_ID, sourceinstance as dept_sourceinstance
    FROM
        #MDS_TABLE_SCHEMA.departments_final
    WHERE
        cdctype <> 'D') dept ON dept.OBS_UNIT_ID = prj.UNIT_ID
        AND dept.dept_sourceinstance = prj.prj_sourceinstance) src1
        LEFT OUTER JOIN
    #DWH_TABLE_SCHEMA.d_internal_contact trg ON (CONCAT('INTERNAL_CONTACT~', src1.id) = trg.row_id
        AND src1.srm_sourceinstance = trg.source_id)
WHERE
    COALESCE(src1.dept_id, '') <> COALESCE(trg.department_code, '')
;    
