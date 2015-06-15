

select  CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_change_request.source_url
 ' ELSE 'SUCCESS' END as Message
from #TABLE_SCHEMA.d_change_request
where source_url<>concat('#URL',row_id,'" target="_blank">',change_request_number,'</a>') 
and row_key not in(-1,0);
