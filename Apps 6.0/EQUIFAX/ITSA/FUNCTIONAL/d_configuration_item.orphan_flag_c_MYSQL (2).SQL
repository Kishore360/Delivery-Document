SELECT 
CASE WHEN cnt>0  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN cnt>0  THEN 'MDS to DWH data validation failed for d_onfiguration_item.orphan_flag_c' ELSE 'SUCCESS' END as Message 
FROM 
(select count(1)  as cnt from 
 equifax_mdwdb.d_configuration_item TRGT 
 right join equifax_mdsdb.cmdb_rel_ci_final SRC
 on (TRGT.row_id=SRC.parent and TRGT.source_id=SRC.sourceinstance)
 right join equifax_mdsdb.cmdb_rel_ci_final SRC1
 on (TRGT.row_id=SRC1.child and TRGT.source_id=SRC1.sourceinstance)
 where case when SRC.sys_id is null and SRC1.sys_id is null then 'Y' ELSE 'N' END<>TRGT.orphan_flag_c and SRC.cdctype<>'D'
)temp; 

