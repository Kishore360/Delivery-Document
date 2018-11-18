SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_project_task.row_id' ELSE 'SUCCESS' END as Message
FROM  (select * from fidelity_mdsdb.hp_rsc_skill_proficiency_final where cdctype<>'D') SRC 
LEFT JOIN (select * from  fidelity_mdwdb.f_resource_skill)TRGT   
	ON SRC.skill_proficiency_id =TRGT.row_id 
	and SRC.sourceinstance=TRGT.source_id
where COALESCE(SRC.skill_proficiency_id,'') <> COALESCE(TRGT.row_id,'')