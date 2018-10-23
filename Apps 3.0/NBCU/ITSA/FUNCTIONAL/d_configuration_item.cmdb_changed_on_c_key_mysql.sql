SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT > 0 THEN 'MDS to DWH data validation failed for d_configuration_item.name' ELSE 'SUCCESS' END as Message
FROM
(Select count(1) as CNT   from (select sys_id, sourceinstance ,sys_updated_on from nbcu_mdsdb.cmdb_ci_final) SRC
 join nbcu_mdwdb.d_configuration_item TRGT on SRC.sys_id=TRGT.row_id and SRC.sourceinstance=TRGT.source_id
 left join nbcu_mdwdb.d_calendar_date cal  on DATE_FORMAT(TRGT.changed_on,'%Y%m%d') =cal.row_id
 where TRGT.cmdb_changed_on_c_key <> 
 coalesce(cal.row_key, case when SRC.sys_updated_on is null then 0 else -1 end)) temp;