

SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_project_task.is_upcoming' ELSE 'SUCCESS' END as Message
FROM qualcomm_mdsdb.pm_project_final SRC 
JOIN (select source_id , max(lastupdated) refresh_date from qualcomm_mdwdb.d_o_data_freshness group by 1) FR
ON FR.source_id = SRC.sourceinstance
LEFT JOIN  qualcomm_mdwdb.d_lov_map LM
ON ( LM.src_rowid =concat('PROJECT~STATE~~',SRC.state))
LEFT JOIN qualcomm_mdwdb.f_project_task TRGT 
 ON (SRC.sys_id=TRGT.row_id 
 AND SRC.sourceinstance=TRGT.source_id )
 WHERE COALESCE( case when SRC.start_date  > convert_tz(FR.refresh_date ,'GMT','GMT')
 AND LM.dimension_wh_code='OPEN' then 'Y' else 'N' end ,'')
 <> COALESCE(TRGT.is_upcoming ,'')
