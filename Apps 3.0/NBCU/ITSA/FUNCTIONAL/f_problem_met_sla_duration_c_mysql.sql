SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (
select count(*) as cnt from (
select
count(1) as cnt
FROM nbcu_mdwdb.f_problem d_inc
LEFT JOIN nbcu_mdsdb.task_sla_final tsf ON tsf.TASK = d_inc.row_id and tsf.sourceinstance=d_inc.source_id
JOIN
  (SELECT Max(a.planned_end_time) planned_end_time,
          a.TASK AS TASK,
a.sourceinstance
   FROM nbcu_mdsdb.task_sla_final a
   JOIN
     (SELECT sys_id,
             collection 
      FROM nbcu_mdsdb.contract_sla_final) b ON a.sla = b.sys_id
   WHERE b.collection = 'problem'
     AND a.stage <> 'Cancelled'
        GROUP BY a.TASK) AA ON tsf.TASK = AA.TASK
AND tsf.planned_end_time = AA.planned_end_time
GROUP BY tsf.TASK
HAVING 
      max(timestampdiff(SECOND, '1970-01-01 00:00:00',tsf.duration))
<> max(d_inc.met_sla_duration_c))a)a