SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_internal_contact. parent_row_id' ELSE 'SUCCESS' END as Message
FROM (select * from #MDS_TABLE_SCHEMA.hlx_ctm_people_final where CDCTYPE<>'D')SRC
left join #DWH_TABLE_SCHEMA.d_internal_contact TRGT
on TRGT.row_id=CONCAT('INTERNAL_CONTACT~',SRC.person_id)
and TRGT.source_id=SRC.sourceinstance
where coalesce(concat('INTERNAL_CONTACT','~',SRC.managerloginid,''))
<>coalesce(TRGT.parent_row_id,'') 