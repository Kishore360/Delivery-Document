SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'MDS to DWH row count failed for d_resource_roles.soft_deleted_flag' ELSE 'SUCCESS' END as Message
from (select *from  #MDS_TABLE_SCHEMA.hp_rsc_roles_nls_final where cdctype<>'D') SRC
left join  #DWH_TABLE_SCHEMA.d_resource_role TRGT
on SRC.ROLE_ID=TRGT.row_id
and SRC.sourceinstance=TRGT.source_id
WHERE COALESCE(CASE WHEN SRC.cdctype='D' THEN 'Y' ELSE 'N' END,'') <> COALESCE(TRGT.soft_deleted_flag ,'')