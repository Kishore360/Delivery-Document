SELECT
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT > 0 THEN 'MDS to DWH data validation failed for d_business_unit_location_c.region_c' ELSE 'SUCCESS' END as Message
FROM 
(
SELECT Count(1) as CNT 
FROM 
(
SELECT distinct a.row_key,b.business_unit_c,b.business_unit_itot_c_key,b.location_c,b.source_id,b.location_order_c,b.region_c,b.region_order_c
from png_mdwdb.d_location a 
JOIN png_mdwdb.d_business_unit_location_c b 
ON a.location_name LIKE CONCAT(location_c ,'%') where a.row_key >0 and b.soft_deleted_flag ='N' and b.location_c not in ('Sochaczew DC','Aspropyrogos','Warsaw-Targowek','Iowa City Beauty Care','Iowa City Oral Care','GoaHealth','GoaFem','BaddiB&R','BaddiFHC','St.Louis','PortQasim','CairoBaby','CairoOct6','BRMC','PRDC')
UNION
SELECT a.row_key,'SMO/DCs',@smo_dc_key,'Sochaczew DC',a.source_id,@Sochaczew_order,@Sochaczew_region,@Sochaczew_region_order
from png_mdwdb.d_location a 
where a.location_name like 'SOCHACZEW%' 
OR( a.location_name LIKE 'Warsaw Dist Ctr%' OR a.location_name LIKE 'Warsaw West DC%' OR a.location_name LIKE 'Warsaw PSC%' and a.soft_deleted_flag ='N')
UNION
SELECT distinct a.row_key,'Baby Care',@smo_dc_key,'Aspropyrogos',a.source_id,@aspo_order,@aspo_region,@aspo_region_order
from png_mdwdb.d_location a 
where a.location_name LIKE 'Aspropyr%'  and a.soft_deleted_flag ='N'
UNION
SELECT distinct a.row_key,'SMO/DCs',@bc_dc_key,'Warsaw-Targowek',a.source_id,@warsaw_order,@warsaw_region,@warsaw_region_order
from png_mdwdb.d_location a 
where a.location_name LIKE 'Warsaw%' and a.location_name NOT LIKE 'Warsaw West DC%' and a.location_name NOT LIKE 'Warsaw Dist Ctr%' and a.location_name not like 'Warsaw PSC%'  and a.soft_deleted_flag ='N'
UNION 
SELECT distinct a.row_key,'Beauty Care', @beauty_dc_key,'Iowa City Beauty Care' ,a.source_id,COALESCE( @iowa_bc_order,4),@iowa_region,@iowa_region_order
from png_mdwdb.d_location a 
where a.location_name = 'Iowa City Plant'  and a.soft_deleted_flag ='N'
UNION 
SELECT distinct a.row_key,'Health Care', @hc_dc_key,'Iowa City Oral Care' ,a.source_id,@iowa_hc_order,@iowa_region,@iowa_region_order
from png_mdwdb.d_location a 
where a.location_name LIKE 'Iowa%' and a.location_name <> 'Iowa City Plant'   and a.soft_deleted_flag ='N'
UNION 
SELECT distinct a.row_key,'Health Care', @hc_dc_key,'GoaHealth' ,a.source_id,COALESCE(@goahealth_order,4),@goa_region, @goa_region_order
from png_mdwdb.d_location a 
where a.location_name in ('GOA CONSUMER HEALTH  PLANT','GOA VIRTUAL PLANT-PGHH','GOA-MFG-P&G HEALTH LTD','GOA-PLT-P&G HEALTH LTD','GOA-VIRTUAL-PG HL')  and a.soft_deleted_flag ='N'
UNION 
SELECT distinct a.row_key,'Feminine Care', @fc_dc_key,'GoaFem' ,a.source_id,COALESCE(@goafem_order,4),@goa_region, @goa_region_order
from png_mdwdb.d_location a 
where a.location_name not in ('GOA CONSUMER HEALTH  PLANT','GOA VIRTUAL PLANT-PGHH','GOA-MFG-P&G HEALTH LTD','GOA-PLT-P&G HEALTH LTD','GOA-VIRTUAL-PG HL') and a.location_name LIKE 'Goa%' and a.soft_deleted_flag ='N'
UNION 
SELECT distinct a.row_key,'Grooming', @grooming,'BaddiB&R' ,a.source_id,COALESCE(@baddibr,4),@baddi_region, @baddi_region_order
from png_mdwdb.d_location a 
where a.location_name LIKE 'Baddi%' and a.soft_deleted_flag ='N'
UNION 
SELECT distinct a.row_key,'Fabric Care', @fabric_care,'BaddiFHC' ,a.source_id,COALESCE(@baddifhc,4),@baddi_region, @baddi_region_order
from png_mdwdb.d_location a 
where a.location_name LIKE 'Katha%' and a.soft_deleted_flag ='N'
UNION 
SELECT distinct a.row_key,'Home Care', @home_care,'St.Louis' ,a.source_id,COALESCE(@louis_order,4),@louis_region, @louis_region_oder
from png_mdwdb.d_location a 
where a.location_name LIKE 'St. Louis%' OR a.location_name LIKE 'St Louis%' OR a.location_name LIKE 'st.louis%' and a.soft_deleted_flag ='N'
UNION 
SELECT distinct a.row_key,'SMO/DCs', @smo_dc_key,'BRMC' ,a.source_id,COALESCE(@BRMC_order,4),@iowa_region, @iowa_region_order
from png_mdwdb.d_location a 
where a.location_name LIKE 'Brantford%'  and a.soft_deleted_flag ='N'
UNION 
SELECT distinct a.row_key,'SMO/DCs', @smo_dc_key,'PRDC' ,a.source_id,COALESCE(@PRDC_order,4),@iowa_region, @iowa_region_order
from png_mdwdb.d_location a 
where a.location_name LIKE 'Cesar Castillo%' and a.soft_deleted_flag ='N'
UNION 
SELECT distinct a.row_key,'SMO/DCs', @hc_dc_key,'Crux' ,a.source_id,COALESCE(@crux_order,4),@la_region, @la_region_order
from png_mdwdb.d_location a 
where a.location_name LIKE 'Seropedica%' and a.soft_deleted_flag ='N'
UNION 
SELECT distinct a.row_key,'Fabric Care', @fabric_care,'PortQasim' ,a.source_id,COALESCE(@PortQasim_order,4),@goa_region, @goa_region_order
from png_mdwdb.d_location a 
where a.location_name LIKE 'Port Qasim%' and a.soft_deleted_flag ='N'
UNION 
SELECT distinct a.row_key,'Baby Care', @bc_dc_key,'CairoBaby' ,a.source_id,COALESCE(@CairoBaby_order,4),@goa_region, @goa_region_order
from png_mdwdb.d_location a 
where a.location_name = 'CAIRO OCT VI PLANT' and a.soft_deleted_flag ='N'
UNION 
SELECT distinct a.row_key,'Fabric Care', @fabric_care,'CairoOct6' ,a.source_id,COALESCE(@CairoOct6_order,4),@goa_region, @goa_region_order
from png_mdwdb.d_location a 
where a.location_name = 'CAIRO PLANT-OCT VI - F&HC' and a.soft_deleted_flag ='N'

) SRC 
LEFT JOIN png_mdwdb.d_business_unit_location_c TRGT ON CONCAT(SRC.row_key,'~',SRC.business_unit_itot_c_key)=TRGT.row_id
WHERE SRC.region_c<>TRGT.region_c
) temp;



 
