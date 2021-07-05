select CASE WHEN cnt THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN cnt THEN 'MDS to DWH data validation failed for f_incident.dormancy_age' ELSE 'SUCCESS' END as Message from ( select count(1) cnt 
 FROM

mcd_mdwdb.d_incident d_inc
JOIN mcd_mdwdb.f_incident f_inc
ON d_inc.row_id = f_inc.row_id and d_inc.source_id = f_inc.source_id
where 
kb_article_used_count_c <> CASE WHEN d_inc.knowledge_used_c_flag = 'Y' THEN 1 ELSE 0 END)a

