SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_case.last_resolved_on' ELSE 'SUCCESS' END as Message from 
(
select TGT.row_id
from ibmwatson_mdwdb.f_case_activity TGT
left join ibmwatson_mdwdb.d_case D
on D.row_key = TGT.case_key and TGT.primary_sequence_id = 0 and TGT.soft_deleted_flag = 'N' and D.Source_id=2
left join ibmwatson_mdwdb.f_case F 
on F.row_id = D.row_id  and F.Source_id=2 and F.soft_deleted_flag = 'N'
 join ( SELECT documentkey,sourceinstance FROM ibmwatson_mdsdb.sys_audit_final WHERE sourceinstance=2 and  tablename='sn_customerservice_case' 
and  CDCTYPE<>'D') SRC
on SRC.documentkey = F.row_id  
where    F.case_key <> TGT.case_key
)a;



