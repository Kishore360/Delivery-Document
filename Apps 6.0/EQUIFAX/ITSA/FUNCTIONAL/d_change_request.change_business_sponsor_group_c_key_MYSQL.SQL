 
SELECT CASE WHEN cnt>0  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN cnt>0  THEN 'MDS to DWH data validation failed for d_change_request.change_business_sponsor_group_c_key' ELSE 'SUCCESS' END as Message 
from
(select count(1) as cnt from(select sys_id, sourceinstance,u_business_sponsor_group
 from equifax_mdsdb.change_request_final where CDCTYPE<>'D') src
left join  equifax_mdwdb.d_change_request trgt on 
src.sys_id=trgt.row_id and src.sourceinstance=trgt.source_id
left join equifax_mdwdb.d_internal_organization lkp on coalesce(concat('GROUP~',src.u_business_sponsor_group),'UNSPECIFIED')=
lkp.row_id and src.sourceinstance=lkp.source_id
where coalesce(lkp.row_key,case when src.u_business_sponsor_group is null then 0 else -1 end) <> trgt.change_business_sponsor_group_c_key
) temp; 
 
