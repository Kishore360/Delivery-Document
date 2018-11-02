SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for d_change_request.u_sr_number_c' ELSE 'SUCCESS' END as Message 
FROM
(select sys_id, sourceinstance,u_sr_number from aetna_mdsdb.change_request_final where CDCTYPE<>'D') src
left join aetna_mdwdb.d_change_request trgt on 
src.sys_id=trgt.row_id and src.sourceinstance=trgt.source_id
where  coalesce(src.u_sr_number,'UNSPECIFIED') = trgt.u_sr_number_c;