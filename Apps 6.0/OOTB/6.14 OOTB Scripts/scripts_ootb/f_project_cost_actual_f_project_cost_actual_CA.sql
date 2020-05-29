select case when count(1) > 0 then 'FAILURE' else 'SUCCESS' end as Result,
case when count(1) > 0 then 'MDS to DWH row count failed for f_project_cost_actual.row_count' else 'SUCCESS' end as Message
from 
(select * from
(select count(*) count_1 from #DWH_TABLE_SCHEMA.f_project_cost TRGT 
join (select distinct source_id from #DWH_TABLE_SCHEMA.d_o_data_freshness where sourcename = 'CAPPM_TENANT') ODF on ODF.source_id = TRGT.source_id
where TRGT.soft_deleted_flag = 'N' and TRGT.row_key not in (0,-1) and TRGT.row_id like 'ACT~%'
) A, 
(select count(*) count_2 FROM #MDS_TABLE_SCHEMA.ppa_wip_final SRC 
left join #MDS_TABLE_SCHEMA.ppa_wip_values_final SRC2
on SRC.TRANSNO = SRC2.TRANSNO 
and SRC.sourceinstance = SRC2.sourceinstance
left join #MDS_TABLE_SCHEMA.inv_investments_final SRC3
on SRC.INVESTMENT_ID = SRC3.ID 
and SRC.sourceinstance = SRC3.sourceinstance
left join #MDS_TABLE_SCHEMA.inv_projects_final SRC4
on SRC3.ID = SRC4.PRID 
and SRC3.sourceinstance = SRC4.sourceinstance
left join #MDS_TABLE_SCHEMA.cmn_lookups_final SRC5
on UPPER(SRC.COST_TYPE) = UPPER(SRC5.LOOKUP_CODE) AND SRC.sourceinstance = SRC5.sourceinstance
left join #MDS_TABLE_SCHEMA.transclass_final SRC6
on UPPER(SRC.TRANSCLASS) = UPPER(SRC6.TRANSCLASS) AND SRC.sourceinstance = SRC6.sourceinstance
where UPPER(SRC2.CURRENCY_TYPE) = 'HOME' AND UPPER(SRC3.ODF_OBJECT_CODE)='PROJECT' AND SRC4.IS_TEMPLATE=0 AND SRC4.IS_PROGRAM=0) B
where count_1 <> count_2) SQ; 