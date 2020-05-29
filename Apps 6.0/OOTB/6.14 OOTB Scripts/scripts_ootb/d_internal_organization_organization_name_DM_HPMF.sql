SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'MDS to DWH row count failed for d_internal_organization.organization_name' ELSE 'SUCCESS' END as Message
 from (select * from  #MDS_TABLE_SCHEMA.hp_knta_lookups_nls_final  where LOOKUP_TYPE='DEPT' and  cdctype<>'D') SRC
left join #DWH_TABLE_SCHEMA.d_internal_organization TRGT
on CONCAT('DEPARTMENT~',SRC.LOOKUP_CODE)=TRGT.row_id
and SRC.sourceinstance=TRGT.source_id
where  coalesce(SRC.meaning,'') <> coalesce(TRGT.organization_name,'') 