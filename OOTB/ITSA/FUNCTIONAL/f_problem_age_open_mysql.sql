/*This query will pass only in APPS 3.0 version since this was fixed as part of defect 1984 APPS JIRA
If there is a data mismatch failure , please check for the Daylight Savings time of the particular year  and if it falls then 
this is not an issue or data mismatch else investigate.
*/
 select CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN cnt >0 THEN 'MDS to DWH data validation failed for PROBLEM' ELSE 'SUCCESS' END as Message

from
(select count(1) cnt FROM (select * from <<tenant>>_mdsdb.problem_final where opened_at < closed_at) SRC 
  join <<tenant>>_mdwdb.f_problem f ON (SRC.sys_id =f.row_id  
 AND SRC.sourceinstance= f.source_id and f.soft_deleted_flag='N' )

JOIN <<tenant>>_mdwdb.d_lov_map br ON f.state_src_key = br.src_key
AND br.dimension_wh_code = 'OPEN' and br.dimension_class = 'STATE~PROBLEM'
JOIN <<tenant>>_mdwdb.d_problem a ON a.row_key = f.problem_key
AND f.source_id = a.source_id 

WHERE TIMESTAMPDIFF(DAY,SRC.opened_at,(SELECT CONVERT_TZ(MAX(lastupdated),<<DW_TARGET_TIME_ZONE>>,<<TENANT_SSI_TIME_ZONE>>) AS lastupdated

FROM <<tenant>>_mdwdb.d_o_data_freshness WHERE sourcename like 'ServiceNow%'))<> f.age

 )A