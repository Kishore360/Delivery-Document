 select'f_incident' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident             a11 
 union
  select'd_incident_type_c' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident             a11 
 join        ldb.d_incident   a110
                  on         (a11.incident_key = a110.row_key)
   join        ldb.d_incident_type_c  a134
                  on         (a110.incident_type_src_c_key = a134.row_key)
		union
 select'd_incident_outage_class_c' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident             a11 
 join        ldb.d_incident   a110
                  on         (a11.incident_key = a110.row_key)
 				     join        ldb.d_incident_outage_class_c a136
                  on         (a110.outage_class_src_c_key = a136.row_key)
				  union
				   select'd_business_unit_c' as Table_Name, count(a11.row_key) Row_Count
 from  ldb.f_incident             a11 
   join        ldb.d_configuration_item            a19
                  on         (a11.configuration_item_key = a19.row_key)
 				  join        ldb.d_business_unit_c  a128
                  on         (a19.business_unit_c_key = a128.row_key)