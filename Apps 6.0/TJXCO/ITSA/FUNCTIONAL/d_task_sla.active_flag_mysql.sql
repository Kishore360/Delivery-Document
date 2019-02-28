SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN cnt >0 THEN 'MDS to DWH data validation failed for d_task_sla.active_flag' ELSE 'SUCCESS' END as Message
 FROM (select count(1) as cnt from ( SELECT * FROM tjxco_mdsdb.contract_sla_final WHERE CDCTYPE<>'D') SRC 
 LEFT JOIN tjxco_mdwdb.d_task_sla TRGT 
 ON (SRC.sys_id=TRGT.row_id 
 AND SRC.sourceinstance=TRGT.source_id )
 WHERE coalesce(case when SRC.active=1 then 'Y' when SRC.active=0 then 'N' end, 'UNSPECIFIED') <>TRGT.active_flag) temp;