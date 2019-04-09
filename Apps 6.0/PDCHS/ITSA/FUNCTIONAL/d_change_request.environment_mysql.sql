select  CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN cnt > 0 THEN 'MDS to DWH data validation failed for d_change_request.environment' ELSE 'SUCCESS' END as Message
from
(
select count(1) as cnt from pdchs_mdsdb.change_request_final SRC
left join pdchs_mdwdb.d_change_request TRGT on SRC.sys_id=TRGT.row_id and SRC.sourceinstance=TRGT.source_id
where coalesce(SRC.u_environment,'UNSPECIFIED') <>TRGT.environment and SRC.cdctype<>'D'
)temp;

