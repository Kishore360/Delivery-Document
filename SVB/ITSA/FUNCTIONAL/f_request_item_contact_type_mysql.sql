SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed' ELSE 'Data Matched' END AS Message 
from svb_mdsdb.sc_req_item_final SRC
left join svb_mdwdb.f_request_item TRG
on SRC.sys_id=TRG.row_id and SRC.sourceinstance=TRG.source_id
left join svb_mdwdb.d_lov lov
on (CONCAT('CONTACT_TYPE','~','SC_REQ_ITEM~~~',UPPER(SRC.contact_type))=lov.row_id
AND SRC.sourceinstance= lov.source_id )
where TRG.contact_type_c_key <> coalesce(lov.row_key,case when SRC.contact_type is null then 0 else -1 end)