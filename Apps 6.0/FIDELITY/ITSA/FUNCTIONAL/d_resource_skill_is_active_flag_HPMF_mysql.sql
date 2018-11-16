SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'MDS to DWH row count failed for d_resource_skill.is_active_flag' ELSE 'SUCCESS' END as Message
from (select *from  fidelity_mdsdb.hp_rsc_skills_nls_final) SRC
left join  fidelity_mdwdb.d_resource_skill TRGT
on SRC.skill_id=TRGT.row_id
and SRC.sourceinstance=TRGT.source_id
WHERE COALESCE(CASE WHEN SRC.is_active=1 THEN 'Y' ELSE 'N' END,'') <> COALESCE(TRGT.is_active_flag ,'')