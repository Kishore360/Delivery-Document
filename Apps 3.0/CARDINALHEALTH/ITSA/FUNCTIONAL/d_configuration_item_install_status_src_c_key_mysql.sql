
SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_problem.cause_unplanned_delivery_src_c_key' ELSE 'SUCCESS' END as Message
from  cardinalhealth_mdsdb.cmdb_ci_final a
  join  cardinalhealth_mdwdb.d_configuration_item a18  on a.sys_id=a18.row_id and a.sourceinstance=a18.source_id
join cardinalhealth_mdwdb.f_incident a119 on a18.row_key=a119.configuration_item_key and a119.soft_deleted_flag='N'
 JOIN cardinalhealth_mdwdb.d_lov LKP 
 ON  coalesce(concat('INSTALL_STATUS_C~CMDB_CI_APPLICATION','~','~','~',upper(a.install_status)),'UNSPECIFIED')= LKP.src_rowid
where coalesce(LKP.row_key,case when a.install_status is null then 0 else -1 end) <> a18.install_status_src_c_key


;

