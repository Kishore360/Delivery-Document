 SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (
select count(1) as cnt 
from 
svb_mdwdb.d_task_sla TGT
join svb_mdsdb.contract_sla_final SRC
ON TGT.row_id = SRC.sys_id
AND TGT.source_id = SRC.sourceinstance
where  upper(SRC.type)	<>TGT.type_c

 )c
		