Select CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_application.used_for_src_key' ELSE 'SUCCESS' END as Message
from #DWH_TABLE_SCHEMA.d_application TGT
left join (
select CONCAT('APPLICATION~',SRC.sys_id) id, case when max(LKP.row_key) is null then 0 else max(LKP.row_key) end used_for
from #MDS_TABLE_SCHEMA.cmdb_ci_appl_final SRC
left join #DWH_TABLE_SCHEMA.d_lov LKP
on LKP.row_id = CONCAT('USED_FOR~business_service~~~',SRC.used_for)
group by SRC.sys_id) LKP2
on TGT.row_id = LKP2.id
where COALESCE(TGT.used_for_src_key, '') <> COALESCE(LKP2.used_for, '')
and TGT.row_key not in (0,-1)