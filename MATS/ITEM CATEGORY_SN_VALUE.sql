select case when count(1)<1 then 'Failure' else 'Success' end as Result,
case when count(1)<1 then 'No records found' else 'Records found' end as Message from
(SELECT CONCAT(a.s0,'~-1~ITEM CATEGORY') AS row_id,
a.s0 AS lev_0_id,IFNULL(level_0.row_key ,0) AS lev_0_key,
a.s1 AS lev_1_id,IFNULL(level_1.row_key ,0) AS lev_1_key,
a.s2 AS lev_2_id,IFNULL(level_2.row_key ,0) AS lev_2_key,
a.s3 AS lev_3_id,IFNULL(level_3.row_key ,0) AS lev_3_key,
a.s4 AS lev_4_id,IFNULL(level_4.row_key ,0) AS lev_4_key,
a.s5 AS lev_5_id,IFNULL(level_5.row_key ,0) AS lev_5_key
FROM 
(SELECT lev_0.sys_id AS s0,lev_0.parent AS  m0,lev_1.sys_id AS s1,lev_1.parent AS m1,lev_2.sys_id AS s2,lev_2.parent AS m2,lev_3.sys_id AS s3,
lev_3.parent AS m3,lev_4.sys_id AS s4,lev_4.parent AS m4,lev_5.sys_id AS s5,lev_5.parent AS m5
FROM <<tenant>>_mdsdb.sc_category_final lev_0
LEFT JOIN <<tenant>>_mdsdb.sc_category_final lev_1
ON(lev_0.parent = lev_1.sys_id)
LEFT JOIN <<tenant>>_mdsdb.sc_category_final lev_2
ON(lev_1.parent = lev_2.sys_id)
LEFT JOIN <<tenant>>_mdsdb.sc_category_final lev_3
ON(lev_2.parent = lev_3.sys_id)
LEFT JOIN <<tenant>>_mdsdb.sc_category_final lev_4
ON(lev_3.parent = lev_4.sys_id)
LEFT JOIN <<tenant>>_mdsdb.sc_category_final lev_5
ON(lev_4.parent = lev_5.sys_id)
)a
LEFT JOIN  <<tenant>>_mdwdb.d_master_item level_0
ON a.s0 = level_0.row_id
LEFT JOIN  <<tenant>>_mdwdb.d_master_item level_1
ON a.s1 = level_1.row_id
LEFT JOIN  <<tenant>>_mdwdb.d_master_item level_2
ON a.s2 = level_2.row_id
LEFT JOIN  <<tenant>>_mdwdb.d_master_item level_3
ON a.s3 = level_3.row_id
LEFT JOIN  <<tenant>>_mdwdb.d_master_item level_4
ON a.s4 = level_4.row_id
LEFT JOIN  <<tenant>>_mdwdb.d_master_item level_5
ON a.s5 = level_5.row_id) b ;





