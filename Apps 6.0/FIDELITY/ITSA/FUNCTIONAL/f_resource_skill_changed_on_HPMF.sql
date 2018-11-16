SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'MDS to DWH row count failed for f_resource_skill.changed_on' ELSE 'SUCCESS' END as Message
 from (select * from  fidelity_mdsdb.hp_rsc_skill_proficiency_final) SRC
left join fidelity_mdwdb.f_resource_skill TRGT
on SRC.skill_proficiency_id=TRGT.row_id
and SRC.sourceinstance=TRGT.source_id
where coalesce(CONVERT_TZ(SRC.last_update_date,'@#TENANT_SSI_TIME_ZONE@#','@#DW_TARGET_TIME_ZONE@#'),'')<>coalesce(TRGT.changed_on,'')


