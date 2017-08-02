SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_problem.change_request_key' ELSE 'SUCCESS' END as Message
from molinahealth_mdsdb.task_final SRC
join
molinahealth_mdwdb.f_task_c TRGT
on SRC.sys_id=TRGT.row_id and SRC.sourceinstance=TRGT.source_id
join
molinahealth_mdwdb.d_internal_organization lkp
on concat('SUBSIDIARY~',SRC.company)= lkp.row_id and TRGT.source_id=lkp.source_id
where coalesce(lkp.row_key,case when SRC.company is null then 0 else -1 end) <>TRGT.company_key