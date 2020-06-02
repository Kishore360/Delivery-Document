SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_program.soft_deleted_flag' ELSE 'SUCCESS' END as Message
FROM
   (select srm.* from #MDS_TABLE_SCHEMA.inv_investments_final srm 
   LEFT JOIN #MDS_TABLE_SCHEMA.inv_projects_final inv_pr ON srm.id =inv_pr.prid
     WHERE
        srm.cdctype <> 'D'
		AND inv_pr.cdctype <>'D'
            AND srm.ODF_OBJECT_CODE = 'project' and is_open_for_te=0
			AND inv_pr.is_program = 1) src left outer join  #DWH_TABLE_SCHEMA.d_program trg
on (src.id=trg.row_id and src.sourceinstance=trg.source_id)
where  COALESCE(CASE WHEN src.cdctype='X' THEN 'N' ELSE 'Y' END,'')<> COALESCE(trg.soft_deleted_flag,'')
;
