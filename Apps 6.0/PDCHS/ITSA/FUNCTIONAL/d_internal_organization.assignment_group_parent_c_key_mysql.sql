SELECT CASE WHEN CNT>0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN CNT>0 THEN 'MDS to DWH data validation failed for d_internal_organization.assignment_group_parent_c_key' ELSE 'SUCCESS' END as Message 
FROM 
(select count(1) as CNT from 
(select sys_id,sourceinstance,parent from pdchs_mdsdb.sys_user_group_final where CDCTYPE<>'D') src
left JOIN  pdchs_mdwdb.d_internal_organization trgt
on concat('GROUP~',src.sys_id) = trgt.row_id and src.sourceinstance = trgt.source_id 
left join pdchs_mdwdb.d_internal_organization lkp on concat('GROUP~',src.parent)=lkp.row_id
where coalesce(lkp.row_key, case when src.parent is null then lkp.row_key else -1 end) <> trgt.assignment_group_parent_c_key ) temp;