select CASE WHEN cnt>0  THEN 'MDS to DWH data validation failed for d_configuration_item.ownership_complaint_flag_c' ELSE 'SUCCESS' END as Message 
FROM 
(
select count(1) as CNT  from 
equifax_mdsdb.cmdb_ci_final SRC
 left join equifax_mdwdb.d_configuration_item TRGT 
 on(SRC.sys_id=TRGT.row_id and SRC.sourceinstance=TRGT.source_id) and SRC.cdctype<>'D'
where CASE when (TRGT.ci_owner_group_c_key ='UNSPECIFIED'
OR TRGT.ci_support_group_c_key ='UNSPECIFIED' OR TRGT.ci_change_control_c_key ='UNSPECIFIED' ) then 'N' ELSE 'Y' end<>TRGT.ownership_complaint_flag_c
and SRC.cdctype<>'D' and TRGT.soft_deleted_flag='N')temp;

