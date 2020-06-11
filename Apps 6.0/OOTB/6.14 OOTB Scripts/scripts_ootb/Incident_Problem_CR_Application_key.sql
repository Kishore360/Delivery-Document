select CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_#TYPE.application_key' ELSE 'SUCCESS' END as Message
from ( SELECT * FROM #MDS_TABLE_SCHEMA.#TYPE_final WHERE CDCTYPE<>'D') SRC
left join #DWH_TABLE_SCHEMA.f_#TYPE TGT
on SRC.sys_id = TGT.row_id
left join #DWH_TABLE_SCHEMA.d_application LKP
on CONCAT('APPLICATION~',SRC.cmdb_ci) = LKP.row_id and SRC.sourceinstance = LKP.source_id
where TGT.application_key <> LKP.row_key
and TGT.row_key not in (0,-1)