SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_project.row_id' ELSE 'SUCCESS' END as Message
FROM (select * from   #MDS_TABLE_SCHEMA.inv_investments_final  where  cdctype<>'D') SRC 
INNER JOIN(select * from  #MDS_TABLE_SCHEMA.inv_projects_final where IS_PROGRAM=0 and IS_TEMPLATE = 0 and cdctype<>'D')SRC1
on SRC.ID=SRC1.PRID
left join (select B.INVESTMENT_ID,B.sourceinstance,count(1) as operating_cost from  #MDS_TABLE_SCHEMA.ppa_wip_values_final A
left join  #MDS_TABLE_SCHEMA.ppa_wip_final B
on A.TRANSNO = B.TRANSNO
and A.sourceinstance = B.sourceinstance
where A.CURRENCY_TYPE = 'HOME'and B.COST_TYPE = 'OPERATING'
group by 1,2
) T1
on SRC.ID = T1.INVESTMENT_ID
and SRC.sourceinstance = T1.sourceinstance
LEFT JOIN (select B.INVESTMENT_ID,B.sourceinstance,SUM( A.TOTALCOST )as operating_cost 
from  #MDS_TABLE_SCHEMA.ppa_wip_values_final A
left join  #MDS_TABLE_SCHEMA.ppa_wip_final B
on A.TRANSNO = B.TRANSNO
and A.sourceinstance = B.sourceinstance
where A.CURRENCY_TYPE = 'HOME'and B.COST_TYPE = 'OPERATING'
group by 1,2
) T2
on T1.INVESTMENT_ID = T2.INVESTMENT_ID
and T1.sourceinstance = T2.sourceinstance
LEFT JOIN (select * from   #DWH_TABLE_SCHEMA.f_project)TRGT   
ON SRC.id =TRGT.row_id 	and SRC.sourceinstance=TRGT.source_id
where COALESCE(T2.operating_cost,0) <> COALESCE(TRGT.ACTUAL_OPERATING_DOC_COST,'');