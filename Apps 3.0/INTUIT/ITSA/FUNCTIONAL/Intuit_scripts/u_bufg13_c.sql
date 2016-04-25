SELECT CASE
           WHEN cnt > 0 THEN 'FAILURE'
           ELSE 'SUCCESS'
       END AS RESULT,
       CASE
           WHEN cnt > 0 THEN 'Data did not Match for column u_bufg13_c'
           ELSE 'Data Matched for column u_bufg13_c'
       END AS Message
FROM
  (SELECT count(*) cnt
   FROM intuit_mdsdb.cmdb_ci_final a
   INNER JOIN intuit_workdb.dwh_d_configuration_item b ON a.sys_id COLLATE utf8_unicode_ci = b.row_id 
   #and a.sourceinstance=b. source_id and b.row_key < 500
   LEFT OUTER JOIN intuit_mdsdb.u_bufg_final c ON coalesce(a.u_bufg_l3 COLLATE utf8_unicode_ci) = c.sys_id
   WHERE CASE WHEN a.u_bufg_l3 IS NULL THEN '0' ELSE CASE WHEN c.sys_id IS NULL THEN '-1' ELSE c.u_name END END COLLATE utf8_unicode_ci <> b.u_bufg13_c)A;