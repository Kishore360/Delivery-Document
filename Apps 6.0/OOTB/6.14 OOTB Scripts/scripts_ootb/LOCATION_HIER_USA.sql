SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'd_h_all_hierarchies for  LOCATION failed' ELSE 'SUCCESS' END as Message
 FROM 
(
SELECT CONCAT(a.s0,'~LOCATION') AS row_id,
a.s0 AS lev_0_id,IFNULL(level_0.row_key ,CASE WHEN a.s0 IS NULL THEN 0 ELSE -1 END) AS lev_0_key,
a.s1 AS lev_1_id,IFNULL(level_1.row_key ,CASE WHEN a.s1 IS NULL THEN 0 ELSE -1 END) AS lev_1_key,
a.s2 AS lev_2_id,IFNULL(level_2.row_key ,CASE WHEN a.s2 IS NULL THEN 0 ELSE -1 END) AS lev_2_key,
a.s3 AS lev_3_id,IFNULL(level_3.row_key ,CASE WHEN a.s3 IS NULL THEN 0 ELSE -1 END) AS lev_3_key,
a.s4 AS lev_4_id,IFNULL(level_4.row_key ,CASE WHEN a.s4 IS NULL THEN 0 ELSE -1 END) AS lev_4_key,
a.s5 AS lev_5_id,IFNULL(level_5.row_key ,CASE WHEN a.s5 IS NULL THEN 0 ELSE -1 END) AS lev_5_key
FROM 
(SELECT lev_0.row_id AS s0,lev_0.parent_row_id AS  m0,lev_1.row_id AS s1,lev_1.parent_row_id AS m1,lev_2.row_id AS s2,lev_2.parent_row_id AS m2,lev_3.row_id AS s3,
lev_3.parent_row_id AS m3,lev_4.row_id AS s4,lev_4.parent_row_id AS m4,lev_5.row_id AS s5,lev_5.parent_row_id AS m5
FROM ( SELECT * FROM #MDS_TABLE_SCHEMA.us_d_location_final WHERE CDCTYPE<>'D') lev_0
LEFT JOIN ( SELECT * FROM #MDS_TABLE_SCHEMA.us_d_location_final WHERE CDCTYPE<>'D') lev_1
ON(lev_0.parent_row_id = lev_1.row_id)
LEFT JOIN ( SELECT * FROM #MDS_TABLE_SCHEMA.us_d_location_final WHERE CDCTYPE<>'D') lev_2
ON(lev_1.parent_row_id = lev_2.row_id)
LEFT JOIN ( SELECT * FROM #MDS_TABLE_SCHEMA.us_d_location_final WHERE CDCTYPE<>'D') lev_3
ON(lev_2.parent_row_id = lev_3.row_id)
LEFT JOIN ( SELECT * FROM #MDS_TABLE_SCHEMA.us_d_location_final WHERE CDCTYPE<>'D') lev_4
ON(lev_3.parent_row_id = lev_4.row_id)
LEFT JOIN ( SELECT * FROM #MDS_TABLE_SCHEMA.us_d_location_final WHERE CDCTYPE<>'D') lev_5
ON(lev_4.parent_row_id = lev_5.row_id)
)a
LEFT JOIN  #DWH_TABLE_SCHEMA.d_location level_0
ON a.s0  = level_0.row_id 
LEFT JOIN  #DWH_TABLE_SCHEMA.d_location level_1
ON a.s1  = level_1.row_id 
LEFT JOIN  #DWH_TABLE_SCHEMA.d_location level_2
ON a.s2  = level_2.row_id 
LEFT JOIN  #DWH_TABLE_SCHEMA.d_location level_3
ON a.s3  = level_3.row_id 
LEFT JOIN  #DWH_TABLE_SCHEMA.d_location level_4
ON a.s4 = level_4.row_id 
LEFT JOIN  #DWH_TABLE_SCHEMA.d_location level_5
ON a.s5  = level_5.row_id  ) SRC
LEFT JOIN 
(



SELECT row_id,lev_0_id,lev_0_key,lev_1_id,lev_1_key,lev_2_id,lev_2_key,
lev_3_id,lev_3_key,lev_4_id,lev_4_key,lev_5_id,lev_5_key
FROM #DWH_TABLE_SCHEMA.d_h_all_hierarchies
WHERE hierarchy_class ='LOCATION' ) TRGT
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