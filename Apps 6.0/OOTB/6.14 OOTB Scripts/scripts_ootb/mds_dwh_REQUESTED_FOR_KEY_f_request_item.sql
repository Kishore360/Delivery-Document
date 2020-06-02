select CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for REQUESTED_FOR_KEY' ELSE 'SUCCESS' END as Message
from #DWH_TABLE_SCHEMA.f_request_item TGT
left join ( SELECT * FROM #MDS_TABLE_SCHEMA.sc_req_item_final WHERE CDCTYPE<>'D') SRC
on SRC.sys_id = TGT.row_id
left join ( SELECT * FROM #MDS_TABLE_SCHEMA.sc_request_final WHERE CDCTYPE<>'D') SRC2
on SRC.request = SRC2.sys_id
left join #DWH_TABLE_SCHEMA.d_internal_contact LKP
on LKP.row_id = CONCAT('INTERNAL_CONTACT~', SRC2.requested_for)
and SRC2.SOURCEINSTANCE = LKP.source_id
where TGT.REQUESTED_FOR_KEY <> LKP.row_key
and TGT.row_key not in (0,-1);