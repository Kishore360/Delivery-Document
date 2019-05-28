
SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN cnt >0 THEN 'MDS to DWH data validation failed for f_incident.impact_src_code' 
ELSE 'MDS to DWH data validation passed for f_incident.impact_src_code' END as Message from 
(select count(1) cnt 
FROM gilead_mdsdb.cmdb_ci_final SRC 
JOIN gilead_mdwdb.d_configuration_item_aggregator_c TRGT 
ON SRC.sys_id = TRGT.row_id 
and  SRC.sourceinstance = TRGT.source_id 
join
gilead_mdwdb.d_lov LKP
on  COALESCE(CONCAT('OPERATIONAL_STATUS_C~CONFIGURATION_ITEM','~~~',UPPER(SRC.operational_status)),'UNSPECIFIED')=LKP.row_id
where coalesce(LKP.row_key,case when SRC.operational_status is null then 0 else -1 end ) <> TRGT.operational_status_src_c_key) b
