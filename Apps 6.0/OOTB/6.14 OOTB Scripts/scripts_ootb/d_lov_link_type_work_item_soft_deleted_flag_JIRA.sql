SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_lov_link_type_work_item.soft_deleted_flag' ELSE 'SUCCESS' END as Message
FROM (
select inward as id, sourceinstance, inward as name, cdctype from #MDS_TABLE_SCHEMA.issuelinktype_final where id is not null and id <> ''
union
select outward as id, sourceinstance, outward as name, cdctype from #MDS_TABLE_SCHEMA.issuelinktype_final where id is not null and id <> ''
union 
select 'Epic Link' as id, source_id as sourceinstance, 'Epic Link' as name, 'X' as cdctype from #DWH_TABLE_SCHEMA.d_o_data_freshness where sourcename = 'Jira_Tenant'
union 
select 'Epic Child' as id, source_id as sourceinstance, 'Epic Child' as name, 'X' as cdctype from #DWH_TABLE_SCHEMA.d_o_data_freshness where sourcename = 'Jira_Tenant'
) SRC 
LEFT JOIN #DWH_TABLE_SCHEMA.d_lov TRGT 
ON  ((CONCAT('LINK_TYPE~WORK_ITEM~',(SRC.id)))=TRGT.row_id 
AND SRC.sourceinstance=TRGT.source_id)
WHERE  coalesce(case when SRC.cdctype = 'D' then 'Y' else 'N' end, '')<>coalesce(TRGT.soft_deleted_flag,'')