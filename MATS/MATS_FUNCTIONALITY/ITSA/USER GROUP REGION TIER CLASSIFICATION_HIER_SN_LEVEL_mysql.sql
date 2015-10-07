SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message  from
(
select count(*) as cnt from(select * from (SELECT CONCAT(a.s0,'~1~USER GROUP REGION TIER CLASSIFICATION') AS s_row_id,
a.s0 AS s_lev_0_id,IFNULL(level_0.row_key ,0) AS s_lev_0_key,
a.s1 AS s_lev_1_id,IFNULL(level_1.row_key ,0) AS s_lev_1_key,
a.s2 AS s_lev_2_id,IFNULL(level_2.row_key ,0) AS s_lev_2_key,
a.s3 AS s_lev_3_id,IFNULL(level_3.row_key ,0) AS s_lev_3_key,
a.s4 AS s_lev_4_id,IFNULL(level_4.row_key ,0) AS s_lev_4_key,
a.s5 AS s_lev_5_id,IFNULL(level_5.row_key ,0) AS s_lev_5_key
FROM 
(SELECT lev_0.sys_id AS s0,lev_0.sys_id AS  m0,'OTHERS'AS s1,lev_1.sys_id AS m1,lev_2.sys_id AS s2,lev_2.sys_id AS m2,lev_3.sys_id AS s3,
lev_3.sys_id AS m3,lev_4.sys_id AS s4,lev_4.sys_id AS m4,lev_5.sys_id AS s5,lev_5.sys_id AS m5
FROM cardinalhealth_mdsdb.sys_user_group_final lev_0
LEFT JOIN cardinalhealth_mdsdb.sys_user_group_final lev_1
ON('OTHERS' = lev_1.sys_id)
LEFT JOIN cardinalhealth_mdsdb.sys_user_group_final lev_2
ON('OTHERS' = lev_2.sys_id)
LEFT JOIN cardinalhealth_mdsdb.sys_user_group_final lev_3
ON('OTHERS' = lev_3.sys_id)
LEFT JOIN cardinalhealth_mdsdb.sys_user_group_final lev_4
ON('OTHERS' = lev_4.sys_id)
LEFT JOIN cardinalhealth_mdsdb.sys_user_group_final lev_5
ON('OTHERS' = lev_5.sys_id)
)a
LEFT JOIN  cardinalhealth_mdwdb.d_internal_organization level_0
ON a.s0 = right(level_0.row_id,32)
LEFT JOIN  cardinalhealth_mdwdb.d_internal_organization level_1
ON a.s1 = right(level_1.row_id,32)
LEFT JOIN  cardinalhealth_mdwdb.d_internal_organization level_2
ON a.s2 = right(level_2.row_id,32)
LEFT JOIN  cardinalhealth_mdwdb.d_internal_organization level_3
ON a.s3 = right(level_3.row_id,32)
LEFT JOIN  cardinalhealth_mdwdb.d_internal_organization level_4
ON a.s4 = right(level_4.row_id,32)
LEFT JOIN  cardinalhealth_mdwdb.d_internal_organization level_5
ON a.s5 = right(level_5.row_id,32) )AA
left JOIN
(SELECT row_id,lev_0_id,lev_0_key,lev_1_id,lev_1_key,lev_2_id,lev_2_key,
lev_3_id,lev_3_key,lev_4_id,lev_4_key,lev_5_id,lev_5_key,source_id
FROM cardinalhealth_mdwdb.d_h_all_hierarchies
WHERE hierarchy_class ='USER GROUP REGION TIER CLASSIFICATION'  )BB
on AA.s_row_id=BB.row_id
WHERE AA.s_lev_0_key<>BB.lev_0_key
OR AA.s_lev_1_key<>BB.lev_1_key
OR AA.s_lev_2_key<>BB.lev_2_key
OR AA.s_lev_3_key<>BB.lev_3_key
OR AA.s_lev_4_key<>BB.lev_4_key
OR AA.s_lev_5_key<>BB.lev_5_key 
)ds
)a