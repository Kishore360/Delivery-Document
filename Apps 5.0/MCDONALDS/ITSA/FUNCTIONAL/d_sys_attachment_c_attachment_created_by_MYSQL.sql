
SELECT 
CASE WHEN count(1) >0  THEN 'FAILURE' ELSE 'SUCCESS' END as RESULT,
CASE WHEN count(1) >0  THEN 'MDS to DW Data Validation Failed for d_sys_attachment_c_attachment_created_by' ELSE 'SUCCESS' END as MESSAGE
FROM (SELECT a.sys_created_by,b.user_name,a.sys_id,X.row_id ,COALESCE(b.name,'UNSPECIFIED'),X.attachment_created_by
FROM mcdonalds_mdsdb.sys_attachment_final a 
left JOIN mcdonalds_mdwdb.d_sys_attachment_c X ON a.sys_id=X.row_id and a.sourceinstance=X.source_id
JOIN mcdonalds_mdsdb.sys_user_final b ON a.sys_created_by=b.user_name and a.table_name<>'sys_email'
left join (select source_id,max(lastupdated) as lastupdated from mcdonalds_mdwdb.d_o_data_freshness group by source_id) f1 on (f1.source_id = a.sourceinstance)
 

WHERE  (a.cdctime<=f1.lastupdated) and X.soft_deleted_flag='N' and COALESCE(b.name,'UNSPECIFIED')<>X.attachment_created_by)a;