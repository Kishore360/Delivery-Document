
SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_case.changed_on' ELSE 'SUCCESS' END as Message
  FROM  watson_mdsdb.sys_audit_final src
join watson_mdwdb.f_case_activity trgt on 
src.sys_id=trgt.row_id and src.sourceinstance=trgt.source_id and tablename='sn_customerservice_case'
where created_on <>CONVERT_TZ (sys_created_on,'GMT','UTC');



