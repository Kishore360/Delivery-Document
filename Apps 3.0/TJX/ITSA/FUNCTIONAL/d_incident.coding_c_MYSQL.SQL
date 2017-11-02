SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT >0 THEN 'MDS to DWH data validation failed for d_incident.coding_c' ELSE 'SUCCESS' END as  Message
FROM 
(SELECT count(1) as CNT 
FROM tjx_mdsdb.incident_final a
JOIN tjx_mdsdb.u_inc_cat_options_final LKP1 ON a.category=LKP1.sys_id and a.sourceinstance=LKP1.sourceinstance
JOIN tjx_mdsdb.u_inc_subcat_options_final LKP2 ON a.subcategory=LKP2.sys_id and a.sourceinstance=LKP2.sourceinstance
JOIN tjx_mdsdb.u_inc_sym_options_final LKP3 ON a.u_symptom=LKP3.sys_id and a.sourceinstance=LKP3.sourceinstance
JOIN tjx_mdwdb.d_incident b ON a.sys_id=b.row_id and a.sourceinstance=b.source_id
WHERE CONCAT(LKP1.u_category," > ",LKP2.u_subcategory," > ",LKP3.u_symptom)<>b.coding_c
)temp;

 