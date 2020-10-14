SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_change_request.change_type_normal_to_emergency_flag' 
 ELSE 'SUCCESS' END as Message
 FROM ( SELECT * FROM humana_mdsdb.change_request_final WHERE CDCTYPE<>'D') SRC 
left join (select * from humana_mdsdb.sys_audit_final where fieldname = 'type' and tablename = 'change_request') sa
on sa.documentkey = SRC.sys_id
 LEFT JOIN humana_mdwdb.d_change_request TRGT 
 ON (SRC.sys_id=TRGT.row_id 
 AND SRC.sourceinstance=TRGT.source_id )
 where case when upper(sa.oldvalue) = 'NORMAL' and upper(sa.newvalue) = 'EMERGENCY' then 'Y' else 'N' end
 <> coalesce(change_type_normal_to_emergency_flag,'')