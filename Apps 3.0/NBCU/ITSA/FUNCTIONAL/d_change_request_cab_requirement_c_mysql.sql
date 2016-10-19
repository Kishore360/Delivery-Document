SET group_concat_max_len = 10000;
SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match' 
ELSE 'Data Matched' END AS Message 
FROM (
select count(1) as cnt from
(
select iname,c.cab_requirement_c,number from
(
SELECT crd.sys_id AS row_id,number,
   crd.sourceinstance AS source_id,Replace(GROUP_CONCAT(coalesce(user_group.name,'UNSPECIFIED')),'UNSPECIFIED,','') iname
  FROM nbcu_mdsdb.change_request_final crd
  left JOIN
    
    (SELECT a.N + b.N * 10 + 1 AS n
  FROM
    (SELECT 0 AS N UNION ALL SELECT 1 UNION ALL SELECT 2 UNION ALL SELECT 3 UNION ALL SELECT 4 UNION ALL SELECT 5 UNION ALL SELECT 6 UNION ALL SELECT 7 UNION ALL SELECT 8 UNION ALL SELECT 9) a,
    (SELECT 0 AS N UNION ALL SELECT 1 UNION ALL SELECT 2 UNION ALL SELECT 3 UNION ALL SELECT 4 UNION ALL SELECT 5 UNION ALL SELECT 6 UNION ALL SELECT 7 UNION ALL SELECT 8 UNION ALL SELECT 9) b
  ORDER BY n) 
     n
   ON n.n <= 1 + (length(trim(crd.u_cab_requirement)) - length(replace(trim(crd.u_cab_requirement), ',', '')))
   LEFT JOIN nbcu_mdsdb.sys_user_group_final user_group 
    ON substring_index(substring_index(trim(crd.u_cab_requirement), ',', n.n), ',', -1) = user_group.sys_id

   GROUP BY 1,2 order by row_id)d
left join nbcu_mdwdb.d_change_request c 
on c.row_id=d.row_id
where iname<>c.cab_requirement_c
 ) a)a