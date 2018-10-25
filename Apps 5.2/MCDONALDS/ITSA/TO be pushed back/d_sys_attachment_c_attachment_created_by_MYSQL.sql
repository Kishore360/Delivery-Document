
SELECT 
CASE WHEN CNT >0  THEN 'FAILURE' ELSE 'SUCCESS' END as RESULT,
CASE WHEN CNT >0  THEN 'MDS to DW Data Validation Failed for d_sys_attachment_c_attachment_created_by' ELSE 'SUCCESS' END as MESSAGE
FROM (SELECT count(1) as CNT -- distinct Upper(b.name),X.attachment_created_by,a.table_name
(select * FROM mcdonalds_mdsdb.sys_attachment_final where cdctype<>'D')a 
left JOIN mcdonalds_mdwdb.d_sys_attachment_c X ON a.sys_id=X.row_id and a.sourceinstance=X.source_id
JOIN mcdonalds_mdsdb.sys_user_final b ON a.sys_created_by=b.user_name and a.table_name<>'sys_email'
left join (select source_id,max(lastupdated) as lastupdated from mcdonalds_mdwdb.d_o_data_freshness group by source_id) f1 on (f1.source_id = SRC.sourceinstance)
where (a.cdctime<=f1.lastupdated) and COALESCE(b.name,'UNSPECIFIED')<>X.attachment_created_by)a;