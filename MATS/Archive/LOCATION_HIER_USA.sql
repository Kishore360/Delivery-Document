SELECT CONCAT(a.s0,'~-1~LOCATION') AS row_id,
a.s0 AS lev_0_id,IFNULL(level_0.row_key ,CASE WHEN a.s0 IS NULL THEN 0 ELSE -1 END) AS lev_0_key,
a.s1 AS lev_1_id,IFNULL(level_1.row_key ,CASE WHEN a.s1 IS NULL THEN 0 ELSE -1 END) AS lev_1_key,
a.s2 AS lev_2_id,IFNULL(level_2.row_key ,CASE WHEN a.s2 IS NULL THEN 0 ELSE -1 END) AS lev_2_key,
a.s3 AS lev_3_id,IFNULL(level_3.row_key ,CASE WHEN a.s3 IS NULL THEN 0 ELSE -1 END) AS lev_3_key,
a.s4 AS lev_4_id,IFNULL(level_4.row_key ,CASE WHEN a.s4 IS NULL THEN 0 ELSE -1 END) AS lev_4_key,
a.s5 AS lev_5_id,IFNULL(level_5.row_key ,CASE WHEN a.s5 IS NULL THEN 0 ELSE -1 END) AS lev_5_key
FROM 
(SELECT lev_0.row_id AS s0,lev_0.parent_row_id AS  m0,lev_1.row_id AS s1,lev_1.parent_row_id AS m1,lev_2.row_id AS s2,lev_2.parent_row_id AS m2,lev_3.row_id AS s3,
lev_3.parent_row_id AS m3,lev_4.row_id AS s4,lev_4.parent_row_id AS m4,lev_5.row_id AS s5,lev_5.parent_row_id AS m5
FROM apps_i6_mdsdb.us_d_location_final lev_0
LEFT JOIN apps_i6_mdsdb.us_d_location_final lev_1
ON(lev_0.parent_row_id = lev_1.row_id)
LEFT JOIN apps_i6_mdsdb.us_d_location_final lev_2
ON(lev_1.parent_row_id = lev_2.row_id)
LEFT JOIN apps_i6_mdsdb.us_d_location_final lev_3
ON(lev_2.parent_row_id = lev_3.row_id)
LEFT JOIN apps_i6_mdsdb.us_d_location_final lev_4
ON(lev_3.parent_row_id = lev_4.row_id)
LEFT JOIN apps_i6_mdsdb.us_d_location_final lev_5
ON(lev_4.parent_row_id = lev_5.row_id)
)a
LEFT JOIN  apps_i6_workdb.d_location level_0
ON CONVERT(a.s0 USING utf8) = CONVERT(level_0.row_id USING utf8)
LEFT JOIN  apps_i6_workdb.d_location level_1
ON CONVERT(a.s1 USING utf8) = CONVERT(level_1.row_id USING utf8)
LEFT JOIN  apps_i6_workdb.d_location level_2
ON CONVERT(a.s2 USING utf8) = CONVERT(level_2.row_id USING utf8)
LEFT JOIN  apps_i6_workdb.d_location level_3
ON CONVERT(a.s3 USING utf8) = CONVERT(level_3.row_id USING utf8)
LEFT JOIN  apps_i6_workdb.d_location level_4
ON CONVERT (a.s4 USING utf8) = CONVERT(level_4.row_id USING utf8)
LEFT JOIN  apps_i6_workdb.d_location level_5
ON CONVERT(a.s5 USING utf8) = CONVERT(level_5.row_id USING utf8) ;



SELECT row_id,lev_0_id,lev_0_key,lev_1_id,lev_1_key,lev_2_id,lev_2_key,
lev_3_id,lev_3_key,lev_4_id,lev_4_key,lev_5_id,lev_5_key
FROM apps_i6_workdb.d_h_all_hierarchies
WHERE hierarchy_class ='LOCATION' ;