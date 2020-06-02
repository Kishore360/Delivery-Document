SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'MDS to DWH row count failed for d_internal_organization.group_flag' ELSE 'SUCCESS' END as Message
 from (select * from  #MDS_TABLE_SCHEMA.hp_rsc_resource_pools_final) SRC
left join #DWH_TABLE_SCHEMA.d_internal_organization TRGT
on concat('GROUP~',SRC.resource_pool_id)=TRGT.row_id
and SRC.sourceinstance=TRGT.source_id
where coalesce(TRGT.group_flag,'') <> 'Y'