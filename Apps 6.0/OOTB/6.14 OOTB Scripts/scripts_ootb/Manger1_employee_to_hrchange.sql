select 

mang1.full_name as manager1
--,int_con.full_name as employee
, count( distinct FTC.row_key) hr_changes
from 
#DWH_TABLE_SCHEMA.f_hr_change FTC

 inner JOIN  #DWH_TABLE_SCHEMA.d_internal_contact int_con
 ON FTC.requested_for_key=int_con.ROW_KEY
 and FTC.soft_deleted_flag<>'Y'
 

 inner JOIN 
 (select * from #DWH_TABLE_SCHEMA.d_h_all_hierarchies d_all
 where    d_all.hierarchy_class='EMPLOYEE'
 union
 select * from #DWH_TABLE_SCHEMA.d_h_all_hierarchies d_all
 where    d_all.row_key in ('0','-1')
 )
 d_all
 ON int_con.row_key=d_all.lev_0_key
 
 inner JOIN  #DWH_TABLE_SCHEMA.d_internal_contact mang1
 ON d_all.lev_1_key=mang1.ROW_KEY
 /*
 inner JOIN  #DWH_TABLE_SCHEMA.d_internal_contact mang2
 ON d_all.lev_2_key=mang2.ROW_KEY
 
 
 inner JOIN  #DWH_TABLE_SCHEMA.d_internal_contact mang3
 ON d_all.lev_3_key=mang3.ROW_KEY
  
 inner JOIN  #DWH_TABLE_SCHEMA.d_internal_contact mang4
 ON d_all.lev_4_key=mang4.ROW_KEY
 
 inner JOIN  #DWH_TABLE_SCHEMA.d_internal_contact mang5
 ON d_all.lev_5_key=mang5.ROW_KEY*/
 group by 
 mang1.row_key,
 mang1.full_name 
-- ,int_con.full_name 
order  by 
 mang1.row_key,
  case when mang1.full_name='UNSPECIFIED' then '0' else mang1.full_name end
 
--,int_con.full_name  