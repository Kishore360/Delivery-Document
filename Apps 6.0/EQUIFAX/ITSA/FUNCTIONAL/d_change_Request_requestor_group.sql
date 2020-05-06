  
SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT > 0 THEN 'MDS to DWH data validation failed for d_change_request.change_business_sponsor_group_c_key ' ELSE 'SUCCESS' END as Message
from
(select COUNT(1) AS CNT
from (select sys_id,sourceinstance,u_requester_group from equifax_mdsdb.change_request_final where CDCTYPE<>'D') SRC
left join equifax_mdwdb.d_change_request TRGT on SRC.sys_id=TRGT.row_id and SRC.sourceinstance=TRGT.source_id
left join equifax_mdwdb.d_internal_organization lkp on coalesce(concat('GROUP~', SRC.u_requester_group),'UNSPECIFIED')=lkp.row_id AND SRC.sourceinstance= lkp.source_id
 where  coalesce(lkp.row_key, case when SRC.u_requester_group is null then 0 else -1 end) =TRGT.change_requester_group_c_key
 and SRC.cdctype<>'D') temp; 

