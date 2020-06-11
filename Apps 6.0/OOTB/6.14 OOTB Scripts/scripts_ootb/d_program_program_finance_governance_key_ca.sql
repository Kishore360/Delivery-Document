SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_program.program_finance_governance_key' ELSE 'SUCCESS' END as Message
FROM
   (select srm.*,odf.obj_stakeholder3 as obj_stakeholder3 from #MDS_TABLE_SCHEMA.inv_investments_final srm 
   LEFT JOIN #MDS_TABLE_SCHEMA.odf_ca_project_final odf ON srm.ID = odf.id
   LEFT JOIN #MDS_TABLE_SCHEMA.inv_projects_final inv_pr ON srm.id =inv_pr.prid
    WHERE
        srm.cdctype <> 'D'
            AND odf.cdctype <> 'D'
            AND inv_pr.cdctype <>'D'
            AND srm.ODF_OBJECT_CODE = 'project' AND is_open_for_te = 0
			AND inv_pr.is_program=1) src left outer join  #DWH_TABLE_SCHEMA.d_program trg
on (src.id=trg.row_id and src.sourceinstance=trg.source_id)
LEFT JOIN #DWH_TABLE_SCHEMA.d_internal_contact LKP 
 ON ( CONCAT('INTERNAL_CONTACT~',src.obj_stakeholder3) = LKP.row_id 
AND src.sourceinstance = LKP.source_id )
 WHERE COALESCE(LKP.row_key,CASE WHEN src.obj_stakeholder3 IS NULL THEN 0 else '-1' end)<> COALESCE(trg.program_finance_governance_key ,'')
;
