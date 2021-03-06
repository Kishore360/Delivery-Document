/*This query will pass only in APPS 3.0 version since this was fixed as part of defect 1984 APPS JIRA
If there is a data mismatch failure , please check for the Daylight Savings time of the particular year  and if it falls then 
this is not an issue or data mismatch else investigate.
*/
 select CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN cnt >0 THEN 'MDS to DWH data validation failed for PROBLEM' ELSE 'SUCCESS' END as Message

from
(select count(1) cnt FROM (select * from rei_mdsdb.problem_final where opened_at < closed_at) SRC 
  join rei_mdwdb.f_problem f ON (SRC.sys_id =f.row_id  
 AND SRC.sourceinstance= f.source_id and f.soft_deleted_flag='N' )

JOIN rei_mdwdb.d_lov_map br ON f.state_src_key = br.src_key
AND br.dimension_wh_code in ('CLOSED','RESOLVED') and br.dimension_class = 'STATE~PROBLEM'
JOIN rei_mdwdb.d_problem a ON a.row_key = f.problem_key
AND f.source_id = a.source_id 

WHERE TIMESTAMPDIFF(second,SRC.opened_at,SRC.closed_at)<> f.age

 )A