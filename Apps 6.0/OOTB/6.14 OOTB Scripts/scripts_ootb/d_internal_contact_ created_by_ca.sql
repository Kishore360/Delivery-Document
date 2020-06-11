SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_internal_contact.created_by' ELSE 'SUCCESS' END as Message
FROM
   (SELECT 
        a.*, b.*
    FROM
        (SELECT 
        sourceinstance AS srm_sourceinstance,
            ID,
            cdctype,
            email
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
   left outer join  #DWH_TABLE_SCHEMA.d_internal_contact trg
on (CONCAT('INTERNAL_CONTACT~',src.id)=trg.row_id and src.sourceinstance= trg.source_id)
where  COALESCE(src.last_updated_date,'')<> COALESCE(trg.created_by,'')
;