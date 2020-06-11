select dci.row_key  , dci.category , dci.ci_type ,   dci.class ,count(fp.row_key)as "Opened_Problem" from  #DWH_TABLE_SCHEMA.f_problem fp  
left join #DWH_TABLE_SCHEMA.d_configuration_item dci 
on fp.configuration_item_key = dci.row_key 
group by dci.row_key  , dci.category , dci.ci_type ,   dci.class
order by lower(dci.row_key) ,lower(dci.category) , lower(dci.ci_type) ,  lower(dci.class) asc 