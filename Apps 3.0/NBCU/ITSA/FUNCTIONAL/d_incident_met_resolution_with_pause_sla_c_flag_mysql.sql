SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (
select count(*) as cnt from (
select
count(1) as cnt
FROM nbcu_mdwdb.d_incident d_inc
LEFT JOIN nbcu_mdsdb.task_sla_final tsf ON tsf.TASK = d_inc.row_id
JOIN
  (SELECT Max(a.planned_end_time) planned_end_time,
          a.TASK AS TASK,
          b.name AS name
   FROM nbcu_mdsdb.task_sla_final a
   JOIN
     (SELECT sys_id,
             collection,
             CASE WHEN name LIKE '%Resolution%(With Pause)%' THEN 'Resolution With Pause' WHEN name LIKE '%Resolution%(No Pause)%' THEN 'Resolution Without Pause' WHEN name LIKE '%Response%' THEN 'Response'  END AS name
      FROM nbcu_mdsdb.contract_sla_final) b ON a.sla = b.sys_id
   WHERE b.collection = 'incident'
     AND a.stage <> 'Cancelled'
        GROUP BY a.TASK,
            b.name) AA ON tsf.TASK = AA.TASK
AND tsf.planned_end_time = AA.planned_end_time
GROUP BY tsf.TASK
HAVING iF(SUM(CASE WHEN tsf.has_breached = 1 THEN 0 ELSE 1 END) > 0
      AND max(AA.name) = 'Resolution With Pause', 'Y', 'N') <> SUM(d_inc.met_resolution_with_pause_sla_c_flag))a)a
