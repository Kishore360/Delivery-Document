select  CASE WHEN count(1) THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) THEN 'MDS to DWH data validation failed for d_configuration_item.row_key' ELSE 'SUCCESS' END as Message
from  jhi_mdsdb.cmdb_ci_final src 
left join jhi_jira_sb_workdb.ds_configuration_item tgt
on src.sys_id = tgt.row_id and src.sourceinstance = tgt.source_id and tgt.soft_deleted_flag = 'N'
join jhi_jira_sb_workdb.d_lov lov
on tgt.install_status_src_c_id = lov.row_id
where lov.dimension_class = 'INSTALL_STATUS~CMDB_CI'
and src.install_status <> lov.dimension_code ; 				
					
					
					
					
					
					
					
					
