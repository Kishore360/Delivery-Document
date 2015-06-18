SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (
select count(1) as cnt from(
SELECT A.SYS_ID,B.ROW_ID,A.  category_src_code A_category_src_code,B.  category_src_code B_category_src_code FROM
(SELECT SYS_ID,sourceinstance,   
case when u_category =1 then 'Y' else 'N' end as category_src_code
FROM uclahealth_mdsdb.incident_final)A
LEFT OUTER JOIN  
(SELECT  category_src_code,source_id,ROW_ID FROM  uclahealth_workdb.fs_incident
 )B on A.sourceinstance=B.source_id AND B.ROW_ID=SYS_ID)H
WHERE A_category_src_code <> B_category_src_code)E;