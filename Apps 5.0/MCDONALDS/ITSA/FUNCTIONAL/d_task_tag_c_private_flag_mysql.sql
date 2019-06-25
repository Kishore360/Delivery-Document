SELECT CASE WHEN cnt>0  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN cnt>0  THEN 'MDS to DWH data validation failed for d_task_tag_c.private_flag' ELSE 'SUCCESS' END as Message
FROM (select count(1) as cnt from(select sys_id, sourceinstance, cdctime,label from mcdonalds_mdsdb.label_entry_final )  src      
LEFT JOIN (select sys_id,name ,sourceinstance from mcdonalds_mdsdb.label_final ) lf ON src.label = lf.sys_id 
Left join mcdonalds_mdwdb.d_task_tag_c  trgt on src.sys_id=trgt.row_id and src.sourceinstance=trgt.source_id
left join (select source_id,max(lastupdated) as lastupdated from mcdonalds_mdwdb.d_o_data_freshness group by source_id) f1 on (f1.source_id = src.sourceinstance)
where (src.cdctime<=f1.lastupdated) and CASE WHEN  lf.name like '%[private]%' THEN 'Y' ELSE 'N' END <> trgt.private_flag) temp;