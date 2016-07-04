SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'd_h_all_hierarchies for  USER GROUP failed' ELSE 'SUCCESS' END as Message
 FROM 
(SELECT a.s1 ,CONCAT(a.s0,'~USER GROUP') AS row_id,
a.s0 AS lev_0_id,IFNULL(level_0.row_key ,CASE WHEN a.s0 IS NULL THEN 0 ELSE -1 END) AS lev_0_key,
a.s1 AS lev_1_id,IFNULL(level_1.row_key ,CASE WHEN a.m00 IS NULL THEN 0 ELSE -1 END) AS lev_1_key,
a.s2 AS lev_2_id,IFNULL(level_2.row_key ,CASE WHEN a.m01 IS NULL THEN 0 ELSE -1 END) AS lev_2_key,
a.s3 AS lev_3_id,IFNULL(level_3.row_key ,CASE WHEN a.m02 IS NULL THEN 0 ELSE -1 END) AS lev_3_key,
a.s4 AS lev_4_id,IFNULL(level_4.row_key ,CASE WHEN a.m03 IS NULL THEN 0 ELSE -1 END) AS lev_4_key,
a.s5 AS lev_5_id,IFNULL(level_5.row_key ,CASE WHEN a.m04 IS NULL THEN 0 ELSE -1 END) AS lev_5_key
FROM 
(SELECT lev_0.sys_id AS s0,coalesce(lev_1.sys_id,case when lev_0.parent is null then null else -1 end )AS m00,
lev_0.parent AS s1,coalesce(lev_2.sys_id,case when lev_1.parent is null then null else -1 end )AS m01,
lev_1.parent AS s2,coalesce(lev_3.sys_id,case when lev_2.parent is null then null else -1 end )AS m02,
lev_2.parent AS s3,coalesce(lev_4.sys_id,case when lev_3.parent is null then null else -1 end )AS m03,
lev_3.parent AS s4,coalesce(lev_5.sys_id,case when lev_4.parent is null then null else -1 end )AS m04,
lev_4.parent AS s5,lev_5.parent AS m05
FROM <<tenant>>_mdsdb.sys_user_group_final lev_0
LEFT JOIN <<tenant>>_mdsdb.sys_user_group_final lev_1
ON(lev_0.parent = lev_1.sys_id)
LEFT JOIN <<tenant>>_mdsdb.sys_user_group_final lev_2
ON(lev_1.parent = lev_2.sys_id)
LEFT JOIN <<tenant>>_mdsdb.sys_user_group_final lev_3
ON(lev_2.parent = lev_3.sys_id)
LEFT JOIN <<tenant>>_mdsdb.sys_user_group_final lev_4
ON(lev_3.parent = lev_4.sys_id)
LEFT JOIN <<tenant>>_mdsdb.sys_user_group_final lev_5
ON(lev_4.parent = lev_5.sys_id)
)a
LEFT JOIN  <<tenant>>_mdwdb.d_internal_organization level_0
ON CONCAT('GROUP~',a.s0 )  = level_0.row_id 
LEFT JOIN  <<tenant>>_mdwdb.d_internal_organization level_1
ON CONCAT('GROUP~',a.s1 )  = level_1.row_id 
LEFT JOIN  <<tenant>>_mdwdb.d_internal_organization level_2
ON CONCAT('GROUP~',a.s2 )  = level_2.row_id 
LEFT JOIN  <<tenant>>_mdwdb.d_internal_organization level_3
ON CONCAT('GROUP~',a.s3 )  = level_3.row_id 
LEFT JOIN  <<tenant>>_mdwdb.d_internal_organization level_4
ON CONCAT('GROUP~',a.s4 )  = level_4.row_id 
LEFT JOIN  <<tenant>>_mdwdb.d_internal_organization level_5
ON CONCAT('GROUP~',a.s5 )  = level_5.row_id  ) SRC
LEFT JOIN 
(SELECT row_id,lev_0_id,lev_0_key,lev_1_id,lev_1_key,lev_2_id,lev_2_key,
lev_3_id,lev_3_key,lev_4_id,lev_4_key,lev_5_id,lev_5_key
FROM <<tenant>>_mdwdb.d_h_all_hierarchies
WHERE hierarchy_class ='USER GROUP' ) TRGT
 ON(SRC.row_id=TRGT.row_id)
 WHERE  coalesce(SRC.lev_0_id,'')<> coalesce(TRGT.lev_0_id,'')
 OR coalesce( SRC.lev_1_id,'')<> coalesce( TRGT.lev_1_id,'')
 OR coalesce( SRC.lev_2_id,'')<> coalesce( TRGT.lev_2_id,'')
 OR coalesce( SRC.lev_3_id,'')<> coalesce( TRGT.lev_3_id,'')
 OR coalesce( SRC.lev_4_id,'')<> coalesce( TRGT.lev_4_id,'')
 OR coalesce( SRC.lev_5_id,'')<> coalesce( TRGT.lev_5_id,'')
 OR coalesce( SRC.lev_0_key,'')<> coalesce( TRGT.lev_0_key,'')
 OR coalesce( SRC.lev_1_key,'')<> coalesce( TRGT.lev_1_key,'')
 OR coalesce( SRC.lev_2_key,'')<> coalesce( TRGT.lev_2_key,'')
 OR coalesce( SRC.lev_3_key,'')<> coalesce( TRGT.lev_3_key,'')
 OR coalesce( SRC.lev_4_key,'')<> coalesce( TRGT.lev_4_key,'')
 OR coalesce( SRC.lev_5_key,'')<> coalesce( TRGT.lev_5_key,'')
 ;
