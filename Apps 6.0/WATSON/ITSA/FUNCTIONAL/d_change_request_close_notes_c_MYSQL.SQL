SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN cnt >0 THEN 'MDS to DWH data validation failed for d_change_request.close_notes_c ' ELSE 'SUCCESS' END as Message
 from(select count(1) as cnt from ibmwatson_mdsdb.change_request_final src
 left join ibmwatson_mdwdb.d_change_request trgt 
 on src.sys_id=trgt.row_id and src.sourceinstance=trgt.source_id
 where COALESCE(src.close_notes,'UNSPECIFIED')<>trgt.close_notes_c)ma	