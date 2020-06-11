/*Known issue. Working fine manuallay*/
SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'MDS to DWH row count failed for d_internal_contact.PRIMARY_SKILL_KEY' ELSE 'SUCCESS' END as Message
FROM (select * from #MDS_TABLE_SCHEMA.hp_knta_users_final where  cdctype<>'D') SRC  left join 
 (select T1.PARENT_ID,T1.SKILL_ID,T1.pro,T1.sourceinstance from 
(select max(proficiency_level_code) as pro,PARENT_ID,sourceinstance,SKILL_ID from itpa_l_dev_mdsdb.hp_rsc_skill_proficiency_final   where  cdctype<>'D' group by PARENT_ID,SKILL_ID
) T1
inner join 
(select parent_id,max(proficiency_level_code) as PR
from itpa_l_dev_mdsdb.hp_rsc_skill_proficiency_final 
group by parent_id
) T2
on T1.PARENT_ID= T2.PARENT_ID
and T1.pro = T2.PR) SRC1
 on SRC.USER_ID=SRC1.PARENT_ID and SRC.sourceinstance=SRC1.sourceinstance
left join (select * from #DWH_TABLE_SCHEMA.d_internal_contact) TRGT
on  CONCAT('INTERNAL_CONTACT~', SRC.USER_ID) =TRGT.row_id and SRC.sourceinstance=TRGT.source_id
left join (SELECT * FROM #DWH_TABLE_SCHEMA.d_resource_skill) LKP
on SRC1.SKILL_ID = LKP.row_id and  SRC1.sourceinstance=LKP.source_id
WHERE COALESCE(LKP.row_key,case when SRC1.pro is null then 0 else -1 end) <> coalesce(TRGT.PRIMARY_SKILL_KEY,'');