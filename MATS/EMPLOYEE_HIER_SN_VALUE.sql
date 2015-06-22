select case when count(1)<0 then 'Failure' else 'Success' end as Result,
case when count(1)<0 then 'Failure' else 'Success' end as Message 
from(
SELECT CONCAT(a.s0,'~-1~EMPLOYEE') AS row_id,
a.s0 AS lev_0_id,IFNULL(level_0.row_key ,CASE WHEN a.s0 IS NULL THEN 0 ELSE -1 END) AS lev_0_key,
a.s1 AS lev_1_id,IFNULL(level_1.row_key ,CASE WHEN a.s1 IS NULL THEN 0 ELSE -1 END) AS lev_1_key,
a.s2 AS lev_2_id,IFNULL(level_2.row_key ,CASE WHEN a.s2 IS NULL THEN 0 ELSE -1 END) AS lev_2_key,
a.s3 AS lev_3_id,IFNULL(level_3.row_key ,CASE WHEN a.s3 IS NULL THEN 0 ELSE -1 END) AS lev_3_key,
a.s4 AS lev_4_id,IFNULL(level_4.row_key ,CASE WHEN a.s4 IS NULL THEN 0 ELSE -1 END) AS lev_4_key,
a.s5 AS lev_5_id,IFNULL(level_5.row_key ,CASE WHEN a.s5 IS NULL THEN 0 ELSE -1 END) AS lev_5_key
FROM 
(SELECT lev_0.sys_id AS s0,lev_0.manager AS  m0,lev_1.sys_id AS s1,lev_1.manager AS m1,lev_2.sys_id AS s2,lev_2.manager AS m2,lev_3.sys_id AS s3,
lev_3.manager AS m3,lev_4.sys_id AS s4,lev_4.manager AS m4,lev_5.sys_id AS s5,lev_5.manager AS m5
FROM <<tenant>>_mdsdb.sys_user_final lev_0
LEFT JOIN <<tenant>>_mdsdb.sys_user_final lev_1
ON(lev_0.manager = lev_1.sys_id)
LEFT JOIN <<tenant>>_mdsdb.sys_user_final lev_2
ON(lev_1.manager = lev_2.sys_id)
LEFT JOIN <<tenant>>_mdsdb.sys_user_final lev_3
ON(lev_2.manager = lev_3.sys_id)
LEFT JOIN <<tenant>>_mdsdb.sys_user_final lev_4
ON(lev_3.manager = lev_4.sys_id)
LEFT JOIN <<tenant>>_mdsdb.sys_user_final lev_5
ON(lev_4.manager = lev_5.sys_id)
)a
LEFT JOIN  <<tenant>>_mdwdb.d_internal_contact level_0
ON a.s0 = level_0.row_id
LEFT JOIN  <<tenant>>_mdwdb.d_internal_contact level_1
ON a.s1 = level_1.row_id
LEFT JOIN  <<tenant>>_mdwdb.d_internal_contact level_2
ON a.s2 = level_2.row_id
LEFT JOIN  <<tenant>>_mdwdb.d_internal_contact level_3
ON a.s3 = level_3.row_id
LEFT JOIN  <<tenant>>_mdwdb.d_internal_contact level_4
ON a.s4 = level_4.row_id
LEFT JOIN  <<tenant>>_mdwdb.d_internal_contact level_5
ON a.s5 = level_5.row_id 
)b;





select case when count(1)<0 then 'Failure' else 'Success' end as Result,
case when count(1)<0 then 'Failure' else 'Success' end as Message 
from(
SELECT row_id,lev_0_id,lev_0_key,lev_1_id,lev_1_key,lev_2_id,lev_2_key,
lev_3_id,lev_3_key,lev_4_id,lev_4_key,lev_5_id,lev_5_key
FROM <<tenant>>_mdwdb.d_h_all_hierarchies
WHERE hierarchy_class ='EMPLOYEE'
)c;
