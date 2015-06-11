SELECT CONCAT(a.s0,'~1~USER GROUP REGION TIER CLASSIFICATION') AS row_id,
a.s0 AS lev_0_id,IFNULL(level_0.row_key ,0) AS lev_0_key,
a.s1 AS lev_1_id,IFNULL(level_1.row_key ,0) AS lev_1_key,
a.s2 AS lev_2_id,IFNULL(level_2.row_key ,0) AS lev_2_key,
a.s3 AS lev_3_id,IFNULL(level_3.row_key ,0) AS lev_3_key,
a.s4 AS lev_4_id,IFNULL(level_4.row_key ,0) AS lev_4_key,
a.s5 AS lev_5_id,IFNULL(level_5.row_key ,0) AS lev_5_key
FROM 
(SELECT lev_0.sys_id AS s0,lev_0.sys_id AS  m0,'OTHERS'AS s1,lev_1.sys_id AS m1,lev_2.sys_id AS s2,lev_2.sys_id AS m2,lev_3.sys_id AS s3,
lev_3.sys_id AS m3,lev_4.sys_id AS s4,lev_4.sys_id AS m4,lev_5.sys_id AS s5,lev_5.sys_id AS m5
FROM #MDS_TABLE_SCHEMA.sys_user_group_final lev_0
LEFT JOIN #MDS_TABLE_SCHEMA.sys_user_group_final lev_1
ON('OTHERS' = lev_1.sys_id)
LEFT JOIN #MDS_TABLE_SCHEMA.sys_user_group_final lev_2
ON('OTHERS' = lev_2.sys_id)
LEFT JOIN #MDS_TABLE_SCHEMA.sys_user_group_final lev_3
ON('OTHERS' = lev_3.sys_id)
LEFT JOIN #MDS_TABLE_SCHEMA.sys_user_group_final lev_4
ON('OTHERS' = lev_4.sys_id)
LEFT JOIN #MDS_TABLE_SCHEMA.sys_user_group_final lev_5
ON('OTHERS' = lev_5.sys_id)
)a
LEFT JOIN  #TABLE_SCHEMA.d_internal_organization level_0
ON CONVERT(a.s0 USING utf8) = CONVERT(level_0.row_id USING utf8)
LEFT JOIN  #TABLE_SCHEMA.d_internal_organization level_1
ON CONVERT(a.s1 USING utf8) = CONVERT(level_1.row_id USING utf8)
LEFT JOIN  #TABLE_SCHEMA.d_internal_organization level_2
ON CONVERT(a.s2 USING utf8) = CONVERT(level_2.row_id USING utf8)
LEFT JOIN  #TABLE_SCHEMA.d_internal_organization level_3
ON CONVERT(a.s3 USING utf8) = CONVERT(level_3.row_id USING utf8)
LEFT JOIN  #TABLE_SCHEMA.d_internal_organization level_4
ON CONVERT(a.s4 USING utf8) = CONVERT(level_4.row_id USING utf8)
LEFT JOIN  #TABLE_SCHEMA.d_internal_organization level_5
ON CONVERT(a.s5 USING utf8) = CONVERT(level_5.row_id USING utf8) ;



SELECT row_id,lev_0_id,lev_0_key,lev_1_id,lev_1_key,lev_2_id,lev_2_key,
lev_3_id,lev_3_key,lev_4_id,lev_4_key,lev_5_id,lev_5_key,source_id
FROM #TABLE_SCHEMA.dh_all_hierarchies
WHERE hierarchy_class ='USER GROUP REGION TIER CLASSIFICATION' ;