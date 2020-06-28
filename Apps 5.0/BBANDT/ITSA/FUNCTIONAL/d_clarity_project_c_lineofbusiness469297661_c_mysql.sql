
SELECT 
CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for d_clarity_project_c.lineofbusiness469297661_c' ELSE 'SUCCESS' END as Message 
FROM bbandt_mdwdb.d_clarity_project_c trgt
RIGHT JOIN bbandt_mdsdb.bbt_prj_data_qlkview_final src
on src.investment_id = trgt.row_id and src.sourceinstance = trgt.source_id
where trgt.lineofbusiness469297661_c <> src.lineofbusiness469297661