
 SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN cnt >0 THEN 'MDS to DWH data validation failed for f_problem_region_list_c.pivot_date' ELSE 'SUCCESS' END as Message from ( select count(1) cnt from (
 select a.number,u_incident_response,
 case when  (u_incident_response is null or u_incident_response= (0)) then 'N' else 'Y' end a ,incident_response_flag_c b
 from ibmwatson_mdsdb.problem_task_final a
 join ibmwatson_mdwdb.d_problem_task d on d.row_id=a.sys_id and d.source_id=a.sourceinstance)a
 where a<>b)v;
 
 
 