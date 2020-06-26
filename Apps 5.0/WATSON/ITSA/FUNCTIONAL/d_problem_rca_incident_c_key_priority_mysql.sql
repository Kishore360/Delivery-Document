  SELECT CASE WHEN count > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN count > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM(
select count(1) as count from
  watson_mdsdb.incident_final a12
  left join watson_mdwdb.d_incident  a14 on a12.sys_id=a14.row_id and a12.sourceinstance=a14.source_id and a12.cdctype<>'D'
  left join watson_mdwdb.d_lov d on a12.priority=d.row_id and  d.dimension_class='PRIORITY~RCA_INCIDENT'
left  JOIN  watson_mdwdb.d_problem a13 ON a13.row_id=a12.cmdb_ci and a12.sourceinstance=a13.source_id
 where coalesce(a14.row_key,case when a12.priority is null then 0 else -1 end)<> a13.rca_incident_c_key )a;
 
 