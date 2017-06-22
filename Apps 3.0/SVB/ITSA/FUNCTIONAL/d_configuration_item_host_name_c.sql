 SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (
select count(1) as cnt 
from 
svb_mdwdb.d_configuration_item c
join svb_mdsdb.cmdb_ci_final cfid
on  c.ROW_ID = cfid.sys_id and cfid.sourceinstance=c.source_id
left join svb_mdsdb.cmdb_ci_server_final cs
on c.row_id = cs.sys_id and c.source_id= cs.sourceinstance
left join svb_mdsdb.cmdb_ci_hardware_final ch
on c.row_id = ch.sys_id and c.source_id= ch.sourceinstance
left join svb_mdsdb.cmdb_ci_rack_final cr
on ch.u_rack = cr.sys_id and ch.sourceinstance= cr.sourceinstance
left join svb_mdsdb.cmdb_ci_computer_final cc
on c.row_id = cc.sys_id and c.source_id= cc.sourceinstance
left join svb_mdsdb.cmdb_model_final cmf
on cmf.sys_id=cfid.model_id and cmf.sourceinstance=cfid.sourceinstance
where  cs.host_name<>c.host_name_c

 )c
