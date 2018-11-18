SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'MDS to DWH row count failed for d_resource_roles.role_name' ELSE 'SUCCESS' END as Message
from (select *from  fidelity_mdsdb.hp_rsc_resource_roles_final) SRC
inner join (select *from  fidelity_mdsdb.hp_rsc_roles_nls_final) SRC1
on SRC.role_id=SRC1.role_id
left join  fidelity_mdwdb.d_resource_role TRGT
on Concat(SRC.resource_id,'~',SRC.role_id)=TRGT.row_id
and SRC.sourceinstance=TRGT.source_id
where coalesce(SRC.role_name,'')<>coalesce(TRGT.role_name,'')