select case when count(1) > 0 then 'FAILURE' else 'SUCCESS' end as Result,
case when count(1) > 0 then 'MDS to DWH data validation failed for f_case_activity.task_attribute_wh_old_value_key' else 'SUCCESS' end as Message
from <<tenant>>_mdwdb.f_case_activity F
left join (
select TGT.row_id, SRC.oldvalue, LOV.row_key, TGT.source_id,
COALESCE(case when SRC.oldvalue is not null and LOV.row_key is not null then LOV.row_key
when SRC.oldvalue is not null and LOV.row_key is null then -1 else 0 end,'') Derived
from <<tenant>>_mdsdb.sys_audit_final SRC
left join <<tenant>>_mdwdb.f_case_activity TGT
on (SRC.sys_id=TGT.row_id AND SRC.sourceinstance=TGT.source_id)
left join <<tenant>>_mdwdb.d_lov LOV
on LOV.row_id = coalesce(concat(upper(TGT.task_attribute_wh_name),'~CASE~~~',SRC.oldvalue),'UNSPECIFIED')
and LOV.dimension_class = concat(TGT.task_attribute_wh_name,'~case') and LOV.source_id = SRC.sourceinstance 
where TGT.task_wh_type = 'sn_customerservice_case' and TGT.task_attribute_wh_name in ('state','priority','category')
union 
select TGT.row_id, SRC.oldvalue, DIO.row_key, TGT.source_id,
COALESCE(case when SRC.oldvalue is not null and DIO.row_key is not null then DIO.row_key
when SRC.oldvalue is not null and DIO.row_key is null then -1 else 0 end,'') Derived
from <<tenant>>_mdsdb.sys_audit_final SRC
left join <<tenant>>_mdwdb.f_case_activity TGT
on (SRC.sys_id=TGT.row_id AND SRC.sourceinstance=TGT.source_id)
left join <<tenant>>_mdwdb.d_internal_organization DIO
on DIO.row_id = coalesce(concat('GROUP~',SRC.oldvalue),'UNSPECIFIED')
and DIO.source_id = SRC.sourceinstance 
where TGT.task_attribute_wh_name in ('assignment_group') and TGT.task_wh_type = 'sn_customerservice_case'  
) SQ
on SQ.row_id = F.row_id and SQ.source_id = F.source_id
where F.task_wh_type = 'sn_customerservice_case'
and COALESCE(SQ.Derived,'') <> COALESCE(F.task_attribute_wh_old_value_key,'');
