SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT > 0 THEN 'MDS to DWH data validation failed for d_hr_case_c.dormant_flag' ELSE 'SUCCESS' END as Message
FROM 
( 
SELECT Count(1) AS CNT
FROM molinahealth_mdsdb.u_hr_case_final a 
LEFT JOIN molinahealth_mdwdb.d_hr_case_c b ON (a.sys_id=b.row_id AND a.sourceinstance=b.source_id)
LEFT JOIN molinahealth_mdwdb.f_hr_case_c c ON (b.row_key=c.hr_case_c_key)
LEFT JOIN molinahealth_mdwdb.d_lov_map LM ON c.state_src_key=LM.src_key AND LM.dimension_class= 'STATE~HR_CASE'
AND LM.dimension_wh_code NOT IN  ('RESOLVED','CLOSED')
LEFT JOIN 
(SELECT source_id,max(lastupdated) as lastupdate from molinahealth_mdwdb.d_o_data_freshness group by source_id) ODF 
ON (a.sourceinstance=ODF.source_id)
WHERE CASE WHEN timestampdiff(DAY,b.changed_on,ODF.lastupdate)>30
AND LM.dimension_wh_code='OPEN' THEN 'Y' ELSE 'N' END <>b.dormant_flag
) a; 









