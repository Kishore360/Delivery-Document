SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_change_failure.assignee_title' ELSE 'SUCCESS' END as Message
from (SELECT * FROM #MDS_TABLE_SCHEMA.hlx_chg_infrastructure_change_final WHERE CDCTYPE<>'D') SRC
left join(SELECT * FROM #MDS_TABLE_SCHEMA.hlx_ctm_people_final)SRC1
on SRC.aslogid=SRC1.remedy_login_id 
and SRC.sourceinstance=SRC1.sourceinstance
left join (SELECT * FROM #DWH_TABLE_SCHEMA.d_change_failure where current_flag='Y') TRGT 
ON (SRC.infrastructure_change_id=TRGT.row_id 
	AND SRC.sourceinstance =TRGT.source_id )
WHERE COALESCE( SRC1.jobtitle,'UNSPECIFIED')<> COALESCE(TRGT.assignee_title,'')
