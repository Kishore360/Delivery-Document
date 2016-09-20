
SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_request.short_description' ELSE 'SUCCESS' END as Message
 FROM (
 select case when COALESCE( char_length(replace(SRC.short_description,' ','')),'')>255 then '' else
 replace(convert(SRC.short_description using ascii),'?',' ') end as short_description_src,
TRGT.short_description TRGT_short_description from 
 tivo_mdsdb.sc_req_item_final SRC 
 LEFT JOIN tivo_mdwdb.d_request TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  ))a
 WHERE short_description_src<> 
TRGT_short_description
 