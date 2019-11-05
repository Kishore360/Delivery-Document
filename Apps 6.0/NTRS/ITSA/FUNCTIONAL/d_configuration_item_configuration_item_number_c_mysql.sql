SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT > 0 THEN 'MDS to DWH data validation failed for d_change_request.u_expedite_reason_details_c' ELSE 'SUCCESS' END as Message
FROM 
(Select count(1) CNT
FROM ntrust_mdsdb.incident_final SRC
left join ntrust_mdsdb.cmdb_ci_final LKP on SRC.cmdb_ci=LKP.sys_id and SRC.sourceinstance=LKP.sourceinstance
join  ntrust_mdwdb.d_configuration_item c on LKP.sys_id=c.row_id and LKP.sourceinstance=c.source_id
join ntrust_mdwdb.d_incident d
on SRC.sys_id=d.row_id and SRC.sourceinstance=d.source_id
where LKP.u_number<>c.configuration_item_number_c)temp