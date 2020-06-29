  SELECT CASE WHEN count > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN count > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM(
select count(1) as count from
  watson_mdsdb.incident_final a12
  left join watson_mdwdb.d_incident  a14 on a12.sys_id=a14.row_id and a12.sourceinstance=a14.source_id and a12.cdctype<>'D'
  where environment_list_c<>u_environment)a;
  
  