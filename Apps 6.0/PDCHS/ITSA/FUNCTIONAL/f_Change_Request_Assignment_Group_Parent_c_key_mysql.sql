SELECT 

CASE WHEN cnt>0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 

CASE WHEN cnt>0 THEN 'MDS to DWH data validation failed for Change_Request.Change_Request_assignment_group_parent_c_key' ELSE 'SUCCESS' END as Message 

from (
select count(1) as cnt from 
(select * from pdchs_mdsdb.change_request_final where CDCTYPE<>'D') src 

left join pdchs_mdwdb.f_change_request trgt on src.sys_id=trgt.row_id and src.sourceinstance=trgt.source_id 

left join pdchs_mdsdb.sys_user_group_final src1 on src.assignment_group=src1.sys_id and src.sourceinstance=src1.sourceinstance
left join pdchs_mdwdb.d_internal_organization lkp1 
on coalesce(concat('GROUP~',src.assignment_group),'UNSPECIFIED')=lkp1.row_id and src1.sourceinstance=lkp1.source_id 

left join pdchs_mdsdb.sys_user_group_final src2 on src1.parent=src2.sys_id and src1.sourceinstance=src2.sourceinstance 

left join pdchs_mdwdb.d_internal_organization lkp on coalesce(concat('GROUP~',src1.parent),'UNSPECIFIED')=lkp.row_id and src1.sourceinstance=lkp.source_id   
where coalesce(lkp.row_key,case when src1.parent is null then lkp1.row_key else -1 end) <> lkp1.assignment_group_parent_c_key ) temp;
