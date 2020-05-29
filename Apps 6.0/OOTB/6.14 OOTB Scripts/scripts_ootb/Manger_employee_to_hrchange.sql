select
 manager5
,manager4
,manager3
, manager2
, manager1
,employee
,  hr_changes
from (
select 
mang5.full_name as manager5
,mang4.full_name as manager4
,mang3.full_name as manager3
,mang2.full_name as manager2
,mang1.full_name as manager1
,mang5.row_key as row_key5
,mang4.row_key as row_key4
,mang3.row_key as row_key3
,mang2.row_key as row_key2
,mang1.row_key as row_key1

,int_con.full_name as employee
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

 inner JOIN  #DWH_TABLE_SCHEMA.d_internal_contact mang2
 ON d_all.lev_2_key=mang2.ROW_KEY
 
 inner JOIN  #DWH_TABLE_SCHEMA.d_internal_contact mang3
 ON d_all.lev_3_key=mang3.ROW_KEY
  
 inner JOIN  #DWH_TABLE_SCHEMA.d_internal_contact mang4
 ON d_all.lev_4_key=mang4.ROW_KEY
 
 inner JOIN  #DWH_TABLE_SCHEMA.d_internal_contact mang5
 ON d_all.lev_5_key=mang5.ROW_KEY
 
 group by 
mang5.row_key 
,mang4.row_key 
,mang3.row_key
,mang2.row_key 
,mang1.row_key ,
  mang5.full_name ,
  mang4.full_name ,
  mang3.full_name ,
 mang2.full_name
,mang1.full_name 
,int_con.full_name 
order  by 
mang5.row_key 
,mang4.row_key 
,mang3.row_key
,mang2.row_key 
,mang1.row_key ,

case when mang5.full_name='UNSPECIFIED' then '0' else mang5.full_name end
, case when mang4.full_name='UNSPECIFIED' then '0' else mang4.full_name end
, case when mang3.full_name='UNSPECIFIED' then '0' else mang3.full_name end
, case when mang2.full_name='UNSPECIFIED' then '0' else mang2.full_name end
, case when mang1.full_name='UNSPECIFIED' then '0' else mang1.full_name end
--, case when int_con.full_name='UNSPECIFIED' then '0' else lower(int_con.full_name) end 
,lower(int_con.full_name) 
)