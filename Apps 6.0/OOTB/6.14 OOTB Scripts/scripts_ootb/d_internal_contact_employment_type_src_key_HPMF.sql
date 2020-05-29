SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_internal_contact.Employment_Type' ELSE 'SUCCESS' END as Message
FROM  (select * from  #MDS_TABLE_SCHEMA.hp_knta_users_final where  cdctype<>'D') SRC
left join (select * from #DWH_TABLE_SCHEMA.d_internal_contact) TRGT
on CONCAT('INTERNAL_CONTACT~', SRC.USER_ID) =TRGT.row_id
and SRC.sourceinstance=TRGT.source_id
LEFT JOIN(SELECT * FROM #DWH_TABLE_SCHEMA.d_lov)LKP
on LKP.row_id=concat('EMPLOYEE~EMPLOYMENT_TYPE~',SRC.RESOURCE_CATEGORY_CODE)
and LKP.source_id=TRGT.source_id
where coalesce(LKP.row_key,case when SRC.RESOURCE_CATEGORY_CODE is null then 0 else -1 end)<>coalesce(TRGT.Employment_Type_src_key,'')