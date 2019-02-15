SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT > 0 THEN 'MDS to DWH data validation failed for d_change_request.change_coordinator_group_c_key' ELSE 'SUCCESS' END as Message
from
(select count(1) as CNT from  pdchs_mdsdb.change_request_final  SRC
left join pdchs_mdwdb.d_change_request TRGT on SRC.sys_id=TRGT.row_id and SRC.sourceinstance=TRGT.source_id
left join pdchs_mdwdb.d_internal_organization lkp on coalesce(concat('GROUP~',SRC.u_change_coordinator_group),'UNSPECIFIED')=lkp.row_id
and SRC.sourceinstance=lkp.source_id 
where coalesce(lkp.row_key,case when SRC.u_change_coordinator_group is null then 0 else -1 end )<>TRGT.change_coordinator_group_c_key 
AND SRC.CDCTYPE<>'D'
)temp;





