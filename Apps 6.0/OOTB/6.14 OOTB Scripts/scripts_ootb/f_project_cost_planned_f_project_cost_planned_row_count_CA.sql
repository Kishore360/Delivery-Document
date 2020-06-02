select case when count(1) > 0 then 'FAILURE' else 'SUCCESS' end as Result,
case when count(1) > 0 then 'MDS to DWH row count failed for f_project_cost_planned.row_count' else 'SUCCESS' end as Message
from 
(select * from
(select count(*) count_1 from #DWH_TABLE_SCHEMA.f_project_cost TRGT 
join (select distinct source_id from #DWH_TABLE_SCHEMA.d_o_data_freshness where sourcename = 'CAPPM_TENANT') ODF on ODF.source_id = TRGT.source_id
where TRGT.soft_deleted_flag = 'N' and TRGT.row_key not in (0,-1) and TRGT.row_id like 'PLAN~%'
) A, 
(select count(*) count_2 FROM #MDS_TABLE_SCHEMA.fin_plans_final  SRC 
left join #MDS_TABLE_SCHEMA.fin_cost_plan_details_final SRC2
on SRC.ID = SRC2.PLAN_ID 
and SRC.sourceinstance = SRC2.sourceinstance
inner join #MDS_TABLE_SCHEMA.odf_ssl_cst_dtl_cost_final SRC3
on SRC3.PRJ_OBJECT_ID = SRC2.ID 
and SRC3.sourceinstance = SRC2.sourceinstance
left join #MDS_TABLE_SCHEMA.inv_investments_final SRC4
on SRC4.ID = SRC.OBJECT_ID
and SRC4.sourceinstance = SRC.sourceinstance
left join #MDS_TABLE_SCHEMA.inv_projects_final SRC5 
on SRC5.PRID = SRC4.ID
and SRC5.sourceinstance = SRC4.sourceinstance
where UPPER(SRC.PLAN_TYPE_CODE)='FORECAST' AND UPPER(SRC.OBJECT_CODE) = 'PROJECT' AND UPPER(SRC4.ODF_OBJECT_CODE)='PROJECT' AND SRC5.IS_PROGRAM=0 AND SRC5.IS_TEMPLATE=0 ) B
where count_1 <> count_2) SQ; 