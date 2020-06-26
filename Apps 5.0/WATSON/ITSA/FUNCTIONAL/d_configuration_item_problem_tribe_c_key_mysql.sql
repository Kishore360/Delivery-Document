  SELECT CASE WHEN count > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN count > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM(
select count(1) as count from
 select a12.number,a12.u_tribe,a14.row_id,a13.row_id,a12.cmdb_ci,a14.row_key,problem_tribe_c_key from 
  watson_mdsdb.problem_final a12
left join watson_mdwdb.d_tribe_c a14 on a12.u_tribe=a14.row_id and a12.sourceinstance=a14.source_id and a12.cdctype<>'D'
left  JOIN  watson_mdwdb.d_configuration_item a13 ON a13.row_id=a12.cmdb_ci and a12.sourceinstance=a13.source_id
 where coalesce(a14.row_key,case when a12.u_tribe is null then 0 else -1 end)<> a13.problem_tribe_c_key )a;
 
 