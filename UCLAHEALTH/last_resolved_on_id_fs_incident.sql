
SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (
select COUNT(*) cnt from(
SELECT A.SYS_ID,B.ROW_ID,
B.  last_resolved_on_id B_last_resolved_on_id ,
case when year <2000 then A.last_resolved_on_id+20000000 else A.last_resolved_on_id 
end as  A_last_resolved_on_id from
(SELECT SYS_ID,sourceinstance, 
DATE_FORMAT(CONVERT_TZ(u_resolved_date,'GMT','America/Los_Angeles'),'%Y')  AS   year,
DATE_FORMAT(CONVERT_TZ(u_resolved_date,'GMT','America/Los_Angeles'),'%Y%m%d')  AS  
last_resolved_on_id
FROM uclahealth_mdsdb.incident_final 
#where sys_id='092bf5f2f547b9c00f4bd5728aaf9afc'
)A
LEFT OUTER JOIN  
(SELECT  DATE_FORMAT(last_resolved_on_id,'%Y%m%d')last_resolved_on_id,source_id,ROW_ID FROM  
uclahealth_workdb.fs_incident
 )B on A.sourceinstance=B.source_id AND B.ROW_ID=SYS_ID)H
WHERE A_last_resolved_on_id<> B_last_resolved_on_id)E;

