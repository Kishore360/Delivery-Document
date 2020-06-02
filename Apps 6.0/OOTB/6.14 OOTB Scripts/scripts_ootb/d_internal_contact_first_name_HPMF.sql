

SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_internal_contact.first_name' ELSE 'SUCCESS' END as Message

 FROM (select * from #MDS_TABLE_SCHEMA.hp_knta_users_final where  cdctype<>'D') SRC
left join (select * from #DWH_TABLE_SCHEMA.d_internal_contact) TRGT
on CONCAT('INTERNAL_CONTACT~', SRC.USER_ID) =TRGT.row_id
and SRC.sourceinstance=TRGT.source_id
where  COALESCE(TRGT.first_name,'') <> null