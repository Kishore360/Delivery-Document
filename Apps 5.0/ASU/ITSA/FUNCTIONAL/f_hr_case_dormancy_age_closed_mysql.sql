SELECT 
CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result,
CASE WHEN cnt > 0 THEN 'Data did not Match' 
ELSE 'Data Matched' END AS Message 
FROM (
select count(1) cnt  FROM asu_mdsdb.hr_case_final SRC 
join asu_mdwdb.f_hr_case f ON (SRC.sys_id =f.row_id  AND SRC.sourceinstance= f.source_id  )
JOIN asu_mdwdb.d_hr_case a ON a.row_key = f.hr_case_c_key AND f.source_id = a.source_id
JOIN asu_mdwdb.d_lov_map br ON a.state_src_key = br.src_key
AND br.dimension_wh_code IN ('CLOSED','RESOLVED')
WHERE
0 <> f.dormancy_age
)A