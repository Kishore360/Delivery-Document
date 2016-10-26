

SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (

select count(1) from 
svb_mdwdb.d_task_sla stg
JOIN svb_mdsdb.contract_sla_final csd ON stg.row_id = csd.sys_id 
 AND stg.source_id = csd.sourceinstance
where  stg.type_c <> upper(csd.type))abc


