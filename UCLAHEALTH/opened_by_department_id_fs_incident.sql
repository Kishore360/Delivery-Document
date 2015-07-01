SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (
select count(1) as cnt from(
SELECT A.SYS_ID,B.ROW_ID,CONCAT('DEPARTMENT~',A.  opened_by_department_id) A_opened_by_department_id,B.  opened_by_department_id B_opened_by_department_id FROM
(SELECT x.SYS_ID,x.sourceinstance, c.department  AS   opened_by_department_id
FROM uclahealth_mdsdb.incident_final x,uclahealth_mdsdb.sys_user_final c where x.u_requested_for=c.sys_id)A
 JOIN  
(SELECT   opened_by_department_id  AS opened_by_department_id ,source_id,ROW_ID 
FROM  uclahealth_workdb.fs_incident
 )B on A.sourceinstance=B.source_id AND B.ROW_ID=SYS_ID)H
WHERE A_opened_by_department_id<> B_opened_by_department_id)E;