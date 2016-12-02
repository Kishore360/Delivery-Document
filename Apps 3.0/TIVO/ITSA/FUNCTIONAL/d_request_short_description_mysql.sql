
SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_request.short_description' ELSE 'SUCCESS' END as Message
 FROM (
 select case when COALESCE( char_length(replace(s.short_description,' ','')),'')>255 then '' else
 replace(convert(s.short_description using ascii),'?',' ') end as short_description_src,
TRGT.short_description TRGT_short_description from 
 (select sys_id,short_description,sourceinstance from
 tivo_mdsdb.u_tech_ops_request_final where sys_id not in(select sys_id from tivo_mdsdb.sc_request_final)
union 
select sys_id,short_description,sourceinstance from  tivo_mdsdb.sc_req_item_final
union select sys_id,short_description,sourceinstance from  tivo_mdsdb.sc_request_final
) s  LEFT JOIN tivo_mdwdb.d_request TRGT 
 ON (s.sys_id =TRGT.row_id  
 AND s.sourceinstance= TRGT.source_id  ))a
 WHERE short_description_src<> 
TRGT_short_description
 
 