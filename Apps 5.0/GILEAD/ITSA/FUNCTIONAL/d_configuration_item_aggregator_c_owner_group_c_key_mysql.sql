
SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN cnt >0 THEN 'MDS to DWH data validation failed for f_incident.impact_src_code' 
ELSE 'MDS to DWH data validation passed for f_incident.impact_src_code' END as Message from 
(select count(1) cnt 
FROM gilead_mdsdb.cmdb_ci_final SRC 
JOIN gilead_mdwdb.d_configuration_item_aggregator_c TRGT 
ON SRC.sys_id = TRGT.row_id 
and  SRC.sourceinstance = TRGT.source_id 
left join gilead_mdwdb.d_internal_organization LKP
on  COALESCE(CONCAT('GROUP~',SRC.support_group),'UNSPECIFIED')=LKP.row_id
where coalesce(LKP.row_key,case when SRC.support_group is null then 0 else -1 end ) <> TRGT.owner_group_c_key
and TRGT.current_flag='Y') b
