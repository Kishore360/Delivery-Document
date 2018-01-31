SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for d_incident.u_fcr_check' ELSE 'SUCCESS' END as Message 
from rogersdev_mdwdb.d_configuration_item a
left JOIN               
(
SELECT ci.sys_id,ci.sourceinstance,COALESCE(ser.classification,middle.u_component_criticality,appl.u_component_criticality,'UNSPECIFIED') as u_component_criticality 
from rogersdev_mdsdb.cmdb_ci_final ci
left join rogersdev_mdsdb.cmdb_ci_server_final ser
on ci.sys_id = ser.sys_id and ci.sourceinstance = ser.sourceinstance
  left join rogersdev_mdsdb.u_cmdb_ci_middleware_final middle
on ci.sys_id = middle.sys_id and ci.sourceinstance = middle.sourceinstance
   left join rogersdev_mdsdb.cmdb_ci_appl_final appl
on ci.sys_id = appl.sys_id and ci.sourceinstance = appl.sourceinstance

) c          
 ON a.row_id = c.sys_id and a.source_id = c.sourceinstance
where 
c.u_component_criticality<> a.component_criticality_c
