select CASE WHEN count(1) THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) THEN 'MDS to DWH data validation failed for d_configuration_item.row_key' ELSE 'SUCCESS' END as Message
from jhi_mdsdb.cmdb_ci_final src join jhi_jira_sb_workdb.ds_configuration_item tgt
on src.sys_id = tgt.row_id and src.sourceinstance = tgt.source_id and tgt.soft_deleted_flag = 'N'
WHERE src.name <> tgt.name;		
		
		
		
		
		
