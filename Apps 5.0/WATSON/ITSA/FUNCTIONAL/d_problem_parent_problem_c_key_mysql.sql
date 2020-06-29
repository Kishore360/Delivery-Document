select CASE WHEN cnt>0  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN cnt>0 THEN 'MDS to DWH data validation failed for d_incident.configuration_item_c_key' ELSE 'SUCCESS' END as Message  
 from (
select count(1) cnt  
from watson_mdsdb.problem_final src 
left join  watson_mdwdb.f_problem trg on trg.row_id=src.sys_id
left join watson_mdwdb.d_problem  lkp on src.parent=lkp.row_id
WHERE COALESCE(lkp.row_key,CASE WHEN src.parent IS NULL THEN 0 else '-1' end)<> trg.parent_problem_c_key)a;