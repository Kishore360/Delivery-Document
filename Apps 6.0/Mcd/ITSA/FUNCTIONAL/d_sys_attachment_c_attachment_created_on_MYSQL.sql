SELECT 
CASE WHEN cnt >0  THEN 'FAILURE' ELSE 'SUCCESS' END as RESULT,
CASE WHEN cnt >0  THEN 'MDS to DW Data Validation Failed for d_sys_attachment_c_attachment_created_by' ELSE 'SUCCESS' END as MESSAGE
FROM (SELECT count(1) cnt
FROM (select sys_id,sourceinstance,sys_created_by,cdctime,COALESCE(CONVERT_TZ(sys_created_on,'GMT','US/Central'),'UNSPECIFIED')attachment_created_on from mcd_mdsdb.sys_attachment_final where table_name not like ('%sys_email%') 
)a 
JOIN (select row_id,source_id,attachment_created_on from mcd_mdwdb.d_sys_attachment_c where soft_deleted_flag='N') X 
ON a.sys_id=X.row_id and a.sourceinstance=X.source_id  
join (select source_id,max(lastupdated) as lastupdated from mcd_mdwdb.d_o_data_freshness group by source_id) f1 on 
f1.source_id = a.sourceinstance and a.cdctime<=f1.lastupdated
and   a.attachment_created_on<>X.attachment_created_on
)a;


