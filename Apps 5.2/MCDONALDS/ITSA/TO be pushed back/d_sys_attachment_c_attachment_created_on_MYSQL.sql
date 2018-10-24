
SELECT 
CASE WHEN CNT THEN 'FAILURE' ELSE 'SUCCESS' END as RESULT,
CASE WHEN CNT THEN 'MDS to DW Data Validation Failed for d_sys_attachment_c_attachment_created_by' ELSE 'SUCCESS' END as MESSAGE
FROM (SELECT count(1) as CNT
FROM (select * from mcdonalds_mdsdb.sys_attachment_final where cdctype<>'D') a 
JOIN mcdonalds_mdwdb.d_sys_attachment_c X ON a.sys_id=X.row_id and a.sourceinstance=X.source_id
left join (select source_id,max(lastupdated) as lastupdated from mcdonalds_mdwdb.d_o_data_freshness group by source_id) f1 on (f1.source_id = SRC.sourceinstance)
where (a.cdctime<=f1.lastupdated) and 
COALESCE(CONVERT_TZ(a.sys_created_on,'GMT','US/Central'),'UNSPECIFIED')<>X.attachment_created_on
)a;