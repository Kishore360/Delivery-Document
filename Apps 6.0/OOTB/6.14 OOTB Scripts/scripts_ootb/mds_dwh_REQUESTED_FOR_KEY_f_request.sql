select CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for REQUESTED_FOR_KEY' ELSE 'SUCCESS' END as Message
from ( SELECT * FROM #MDS_TABLE_SCHEMA.sc_request_final WHERE CDCTYPE<>'D') SRC
left join #DWH_TABLE_SCHEMA.f_request TGT
on SRC.sys_id = TGT.row_id
left join #DWH_TABLE_SCHEMA.d_internal_contact LKP
on LKP.row_id = CONCAT('INTERNAL_CONTACT~', SRC.requested_for)
AND LKP.source_id=SRC.SOURCEINSTANCE
where COALESCE(TGT.REQUESTED_FOR_KEY, '') <> 
case when SRC.requested_for is  null  then 0 else COALESCE(LKP.row_key, -1) end
and TGT.row_key not in (0,-1);