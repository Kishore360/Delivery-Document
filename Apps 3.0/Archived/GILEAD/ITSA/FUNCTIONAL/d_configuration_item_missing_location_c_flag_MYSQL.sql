
SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT >0 THEN 'MDS to DWH data validation failed ' ELSE 'SUCCESS' END as Message
FROM (
SELECT count(1) as CNT 
FROM gilead_mdsdb.cmdb_ci_final SRC
-- JOIN (SELECT VALUE,LABEL FROM gilead_mdsdb.sys_choice_final where name='cmdb_ci' and element='operational_status' and language='en' and label='Active' group by value) as op ON op.value= SRC.operational_status
-- JOIN (SELECT VALUE,LABEL FROM gilead_mdsdb.sys_choice_final where name='cmdb_ci' and element='install_status' and language='en' and label='installed' group by value) as ins ON ins.value=SRC.install_status
JOIN gilead_mdwdb.d_configuration_item TRGT ON (SRC.sys_id = TRGT.row_id AND SRC.sourceinstance=TRGT.source_id)
WHERE CASE WHEN SRC.location is null then 'Y' ELSE 'N' END <> TRGT.missing_location_c_flag)temp;