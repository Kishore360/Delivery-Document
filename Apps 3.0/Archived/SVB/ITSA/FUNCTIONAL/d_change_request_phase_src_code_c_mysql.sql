
 SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'MSRC to DWH data validation failed for phase_src_code_c' ELSE 'SUCCESS' END as Message
FROM svb_mdsdb.change_request_final SRC
left join svb_mdwdb.d_change_request TRGT 
 on (TRGT.row_id = SRC.sys_id and TRGT.source_id= SRC.sourceinstance)
where TRGT.phase_src_code_c <>SRC.phase;


