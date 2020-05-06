SELECT 

CASE WHEN CNT>0  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 

CASE WHEN CNT>0  THEN 'MDS to DWH data validation failed for d_service.name' ELSE 'SUCCESS' END as Message 

FROM 

(

SELECT Count(1) as CNT 

from (select * from equifax_mdsdb.x_59673_equifax_bu_equifax_business_impact_table_final where cdctype<>'D') src

left join equifax_mdwdb.d_equifax_bu_equifax_business_impact_c t on src.sys_id=t.row_id and src.sourceinstance=t.source_id
where src.u_total_transactions <> t.total_transactions_c and src.cdctype<>'D'
) 
temp;




