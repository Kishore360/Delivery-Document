SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'Failure' ELSE 'Data Matched' END as Message 
from 
(select sys_id,sourceinstance,u_knowledge_group  from pdchs_mdsdb.kb_knowledge_final where CDCTYPE<>'D') b
left JOIN  pdchs_mdwdb.f_kb_knowledge_c trgt
on b.sys_id = trgt.row_id and b.sourceinstance = trgt.source_id
LEFT JOIN pdchs_mdwdb.d_internal_organization e 
ON COALESCE(concat('GROUP~',b.u_knowledge_group),'UNSPECIFIED') = e.row_id 
AND b.sourceinstance = e.source_id
where COALESCE(e.row_key,case when b.u_knowledge_group is null then 0  ELSE -1 END) <> trgt.knowledge_group_c_key;