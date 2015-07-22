SELECT CaSE WHEN cnt > 0 THEN 'FaILURE' ELSE 'SUCCESS' END aS Result
,CaSE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END aS Message 
FROM (
select count(1) as cnt  from svb_workdb.ds_configuration_item b
 inner  JOIN  svb_mdsdb.cmdb_ci_appl a
on  b.ROW_ID=SYS_ID and sourceinstance=b.source_id
 where a.u_is_core_application<> b.core_application_flag_c)c