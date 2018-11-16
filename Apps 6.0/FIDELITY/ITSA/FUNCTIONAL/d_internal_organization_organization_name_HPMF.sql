SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'MDS to DWH row count failed for d_internal_organization.organization_name' ELSE 'SUCCESS' END as Message
 from (select * from  fidelity_mdsdb.hp_rsc_resource_pools_final) SRC
left join fidelity_mdwdb.d_internal_organization TRGT
on concat('GROUP~',SRC.resource_pool_id)=TRGT.row_id
and SRC.sourceinstance=TRGT.source_id
where coalesce(SRC.RESOURCE_POOL_NAME,'')<>coalesce(TRGT.organization_name,'')