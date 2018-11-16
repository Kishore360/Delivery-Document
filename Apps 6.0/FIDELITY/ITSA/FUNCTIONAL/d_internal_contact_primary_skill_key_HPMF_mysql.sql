SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'MDS to DWH row count failed for d_internal_contact.PRIMARY_SKILL_KEY' ELSE 'SUCCESS' END as Message

FROM (select * from fidelity_mdsdb.hp_knta_users_final where  cdctype<>'D') SRC  left join 
 (select * from fidelity_mdsdb.hp_rsc_skill_proficiency_final where  cdctype<>'D') SRC1
 on SRC.USER_ID=SRC1.PARENT_ID and SRC.sourceinstance=SRC1.sourceinstance
left join (select * from fidelity_mdwdb.d_internal_contact) TRGT
on  CONCAT('INTERNAL_CONTACT~', SRC.USER_ID) =TRGT.row_id and SRC.sourceinstance=TRGT.source_id
left join (SELECT * FROM fidelity_mdwdb.d_resource_skill) LKP
on SRC1.SKILL_ID = LKP.row_id and  SRC1.sourceinstance=LKP.source_id

WHERE COALESCE(LKP.row_key,case when SRC1.SKILL_ID is null then 0 else -1 end, '') <> coalesce(TRGT.PRIMARY_SKILL_KEY,'')