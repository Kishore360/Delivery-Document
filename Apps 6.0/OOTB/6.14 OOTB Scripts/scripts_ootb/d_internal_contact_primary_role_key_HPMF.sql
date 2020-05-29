SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'MDS to DWH row count failed for d_internal_contact.PRIMARY_ROLE_KEY' ELSE 'SUCCESS' END as Message
FROM (select * from #MDS_TABLE_SCHEMA.hp_knta_users_final where  cdctype<>'D') SRC  left join 
 (select * from #MDS_TABLE_SCHEMA.hp_rsc_resources_final where  cdctype<>'D') SRC1
 on SRC.USER_ID=SRC1.USER_ID 
 and SRC.sourceinstance=SRC1.sourceinstance
left join (select * from #DWH_TABLE_SCHEMA.d_internal_contact) TRGT
on  CONCAT('INTERNAL_CONTACT~', SRC.USER_ID) =TRGT.row_id 
and SRC.sourceinstance=TRGT.source_id
left join (SELECT * FROM #DWH_TABLE_SCHEMA.d_resource_role) LKP
on SRC1.PRIMARY_ROLE_ID = LKP.row_id and  SRC1.sourceinstance=LKP.source_id
WHERE COALESCE(LKP.row_key,case when SRC1.PRIMARY_ROLE_ID is null then 0 else -1 end, '') <> coalesce(TRGT.PRIMARY_ROLE_KEY,'')