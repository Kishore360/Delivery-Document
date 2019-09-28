SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT > 0 THEN 'MDS to DWH data validation failed for d_change_failure.install_status_c' ELSE 'SUCCESS' END as Message
FROM 
(
SELECT Count(1) AS CNT 
FROM keybank_mdsdb.change_request_final SRC 
left join keybank_mdsdb.cmdb_ci_final cmdb_ci on cmdb_ci.sys_id=SRC.cmdb_ci
LEFT JOIN keybank_mdwdb.d_change_failure TRGT ON (SRC.sys_id=TRGT.row_id AND SRC.sourceinstance=TRGT.source_id)
WHERE case when cmdb_ci.install_status=1 then 'Installed' when cmdb_ci.install_status=2 then 'On Order'
when cmdb_ci.install_status=3 then 'In Maintenance' when cmdb_ci.install_status=4 then 'Pending Install' when 
cmdb_ci.install_status=5 then 'Pending Repair' when cmdb_ci.install_status=6 then 'In Stock' when cmdb_ci.install_status=7
then 'Retired' when cmdb_ci.install_status=8 then 'Stolen' when cmdb_ci.install_status=100 then 'Absent' else 'UNSPECIFIED' 
end<>TRGT.install_status_c
AND SRC.cdctype='X' ) temp;