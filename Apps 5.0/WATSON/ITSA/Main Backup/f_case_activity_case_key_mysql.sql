SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_case.last_resolved_on' ELSE 'SUCCESS' END as Message
FROM watson_mdsdb.sys_audit_final src
left join watson_mdwdb.d_case lkp on documentkey=row_id and src.sourceinstance=source_id and tablename='sn_customerservice_case'
join watson_mdwdb.f_case_activity trgt on 
src.sys_id=trgt.row_id and src.sourceinstance=trgt.source_id
where case_key <>coalesce(lkp.row_key,case when documentkey is null then 0 else -1 end )


