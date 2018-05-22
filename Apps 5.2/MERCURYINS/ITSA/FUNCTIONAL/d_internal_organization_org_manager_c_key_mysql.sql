SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_problem.change_request_key' ELSE 'SUCCESS' END as Message
from mercuryins_mdsdb.sys_user_group_final SRC
join
mercuryins_mdwdb.d_internal_organization TRGT
on SRC.sys_id=right(TRGT.row_id,32) and SRC.sourceinstance=TRGT.source_id
join
mercuryins_mdwdb.d_internal_contact LKP
on concat('INTERNAL_CONTACT~',SRC.manager) = LKP.row_id
where coalesce(LKP.row_key,case when SRC.manager is null then 0 else -1 end)<>TRGT.org_manager_c_key