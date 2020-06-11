SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'MDS to DWH row count failed for d_internal_contact.role_id' ELSE 'SUCCESS' END as Message

FROM (select * from #MDS_TABLE_SCHEMA.hp_knta_users_final where  cdctype<>'D') SRC  left join 
 (select * from #MDS_TABLE_SCHEMA.hp_rsc_resources_final where  cdctype<>'D') SRC1
 on SRC.USER_ID=SRC1.USER_ID and SRC.sourceinstance=SRC1.sourceinstance

left join (select * from #DWH_TABLE_SCHEMA.d_internal_contact) TRGT
on  CONCAT('INTERNAL_CONTACT~', SRC.USER_ID) =TRGT.row_id and SRC.sourceinstance=TRGT.source_id
WHERE COALESCE(SRC1.PRIMARY_ROLE_ID,'') <> coalesce(TRGT.role_id,'')