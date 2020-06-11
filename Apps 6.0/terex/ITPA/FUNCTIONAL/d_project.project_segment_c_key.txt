

SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT > 0 THEN 'MDS to DWH data validation failed for d_project.project_segment_c_key' ELSE 'SUCCESS' END as Message FROM (
SELECT count(1) as CNT
FROM terex_mdsdb.pv_projects_final SRC 
JOIN terex_mdwdb.d_project TRGT ON (SRC.id=TRGT.row_id AND SRC.sourceinstance=TRGT.source_id)
join terex_mdwdb.d_lov LKP
on LKP.row_id=coalesce(CONCAT('PROJECT~SEGMENT_C~',SRC.Segment1),'UNSPECIFIED') and LKP.source_id=SRC.sourceinstance
WHERE coalesce(case when SRC.Segment1 is null then 0 else LKP.row_key end,-1)<>TRGT.project_segment_c_key
 AND SRC.cdctype='X' ) temp; 