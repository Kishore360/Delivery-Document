
SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match' 
ELSE 'Data Matched' END AS Message 
FROM (
select count(1) as cnt
 FROM intuit_mdsdb.kb_knowledge_final src
left join intuit_mdwdb.d_kb_knowledge_c tgt
on src.sys_id=tgt.row_id and src.sourceinstance=tgt.source_id
left join intuit_mdwdb.d_lov lkp
 ON ( CONCAT('WORKFLOW_STATE','~','KB_KNOWLEDGE','~','~','~',UPPER(workflow_state)))= lkp.src_rowid 
AND src.sourceinstance= lkp.source_id 
where 
lkp.row_key <> tgt.workflow_state_key
) temp