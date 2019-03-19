SELECT CASE WHEN CNT>0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN CNT>0 THEN 'MDS to DWH data validation failed for d_category_c.assignment_group' ELSE 'SUCCESS' END as Message 
FROM 
(select Count(1) as CNT from 
(select sys_id,sourceinstance,u_assignment_group from pdchs_mdsdb.u_category_final where CDCTYPE<>'D') src
JOIN  pdchs_mdwdb.d_category_c trgt
on src.sys_id = trgt.row_id and src.sourceinstance = trgt.source_id 
where coalesce(src.u_assignment_group, 'UNSPECFIED') <> trgt.assignment_group ) temp;