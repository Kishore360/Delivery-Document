SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT > 0 THEN 'MDS to DWH data validation failed for d_configuration_item.incident_dr_tier_src_c_key' ELSE 'SUCCESS' END as Message
FROM 
(Select count(1) CNT
FROM  ntrust_mdsdb.incident_final inc
join ntrust_mdsdb.cmdb_ci_final SRC on inc.cmdb_ci=SRC.sys_id and inc.sourceinstance=SRC.sourceinstance
LEFT JOIN ntrust_mdwdb.d_configuration_item TRGT2 ON (SRC.sys_id=TRGT2.row_id AND SRC.sourceinstance=TRGT2.source_id)
Left JOIN ntrust_mdwdb.d_lov LKP ON CONCAT('DR_TIER_SRC_C~CMDB_CI','~',UPPER(SRC.u_dr_tier))=LKP.row_id   AND SRC.sourceinstance=LKP.source_id
where case when SRC.u_dr_tier is NULL then 0 else coalesce(LKP.row_key,-1) end <> TRGT2.incident_dr_tier_src_c_key and SRC.cdctype='X') temp;