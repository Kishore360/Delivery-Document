SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT > 0 THEN 'MDS to DWH data validation failed for d_project.segment_group_c_key' ELSE 'SUCCESS' END as Message 
FROM 
(
SELECT Count(1) as CNT
FROM   terex_mdsdb.pv_projects_final SRC 
LEFT JOIN  terex_mdwdb.d_project TRGT ON (SRC.id=TRGT.row_id AND SRC.sourceinstance=TRGT.source_id)
JOIN terex_mdwdb.d_lov LKP ON coalesce(CONCAT('PROJECT~SEGMENT_C~',SRC.Segment1),'UNSPECIFIED') =LKP.row_id
JOIN 
(
select value_c as value_c, numerify_grouping_c,row_key,count(1) from terex_mdwdb.d_moc_c
group by 2
) LKP1 ON LKP.dimension_name=LKP1.value_c 
WHERE COALESCE(LKP1.row_key,-1)<>TRGT.segment_group_c_key
AND SRC.cdctype='X'
) temp; 


