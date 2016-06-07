"select a12.related_partner_c AS city_c
 from ldb.f_incident a11
 join ldb.d_incident a12
   on  (a11.incident_key = a12.row_key)

"
"select a12.city_c AS city_c
 from ldb.f_incident a11
 join ldb.d_incident a12
   on  (a11.incident_key = a12.row_key)

"
"select a12.card_proxy_info_c 
 from ldb.f_incident a11
 join ldb.d_incident a12
   on  (a11.incident_key = a12.row_key)

"
"select a11.class_c_key AS row_key,
 max(a12.dimension_code) AS dimension_code,
 max(a12.dimension_name) AS dimension_name,
 count(a11.row_key) AS WJXBFS1
from ldb.f_incident a11
 join ldb.d_incident_class_c a12
   on  (a11.class_c_key = a12.row_key)
group by a11.class_c_key
"
"select a12.upc_ean_c 
 from ldb.f_incident a11
 join ldb.d_incident a12
   on  (a11.incident_key = a12.row_key)

"
"select a12.country_c 
 from ldb.f_incident a11
 join ldb.d_incident a12
   on  (a11.incident_key = a12.row_key)

"

"select a11.line_of_business_c_key AS row_key,
 max(a12.dimension_code) AS dimension_code,
 max(a12.dimension_name) AS dimension_name,
 count(a11.row_key) AS WJXBFS1
from ldb.f_incident a11
 join ldb.d_incident_lob_c a12
   on  (a11.line_of_business_c_key = a12.row_key)
group by a11.line_of_business_c_key

"
"select a12.encrypted_data_c
 from ldb.f_incident a11
 join ldb.d_incident a12
   on  (a11.incident_key = a12.row_key)

"
"select a12.caller_state_c
 from ldb.f_incident a11
 join ldb.d_incident a12
   on  (a11.incident_key = a12.row_key)"
"select a12.contact_name_c
 from ldb.f_incident a11
 join ldb.d_incident a12
   on  (a11.incident_key = a12.row_key)"
"select a12.postal_code_c
 from ldb.f_incident a11
 join ldb.d_incident a12
   on  (a11.incident_key = a12.row_key)"
"select a12.store_name_c
 from ldb.f_incident a11
 join ldb.d_incident a12
   on  (a11.incident_key = a12.row_key)"
"select a12.timezone_c
 from ldb.f_incident a11
 join ldb.d_incident a12
   on  (a11.incident_key = a12.row_key)"
select sum(carried_over_count_c) from ldb.f_incident
