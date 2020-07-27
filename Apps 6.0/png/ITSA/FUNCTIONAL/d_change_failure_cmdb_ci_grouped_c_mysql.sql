
select case when count(1)>0 then 'Failure' else 'Success' end as Result,
 case when count(1)>0 then 'Data Mismatch' else 'Success' end as Message
 from(
   select change_request.number,case when coalesce(ci.name,'UNSPECIFIED')= 'zh-hk.pghongkong.com_44584' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'extra975-zw1' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'PABCSC1GW' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'PARTS' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'extra085-zw1' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'exprov' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'PC and software' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'evaxtampax.es_38151' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'PEGOSCE1GW' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'PEGOSSC1GW' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'PABC-I003-MDF2' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'PEMACE2GW' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'PG Apps Center' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'eus-sqldb001' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'PG Tube v1.0 [Prod]' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'PGNetwork' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'PHC-I003-ETS2F' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'eus-pfm003' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'PHC-I017-FHC2F' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'eus-pfm002' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'PHC-I025-RTB31' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'eusrtcisesx1' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'PABC-I002-MDF1' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'P&G Enterprise Chat Bot (Lucy)' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'P&G + Microsoft Azure (IaaS) Pro' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'OX-I040-SERVRB' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'OX-I052-XC1' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'OXCE3GW' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'gadc-apaltest03' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'OXSC2GW' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'gadc-apaltest02' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'gadc-apaldrx02' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'gadc-aloha002' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'gadc-adpreport' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'One Key' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'fra-eudc500' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'fnmp006-zw2' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'Optima Tx LA UAT' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'fnmp004-zw2' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'flexlabflp-zw1' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'fixodent.fr/fr-fr_32991' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'firewall' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'Oracle BPM' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'Oracle database-server' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'Order Builder' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'febreze.co.kr/kr-KR/Index.aspx_2' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'PHC-I033-2SRVBL2' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'eus-paledo001' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'eus-mesrptbc' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'eus-mesdtabc' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'etlg1153' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'etlg1120' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'ethp2065' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'erpgntspt-prd01' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'PMK - MASCON Kronberg Production' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'PMW - MASCON Wallduern Productio' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'POM-CC01' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'POM-I050-HDL' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'entsr-zw041' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'POMCE3GW' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'emclg1' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'POMSC2GW' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'emc-wfs101' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'PPSOCE1GW' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'PPSOSC1GW' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'PQA-I001-ITRM -3' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'PQA-I002-WARE' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'PQA-I008' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'PQACE1GW' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'PQACE2GW' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'emc-vpick101' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'PLLODP01SWS002' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'OX-I012-OFF' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'etlg1162' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'etlg1163' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'PHGO-I003-L10S01' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'PHGO-I005-L11H101' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'PHGO-I007-L15H101' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'PHGO-I008-L10H201' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'PHGO-I010-L12H201' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'PHGO-I011-L14H201' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'PHGO-WC01' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'eus-mesappbc' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'eus-maxxsys001' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'PHPASC1GW' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'PHX-I002-IDFB' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'PHX-I006-IDFF' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'PHX-I007-SERVER' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'eus-agv003' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'eulg90' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'PISCES-PD-Shipping Service' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'eulg4' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'eulg10' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'etln1144' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'etln1140' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'etln1135' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'PLLODP01SWA010' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'OX-I004-CITRUS' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'gadc-argusd01' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'ORFLSH01' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'NEMC-WC01' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'gadc-esxgu025' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'NEO-France' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'gadc-esxgu017' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'NGLG-I019-GH1' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'NGLG-WC01' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'NGLGCE2GW' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'gadc-esxgu009' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'gadc-esxgu001' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'gadc-esx127' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'NLAMSB01SWE004' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'NOV-I010-B75F4A' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'NOV-I011-B2F2AR' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'gadc-esstinyurl' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'gadc-eskoaeq1' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'gadc-eskoaep1' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'gadc-eptmdb001' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'NOV-I020-B73F2V' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'gadc-enclw015' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'NOV-I034-B75F2D' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'NOV-I035-B75F3C' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'gadc-esxgu029' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'NOV-I039-B1B1AE' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'gadc-esxgu041' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'NEMC-I018-TE06A' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'NACHMS-VMN1-1SV' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'NACHMS-VMN3-3SV' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'NACHPI1GW' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'gadc-intra945' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'NACL-I004' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'gadc-intra2021' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'gadc-intra107' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'NAS-LAP001-CONF1' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'NAUP-I027-B2F2R7' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'NAUP-I051-B2F2R5' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'NAUP-I071-B2CEA' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'gadc-intra1010' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'NAUP-I181-B2F1R8' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'NAUP-I216-B1F1R1' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'gadc-gdsprd051' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'gadc-gdslog001' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'gadc-ext-sw01' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'gadc-evsq101' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'NEMC-I014-TE04C' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'NEMC-I015-TE05A' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'gadc-evs04' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'NEMC-I024-TETCC' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'PRCBJ-I141-B3F2R4' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'NOV-I044-B1E1AI' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'gadc-enclw003' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'gadc-deveca101' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'Nexthink' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'gadc-cumulus6' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'NiFi' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'Nielsen Answers desktop' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'Nigeria Payroll (VIP)' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'gadc-ctxvaldb01' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'gadc-ctlmbrzl01' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'OCT6-i003-ADMIN2-2' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'OCT6B-I004-50TC4' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'gadc-cmdcp001' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'OCT6BSC1GW-1' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'gadc-chrmadv001' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'gadc-bdnaprdv02' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'gadc-bdnaprdv01' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'gadc-balkans2' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'ORD-I156' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'gadc-autosched2' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'gadc-argusd02' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'ORDSC2GW' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'ORFL-I001-5FMDF' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'NYCBC-WC01' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'gadc-enclw010' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'NX' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'NWB-I009-B1F1A1' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'NOV-I056-B73F1R' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'NOV-I060-B73F2V' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'NOV-I066-B5F1K' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'gadc-encl029' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'NOV-I074-B4F1AM' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'NOV-I081-B73F1' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'NOV-I082-B2F3CR11' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'gadc-elnq001' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'NOV-I085-B4F1AM' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'NOV-M001-B75F4A' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'NOV-M013-B1F2I' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'gadc-edp001' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'gadc-ecmkgsp01' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'gadc-eca102' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'gadc-eca023' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'NP1 (sdln5626)' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'gadc-eca001' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'gadc-eassp101' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'NWB-I005-B1F1R1' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'gadc-dsipt012' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'gadc-dsipt010' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'NWB-I014-B2F1A6' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'NACHMS-ESXi-2SV' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'PRCC-A001-CDC' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'PRCTJ-I002-B1F1R1' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'chpa-esx001' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'chig-intra001' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'cgo-vgw012' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'cgo-vdm001' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'cgo-safcl003' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'cgo-iptsme006cn' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'cgo-cdr101' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'cg-supermrkt' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'cg-mestrnbc2' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'SAP ERP Financials - Assets - GB' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'cg-mesdatabc' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'cdl-sh-orc-zl01' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'caslx2' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'SAP PH1 (Poland)' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'cascadeclean.com/en-us_32889' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'cape-wfs004' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'SAP Quality' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'cape-web204' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'cape-web103' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'cape-meswebbc' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'cdlx.rtcis' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'chpa-esx002' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'chpa-intra001' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'chpa-mesdtabc' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'cra-whse101' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'cra-pbxaas001' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'S/4HANA Bank Account Management' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'cra-mr002' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'cra-mesdtabc' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'cra-mesappbc' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'SAC-I004-B52-C' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'cra-energ101' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'SACTCE1GW' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'SACTCE2GW' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'SANFRCE02GW' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'cra-apalprod01' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'cob-intra005' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'cnsg-mestrnbr' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'cnsg-app001' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'SAP Ariba STRM Production' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'SAP BO (Dev)' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'cmed-poputil001' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'cmed-bfm002' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'chpa-web003' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'chpa-mestrnbc' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'cape-d2dmm001' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'canetworkm-ml-691' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'SAP-AR - F5P' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'canetworkm-ml-305' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'braun.nl/nl-nl_32870' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'braun.jp/ja-jp_32868' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'braun.hu/hu-hu_41163' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'br.pg.com/pt-BR_5382' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'bpp-pbxaas001' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'bosg2gwv' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'bosg-toolworx' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'bosg-poputil002' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'bosg-metasys001' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'bosg-mestrnbr2' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'bosg-mesappbr' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'bosg-esx005' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'bosg-esx002' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'bosg-archibus' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'bos-vgw001' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'SAP-PI-Customer EDI (QA)' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'SAP-PM (NA)' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'SAP-PP (EMEA)' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'SAP-PP (LA)' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'bor-mesappbc' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'bor-esx001' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'braun.ro/ro-ro_32873' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'cra-whse102' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'brbfgwv' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'brdc-d2dmm001' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'SAP-AR - N6P 2' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'cailx.rtcis' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'cai-wfs001' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'cab-vms101' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'cab-mestrnbc' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'cab-mapledb005n' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'cab-esx001' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'c11800a51ba78c907e35ff39cc4bcba5' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'buc-safcl001' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'buc-pbxaas001' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'btc-pbxaas501' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'bru-vmcobx006' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'bru-v5eesx001' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'bru-rtcsql01' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'bru-rtcedge02' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'bru-polkali002' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'brlx2' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'brk-wfs001' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'brk-esx001' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'brio-meshistbe' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'brdc-vms001' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'brclx_rtcis' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'Retail Execution Alerts (REA)' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'Retail Connect (Wal-mart)' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'Resource Scheduler_Flexi' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'dymc-as101' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'PaaS Data Base NonProd' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'Palisade @Risk' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'Password Genie' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'dymc-apaltest02' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'dvr-vgw001' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'dvr-recipehmi' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'dvr-mestrnbc2' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'dolx6' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'dodot.es_41012' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'Ping Access - Prod' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'Ping Access - Prod Internal' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'dlmc-wfs001' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'dlmc-esx003' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'PingOne' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'ditr-i00b-sw001' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'dil-pbxaas001' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'dieu-s001-bl001' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'diak-m001-sw001' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'Procure to Pay' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'defrab02sbc003' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'dymc-wfs101' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'defrab02rtr002' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'PTLISP01RTR002' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'e7972b78db4418d08b3d5716f496193c' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'emc-vms101' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'PRCXQ-I001-B1F2R1-1' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'PRCXQ-I008-B1F2R4' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'PRCXQ-I009-B1F2R4' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'PRCXQ-I013-B1F2R7' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'PRCXQ-I017-B1F121-1' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'edefect01-zw1' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'PRCXQ-I021-B1F123' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'edciptcmsub001' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'edciptcbsaf001' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'edccmg01' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'edc-vgw003' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'edc-vgw001' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'PRG-I001-SERVRM' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'PRGA-SIS-SRX-KAR-01' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'PRGCE2GW' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'PRGYSC1GW' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'PRRI-LAP003' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'PRSJUP01SWA001' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'PRWHSC1GW' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'PSAT' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'e-Consent' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'PRCTJ-D2DMM001' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'dcp-pbxnec01' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'Quality Window (QW)' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'dam-meshisthhc' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'RONA-I010-IDFJ' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'dam-cust001' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'RONA2GW' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'dam-cdr001' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'ROT-I001-SERVC2' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'ROT-I002-TCOMC1' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'ROT-I005-HUB3C1' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'dalx4' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'dallg9' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'dallg4' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'dallg2' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'dalcrnesx2' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'cxln1005' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'RUNMKP01SWA002-1' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'RUNMKP01SWA004' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'RUNMKP01SWA005' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'RUNMKP01SWA006' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'RUNMKP01SWA007' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'cxhn1002' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'crulx.rtcis' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'dam-mestrnhhc' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'dbsql1-zw1' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'ROBUHP01SWA005-2' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'dam-wfs001' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'Queimados (qulx_rtcis)' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'RAK-I048-B1DR57' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'RAK-I055-B15R72' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'RAK-I056-B20R50' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'RAK-I057-B31R85' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'dbi-vae001' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'RAKSC1GW' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'dbi-intra001' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'RCTv4.0 - MUT (Manual Upload Too' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'dayplg9' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'RGM-A043' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'RGM-I001-B1F0R1-1' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'RGM-I002-B1F0R1' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'RGM-I006-B7F0R3' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'RGM-I015-B5F1RD' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'daycrnsw01' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'RGM-I024-B5F0RM' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'RGM-I031-SEWP' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'RGM-I033-B1F0R1' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'RGM-I034-BTFCRF0' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'RGMCE3GW' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'dam-tapemm001' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'NACHEX1GW' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'NACHEE-IN-1SV' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'gadc-intra965' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'LON-I006-H1C3' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'golx2' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'LON-I017-H4C1' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'LON-I017-H4C1-1' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'LON-I025-H9C1' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'LON-I028-H10C1' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'LON-I030-H10C2' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'LON-I031-H11C1' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'LON-I032-H12C1' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'LON-I002-H1C3' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'LON-I033-H13C1' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'gillettearabia.com/en_41524' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'gillette.it/it-it_33011' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'LON-I052-H25C1' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'LON-M102-H2C1' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'LONCE2GW' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'LONCE4GW' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'gillette.com/es-us_33022' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'LVP' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'gillette.com.au/en-au_32999' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'gillettevenus.com/en-us_33372' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'LON-CC01' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'LMSC2GW' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'golx4' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'gsdc-encl016' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'LM-I190-UODLOG' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'gsdc-encl007' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'gsdc-dr-sw01' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'LM-WC01' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'gsdc-control137' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'LMCE3GW' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'gsdc-cnlassas01' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'LMCON-I089-HDLSRV' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'LMCON-I089-HDLSRV-1' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'LMCON-I091-HDLPRO' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'LMCON-I191-PFOFC' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'gsdc-cmanssas01' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'grealicssw001_002' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'LMDC-I007-B3-OFC' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'LMDC-I008-TELCO' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'LMDC-I010-B1-OFC-1' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'LMDC-I114-B3-14' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'LMDC-I124-B2-24' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'LMDC-I224-B2-24' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'gonclv5esx103' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'Legal Hold Pro' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'Life & Career' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'Life & Career - Production Insta' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'gillette.com.ar/es-ar_39216' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'gglx.rtcis' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'MEC-I015-5F0A7' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'MEC-I017-7F0A12' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'gge-pros003' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'MEC-I033-7F5C9' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'MEC-I034-7F5C9' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'MEC-I037-8F1A15' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'gge-poputil001' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'gge-mestrnhc2' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'gge-mesapphc2' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'gge-d2dmm001' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'MECCE1GW' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'MECCE2GW' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'gen-safcl001' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'gen-rtcsbs01' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'MEQ-I006-OFPOPUP' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'MEQ-I010-CPD' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'gen-intra001' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'MEQ-I015-WWTA' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'MEQCE1GW' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'MEQCE2GW' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'MDMS: Master Data Management Sys' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'LM-I181-BLDG48' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'MDE2View Marktheidenfeld Produci' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'MCBC-LAP007' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'Lync 2010 (Server) Prod' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'MAN-A017-SPARE' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'MAN-I006-B1F1R2' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'MAN-I008-B1F1R2' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'MAN-I010-B1F1R1' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'MAN-I017-B1F0R4' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'MAN-I032-PREPCNTR' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'MAN-I033-B1F0RA' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'gillette.co.il/he-il_41571' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'MANCE4GW' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'gglx4' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'MAP (PROD)' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'MAR-HC-MK-AOS11' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'MAR-HC-PK-VCT' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'MARP-CC01' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'MARP-I011-SNWMAN' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'MARP-I040-CASETA' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'MARPSC1GW' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'MBRAP-I006-B3F2C5' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'MBRAP-I009-MDC' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'MBRAPCE1GW' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'MD - Master Data' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'LM-I151-CONSTR' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'LM-I119-DOCK1' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'LM-I111-HDLULF' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'KRO-I047-HC' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'hkg-pbxaas001' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'KRO-I076-AB' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'KRO-I090-AM' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'KRO-I092-AN' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'KRO-I099-H' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'KRO-I105-HB' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'KRO-I151-TT' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'hhp-pbxaas001' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'KRO-M006-A' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'herbalessences.co.uk/en-gb_33085' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'KRSELP01RTR001' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'KRSELP01SWA002-1' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'KRSELP01SWA003-1' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'headandshoulders.sa/ar_41309' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'headandshoulders.ru/ru-ru_41170' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'headandshoulders.pl/pl-pl_41366' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'L6A' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'headandshoulders.it/it-it_41221' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'headandshoulders.com.tr/tr-tr_41' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'LA-Chile-SANTIAGO BC-SBC-17F-325' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'hplx6' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'LA-Colombia-BOGOTA GO-Bogota GO-' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'KRO-I029-RA' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'hub-esx001' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'KEL-A001' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'KHA' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'hyd-mestrnhc' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'hyd-mesapphc' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'hyd-locdev01' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'KIEVSC1GW' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'KLD' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'hugp-poputil001' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'hugp-pcc-app' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'KNIME Server on premise PROD' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'KP-I001-SERVER' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'hugp-meshistbc' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'hugp-mesappbc' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'hugp-lottrig001' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'KP-I030-B98R98' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'KP-I042-B10R22' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'KP-I044-B91R91' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'KP-I128-BLD8CF1' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'KP-I129-SERVB2F2' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'hugp-grp-db' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'hub-meshistbe' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'KRGOSC1GW' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'MEQSC1GW-1' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'headandshoulders.co.in/en-in_410' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'hairrecipe.jp_31164' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'LDZ-I017-LMCPC1' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'gsr-mesdtahhc' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'LDZ-I022-LMCAP4' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'adln9368' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'LDZ-I044-LMCBOA-DECOMM-20181101' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'gsdc-xa7ds002' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'LDZ-M0010-LMCBX' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'LDZ-M008-LMCSW' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'LDZCE1GW' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'LISCE2GW' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'LM-3PAR72134_MAIN' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'gsdc-pgdc501' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'LM-I010-SERVER' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'LM-I011-NSPINE' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'LM-I022-SUD2' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'LM-I023-SUD3' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'LM-I026-SUD6' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'LM-I031-DOCK2' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'LM-I091-HDLPRO' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'gsdc-gpcsp001' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'LM-I101-LFEPRC-1' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'LDZ-I016-LMCBOI' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'headandshoulders.ca/fr-CA_33028' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'LDZ-I015-LMCBOD' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'gsr-meswebhhc' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'h2py1z2-w10' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'gzu-vae001' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'LBN-I016-B1F0R1' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'LBN-I051-B1F0R5' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'LBN-I061-B2F0R6' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'LBN-I142-B1F0R2' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'gzu-a001' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'gylx2' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'LBNSC2GW' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'gwmrcsqlp1-zw1' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'gua-vae001' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'gsr-wfs001' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'LDZ-A003' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'LDZ-A009' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'LDZ-A049' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'LDZ-A051' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'LDZ-ASSET004' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'LDZ-CC02-LMC02' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'LDZ-I010-LMCBX' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'gsr-poputil001' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'gsr-pbxava01' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'gsr-mestrnhhc2' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'MEWA - Migrate Easy Way in ADW' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'MGSD-I001-MDF01' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'MGSDCE2GW' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'MXSPGP01RTR001' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'MXSPGP01SWC001' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'MYGO-I001-SRV' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'gadc-sqld011' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'gadc-sqlanaly01' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'gadc-spfwsvp02' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'gadc-spfwsvp01' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'gadc-siebel112' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'gadc-secdb01' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'Master Data Sync (MD Sync)' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'gadc-scv002' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'Master Minder Prod (Decommission' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'MasterMinder - TST Datafabric PR' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'gadc-rptsfdb01' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'gadc-resschp01' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'MathCAD' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'gadc-prov002' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'gadc-plmgq001' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'gadc-pgdc500' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'gadc-payroll03' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'MediaTools' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'MXNDJP01RTR001' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'Meeting Services' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'MXNALP01RTR001' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'MXMILCE1GW' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'gadc-sslpki001' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'MXHXCP01RTR002' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'gadc-ss009' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'MXHXCP01SWA003' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'gadc-sqspool002' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'gadc-sqlvc001' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'MXHXCP01SWC001' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'gadc-sqlp028' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'MXMIL-A114' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'MXMIL-A115' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'MXMIL-A116' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'MXMIL-C009' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'gadc-sqlp020' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'gadc-sqlp014' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'MXMIL-I002' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'MXMIL-I010' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'MXMIL-I016' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'gadc-sqlp010' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'MXMIL-I019' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'MXMIL-I025-EC9' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'MXMILCC1GW' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'gadc-sqlp005' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'MXHXCM01FWL001' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'gadc-p2pc01' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'Microsoft LYNC Phone Edition (20' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'NACH-I003' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'gadc-meassas01' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'gadc-mace003' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'gadc-lstappsrv1' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'NACH-ST-1ACRONIS' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'gadc-lsp01' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'gadc-lmss004' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'gadc-lmsq006' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'gadc-limsesx01' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'gadc-ldapqa003' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'gadc-ldapprd003' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'gadc-ldapprd002' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'gadc-lccs010' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'gadc-labvntgd01' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'NACH1GAISE' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'gadc-kofaxsql01' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'gadc-kofaxcap01' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'gadc-irs001' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'gadc-irisp001' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'NACHDV1GW' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'gadc-irisd001' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'gadc-mega006' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'gadc-ort014' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'gadc-mimsprod01' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'NA-USA-FAYETTEVILLE SO-CBC-1F-22' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'gadc-ort013' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'gadc-ompvp002' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'gadc-ompvfs03' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'gadc-omp013' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'Microsoft One Drive for Business' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'Microsoft Outlook' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'gadc-omp012' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'Microsoft Project Professional' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'gadc-omp006' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'gadc-omp003' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'Microsoft Visio' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'Mozart' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'gadc-nilic01' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'gadc-msols01' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'My Total Rewards' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'MyPGS ServiceNow - IT Support Fo' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'MySAP SIP' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= '' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'N6A' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'NA-USA-CHICAGO SO-CBC-9F-Video C' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'NA-USA-CINCINNATI GO-C-1F-209-Ro' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'NACH-GA-DHCP-W1-F' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'boomi-z31' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'MTOSC1GW' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'MTEPCE1GW' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'MICD-I012-MAPLE-1' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'MICD-I023-PSG5' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'MICD-I032-DC2' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'MICD-I043-DTCTR' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'MICDI1GW' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'gadc-wfs002' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'gadc-wfs001' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'MINNSC1GW' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'gadc-wercdbp002' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'MITDCE3GW' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'MKTCE3GW' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'MMI-A004' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'MMI-A040' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'MMI-I021-B2F0R2' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'MMI-I031-B3F1R3' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'gadc-vtdc501' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'gadc-vmback02' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'MMPQ (Market Measurements Panel ' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'gadc-viasqld' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'gadc-v6vc002' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'MOS-3PAR7072' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'gadc-wfs003' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'MOS-3PAR7073' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'gadc-wikiprd01' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'gat-intra001' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'geb-mestrnbc1' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'geb-maple102n' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'MHF-I001-B1F0R1' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'geb-esystem01' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'MHF-I007-B1G1R2' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'geb-esx004' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'gbs-ora004' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'MHF-I019-B1F1R9' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'MHF-I020-B1F1R9' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'MHF-I022-B1F2RA' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'MHF-I024-B1F2RB' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'gbs-mesapphc' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'MHF-I029-B2F0RE' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'MHF-I031-B1F0RG' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'gblx2' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'gbe44nta' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'gbay-sqlp001' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'gbay-proficy002' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'gbay-meshistfc' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'MHFCE3GW' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'gb-mesappfc' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'gadc-wpad001' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'MTEPCE2GW' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'MOS-I008-METBC5' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'gadc-v6vc001' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'MP-WC01' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'MPC-I007-wkshop' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'MPCE1GW' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'MPCE2GW' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'gadc-tracesql01' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'gadc-torrmxsql' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'MPWH-I100-IDF-C' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'MPWH-I109-IDF-M' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'MPWH-I111-IDF-O-1' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'MPWH-I122-IDF-Z' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'MSA Accounting' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'gadc-tcuautmsc1' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'MSA Reporting' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'gadc-tcuamsc1' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'MSI (Market and Share Insights)' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'MSMO-I001-SERVER' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'MSMO-I002-SERVER' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'MSMOCE1G' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'gadc-tcpartsq1' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'MSMOSC1GW' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'MSMOSC1GW-1' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'MP-M002' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'MOS-I009-METBC5' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'MP-M001' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'gadc-tracvs001' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'gadc-v4esx104' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'gadc-v3esx001' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'gadc-udwsql01' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'MP-I021-5-1' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'MP-I026-14-1' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'MP-I031-24-1' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'MP-I033-42-1' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'MP-I041-32-1 -1' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'MP-I043-25-1' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'MP-I044-25-1' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'MP-I050-11-1' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'MP-I073-8-2' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'MP-I076-11-2' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'MP-I079-12-2' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'MP-I080-13-1' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'MP-I086-16-3' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'MP-I091-23-1' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'MP-I092-23-2-1' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'gadc-trimsql01' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'MP-I122-45-2' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'MP-I133-B41-1' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'MP-I139-B83-3' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'hydlx2' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'SAP-QM (AP-A6P)' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'SAP-QM (NA)' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'WCMC-I007-TETCS' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'azl-davinci14' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'WCMC-I013-TE01F' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'WCMC-I022-Serv1' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'azl-davinci04' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'WCMCCE3GW' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'WDC-I008-IDFJ' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'WDC-I015-IDFR-1' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'WDC-I017-GRDSHK' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'azl-davincipr01' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'WDC-I028-TEJ1' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'WDC-I036-TEQ1' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'WDC-I042-SERV1' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'azl-davinci016' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'WDC-WC01' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'azl-arguspdb01' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'azl-argusdb01' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'azl-adln9392' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'WGPCE1GW' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'WH-I007-BC1N15' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'WDC-I034-TER1' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'WARCE3GW' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'WAR-I021-MOB' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'WAR-I016-CUBE' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'azl-shrwlsd01' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'VPL-I056-NIDF2SW' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'VPL-I057-NWHSP1' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'VPL-I115-B1F0R1' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'azl-shrorade01' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'VPL-WC01' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'azl-sdln2687' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'azl-satispedprd' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'Veeva Vault' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'Venafi' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'Vertex O-series -TaxEngine (Prod' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'azl-micddb' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'azl-loomsys12' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'WALMGWE2' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'azl-endh301' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'azl-elnorap01' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'WAR-I002-MOB' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'WAR-I004-MOB' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'azl-elnorad03' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'WAR-I009-MOB' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'azl-efcdbp01' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'WH-I008-MDF' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'WH-I009-BC3E60' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'WH-I010-FE1C19' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'azl-adln9279' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'WLD-I002-SERV1' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'WLD-I004-D1' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'WLD-I007-l1A' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'avlx1' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'WLD-I011-A1C' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'WLD-I012-B1' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'WLD-I013-E1B' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'WLD-I014-E1' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'avl-pbxava001' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'aussie.com/en-us/_32837' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'auep-intra001' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'WLD-I023-M1' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'WLD-I033-S1' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'auditdb-zw1' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'WLD-I036-I1B' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'aubalicssw003_004' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'au.braun.com/en-au_32851' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'WLD-I038-F2' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'WLD-I043-WF0' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'atlmc-vms101' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'WLDCE3GW' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'WLD-I001-G' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'azl-solcpdr012' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'avm-mesappbc' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'WH-WC01' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'WH-I014-FE4N11' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'azl-adln9246' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'WH-I022-S2S39' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'WH-I028-FC2C47' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'aza-APCSInetF5LBProd-01' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'ay-wfs001' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'WH-I035-FC2C15' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'WH-I042-BAN161' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'WH-I044-BB3N78' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'WH-I049-BB2S06' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'WH-I051-FWT28' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'ay-mesdata002' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'axrtcisesx1' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'WH-I070-BB3S59' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'avm-web005' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'WH-I074-BC4SZ' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'avm-mestrnbc' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'WH-I078-W1A16B' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'WH-I081-FWBNK' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'WH-I101-SOLV' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'WH-M090-MDF_A' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'avm-meshistbc' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'azw-abdagilep01' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'VNGOSC1GW-1' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'VNGOSC1GW' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'bdc-ibadev002' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'bdc-gts101' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'bdc-extra195' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'VCR-EUR-Romania-BUCHAREST GO-1F-' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'bdc-extra150' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'bdc-esxlnx002' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'bdc-esxagl001' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'bdc-encl049' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'bdc-encl047' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'bdc-encl040' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'bdc-encl031' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'VCR-EUR-SUI-GENEVA GBC-F-1 24 Di' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'bdc-emfgh001' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'bdc-elnp002' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'bdc-dsipt020' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'bdc-dsipt012' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'bdc-dr-sw01' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'bdc-doapoap001' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'bdc-dachplog01' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'bdc-ctxlimsq01v' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'bdc-css001' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'bdc-imc002' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'bdc-control107' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'bdc-intra1068' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'bdc-intra1235' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'VCR-AMA-Vietnam-HO CHI MINH-11F-' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'bdc-ocsfs001' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'VCR-APAC-Japan-KOBE GO IC-5F-Fuj' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'bdc-nexp110' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'VCR-APAC-South Korea-SEOUL GO-37' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'bdc-mfgnet001' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'bdc-mace002' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'bdc-limsesx01' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'bdc-ldapprd008' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'bdc-kofaxsql01' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'bdc-kfxkcns01' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'VCR-EUR-France-PARIS GO-2F-A13-C' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'bdc-k2qa01' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'bdc-k2dbqa01' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'bdc-iptcmsub008' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'bdc-iptacs002' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'bdc-intra963' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'bdc-intra941' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'bdc-intra668' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'bdc-intra2012' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'bdc-intra124' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'bdc-intra1230' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'WLDCE4GW' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'bdc-cax002' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'bdc-apdc520' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'bag-vgw002' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'VCR-NA-USA-WHBC-C6090-2F-E58-Cap' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'VCR-PRVT-AMA-UAE-DUBAI GO-Phase ' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'badlx2' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'badlx.rtcis' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'VCR-PRVT-EUR-Belgium-BRUSSELS-1F' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'azw-wg32datman' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'azw-utsp01' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'azw-shriisd01' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'azw-r2r01' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'azw-mpsqadb' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'azw-mega004' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'VCR-PRVT-GC-China-GUANGZHOU GO-A' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'azw-finsol01' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'VCR-PRVT-LA-Panama-PANAMA GO-Tow' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'azw-cmdbp002' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'VCR-PRVT-NA-USA-WashDC-5F-Small ' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'VGUA-I007-SERVER' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'azw-cdnceddbs01' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'VNDBPCE1GW' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'VNDBPCE2GW' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'VCR-NA-USA-SEATTLE SO-Chihuly-Ca' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'bdc-apdc521' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'VCR-NA-USA-SEATTLE SO-CBC-1F-Sea' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'VCR-NA-USA-MASON BC-CF-2F-310-Ca' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'bdc-apaltest001' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'VCR-EUR-UK-NEWCASTLE IC-GF-Main ' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'bdc-3par8872' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'bdc-126-sw01 irf' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'bcru-poputil001' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'bcru-mestrnbc' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'VCR-EXEC-EUR-SUI-GENEVA GBC-F1-W' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'VCR-EXEC-NA-USA-CINCINNATI GO-C-' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'VCR-EXEC-NA-USA-WHBC-B6280-4F-C3' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'VCR-GC-China-BEIJING IC-1F-1460-' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'bclx.rtcis' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'bc-wfs001' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'bc-mestrnbc' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'bc-meshistbc' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'bc-esx003' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'bc-esx001' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'VCR-GC-Taiwan-TAIWAN GO-7F-A08 A' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'VCR-GC-Taiwan-TAIWAN GO-7F-A12 T' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'VCR-LA-Brazil-LOUVEIRA PLT-GF-Pa' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'VCR-LA-Panama-PANAMA GO-Tower 5-' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'VCR-NA-USA-CINCINNATI GO-C-1F-20' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'bajlx.rtcis' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'VCR-AMA-UAE-DUBAI GO-Phase 3-1F-' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'atllg1' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'atlcrn-vsautil' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'adlg8272' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'aka-mesdatabc2' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'aka-mesappbc' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'aka-intra001' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'aka-fm001' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'adln2735' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'airwatchcc-zw1' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'adln2802' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'adln2840' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'aka-meshistbc' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'aeprimesw01' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'adln5600' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'aelx8' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'adln5719' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'aelx2' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'adln5725' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'aelg11' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'ae.braun.com/en_39236' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'adlvm0001' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'adln5745' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'adln5593' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'aka-mesrptbc' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'adlg8253' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'adlg8244' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'adlg3942' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'adlg3944' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'adlg3948' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'ale-wfs001' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'adlg3960' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'adlg3961' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'adlg3964' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'ale-mestrnbe' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'adlg3971' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'adlg3972' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'adlg3978' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'ale-intra001' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'adlg5734' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'adlg5763' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'adlg5764' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'aka-wh001' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'adlg8211' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'adlg8213' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'aka-wfs001' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'adlg8227' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'adlg8229' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'adln5746' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'adln9412' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'adln5750' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'adln5751' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'adln9283' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'adln9287' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'adln9393' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'adln9392' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'adln9293' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'adln9305' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'adln9374' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'adln9373' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'adln9314' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'adln9315' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'adln9372' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'adln9371' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'adln9333' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'adln9338' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'adln9347' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'adln9348' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'adln9361' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'adln9362' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'adln9363' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'adln9370' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'adln9365' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'adln9282' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'adlg3936-zl1' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'adln9280' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'adln9271' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'adln5752' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'adln5753' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'adln9408' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'adln5771' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'adln5772' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'adln6503' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'adln6592' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'adln6650' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'adln9405' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'adln6722' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'adln9399' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'adln9246' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'adln9247' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'adln9251' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'adln9397' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'adln9255' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'adln9259' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'adln9396' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'adln9395' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'adln9268' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'adln9269' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'adln9394' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'adlg3936' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'adlg3929' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'allx4' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'amw-wnes11' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'amw-venafiweb01' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'WorkFusion - AR Cash Application' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'WorkFusion Automation - AR Claim' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'Workfusion - Legal IP' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'Workfusion Automation - Planning' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'WorldWide Market Data (WWMD)' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'amplg6' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'amisc2gw' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'ZASTN-I003' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'ZASTNCE3GW' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'ZASTNCE4GW' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'ami-vae001' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'ami-poputil002' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'abn-apps001' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'ami-pfmprod002' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'abn-esx007' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'abn-hvac001' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'abn-lanswpr' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'ad01a2c' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'ad01b1c' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'Wireless Controller Cisco 5520' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'adc-encl008' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'Wireless Area Network - P&G Mana' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'WinBDE' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'WOM (Web Order Management)' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'WOR-I007-BCF2C3' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'WOR-I011-BBF1C2' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'WORCE3GW' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'WORSC2GW' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'WVWCE1GW' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'asn-safcl001' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'WWPROCESS' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'ariel.in/en-in_32812' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'Warehouse Analytics' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'ariel.co.uk/en-gb_32827' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'WebCC' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'api-tapemm001' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'api-meshistbe' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'api-maplehdl' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'anp-vgw004' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'WebEx Productivity Tools' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'Webcenter (ENOVIA plugin)' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'andmsc1gw' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'andm-wfs001' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'Wide Area Network (WAN)' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'andm-mesdatabe' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'atlcrnesx2' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'adc1extrace' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'ade11dbadm06' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'alx-mesrptfhc' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'alx-mesdatafhc' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'alx-mdchisthhc' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'alx-esx001' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'adlg3845' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'alx-engcsrv59' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'alx-engcsrv116' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'alx-engcsrv113' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'alx-engcsrv111' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'alx-engcsrv110' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'alwaysdiscreet.de/de-de_40798' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'alwaysdiscreet.com/en-us_38191' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'alwaysdiscreet.co.uk/en-gb_38190' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'alwaysdailies.eu_38760' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'adlg3869-zl1' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'altlxsw01' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'adlg3899' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'adlg3903' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'adlg3906' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'adlg3920' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'adlg3921' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'amb-ups001' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'ami-pfmbkp002' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'adlg3829' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'ami-data006' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'ami-pfm001' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'ami-pdpdev001' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'ami-maple12n' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'ami-maple013' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'adhn5668' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'adlg2979' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'adlg2982' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'ami-intra001' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'ami-hdlhist02' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'ami-esx008' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'adlg3601' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'adlg3602' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'ami-esx007' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'adlg3612' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'adlg3616' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'adlg3621' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'adlg3633' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'ami-esx006' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'adlg3822' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'adlg3823' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'ami-esx005' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'amc-pbxava003' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'bdc-onekey004' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'bdc-pbxava102dm' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'VCR-AMA-Philippines-MANILA NETPA' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'SVDC3SC1GW' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'SW-I016-U-1-002' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'SW-I031-B-1N-005' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'SWA-I002-TEC2L0' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'SWA-I007-TECJLL' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'bdln7689' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'SWA-I010-TEC1L2' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'bdln7670' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'bdln7666' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'SVDC3CE1GW' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'SWA-I014-TEC1L6' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'bdln6597' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'bdln2828' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'SWA-I031-S4F0R7-2' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'SWA-I033-CASINO' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'SWA-M007-BOILER' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'SWACE2GW' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'SWASC1GW' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'bdln2819' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'bdln2780' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'SWA-I015-TEC1L5' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'SV-WC01' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'SV-LAP001-100-2' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'SV-I010-100-2' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'bdlx4089' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'SPB-I025-NPCK' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'SPBCE1GW' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'SPBSC1GW' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'bdlx4014' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'bdln9276' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'SRM (Strategic Revenue Managemen' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'SRM Revenue Pulse' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'bdln9150' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'bdln9109-zl' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'STKCE1GW' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'bdln9109' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'STL-I014-TE61-2' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'STL-I015-TE61-3' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'STL-I023-TE1-1' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'STL-WC01' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'STORAGE1' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'bdln7719' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'bdln7718' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'SV-I007-100-7' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'SV-I008-100-8' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'bdln2778' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'bdln2747' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'Scorecard Ordzhonikidze Ukraine ' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'bdln2730' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'bdlg3478' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'Spotfire Platform' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'Spotfire Platform - Production I' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'Spotfire Server (Test)' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'Spotfire Server (Test) 2' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'bdlg3435' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'bdlg3433' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'bdlg3432' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'bdlg3414-zl1' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'bdlg3410' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'Symphony GOLD - Apollo Space Pla' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'bdlg3405' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'Systems Engineering' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'bdlg3391' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'bdlg3385' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'T&W BI FP Ground NA' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'bdlg3359' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'T&W BI Ocean&Air FP RPMI/ RPMI G' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'TACSCE1GW' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'TADCE2GW' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'TADSC1GW' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'bdlg3491' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'bdp-vgw001' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'Skybox Firewall Assurance (Prod)' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'SiteScope v11.33- Production Ins' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'Security Services: Authenticatio' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'bdln2693' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'bdln2647' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'Sentinel' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'bdln2611' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'bdln2516' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'bdln2489' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'bdln2487' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'bdln2470' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'bdln2457' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'ServiceNow - HR BSR Case' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'bdln2398' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'bdln2212' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'bdln2036' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'SharePoint Online Provisioning' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'bdln2035' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'Shipments Mix' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'Shipping Documents â€“ Exstream (X' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'ShortLink' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'bdlg7763' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'bdlg7735' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'bdlg7734' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'SPAR-I009-B1F1A3' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'SPAR-I003-B1F0R2' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'bdu01a2e07' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'SEMC-I016-Serv1' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'SEMC-I017-Serv2' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'SEMCCE3GW' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'SEMCSC1GW' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'bkk-d2dmm001' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'SESTOP01RTR001' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'SESTOP01WLC001' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'SET3 -- My Stock Options/Future ' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'SEW-LAP003' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'bjn-pbxaas101' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'SG-APDCE01' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'bjn-pbxaas001' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'SGCLEB01RTR002' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'SGGO-I001-L18S01' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'SGGO-I002-L18S02' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'SGGO-I003-L18S03' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'SGGO-I004-L18H01' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'SGGO-WC01' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'SGGOCE1GW' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'SGIC-I001-DC101' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'SGIC-I014-L4H21' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'SEKSC1GW' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'SGICCE1GW' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'bkk-esx001' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'bkk-mesappbe' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'bogosc1gw' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'bman-simplex101' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'bman-intra101' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'bman-esx002' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'blov-web003' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'SAP-SD (Order Management) - A6A' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'blov-smv003' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'SAP-SD (Order Management) - F5P' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'blo-d2dmm001' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'blin-sql005' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'blin-quantum02' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'SAP-SD (Shipping Documents) - N6' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'blin-mestrnbr2' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'blin-mesrptbr2' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'SAP-SD (Shipping) - F6P' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'blin-mesappbr2' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'blend-a-dent.de/de-de_32990' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'bkl-rtcsbs01' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'bkk-mesdatabe' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'SAT' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'SAT (Segmentation Analysis Tool)' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'SDHN5476' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'bdlg3343' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'SGICSC1GW' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'SGSINP01RTR001' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'bell-whids001' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'SHI-I011-1FCCR' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'SHI-I012-MEZAIN' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'SHI-LAP060-CORR3F' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'bell-mhdrn01n' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'SHISC1GW' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'bell-mestrnbc' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'bell-mesrptbc' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'SKBTSP01WLC001' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'SKE-I316-C29-HBCRANE06U' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'SKE-WC01' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'bell-int04n' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'SKESC1GW' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'bell-int04' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'bell-famdas01n' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'bell-enclw003' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'SMTP Backbone v0.0- Production I' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'beedclbpgco001' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'SNKDCE2GW' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'bdu01a3c' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'SOFSC1GW' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'belx.rtcis' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'SGSINB01SWE001-2' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'ber-pbxaas002' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'beu-mesappfc' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'SGSINP01SWA002' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'SGSINP01SWA004' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'SGSINP01SWA011' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'SGSINP01WLC001' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'bic-safcl002' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'SGTU-I004-B2F1C2' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'bic-pbxaas001' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'SGTU-I008-B1F2C1' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'bhp-pbxaas001' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'SGTU-I012-B2F2C1' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'SGTU-I014-SRVR1' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'bhlx2' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'SGTUSC1GW' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'bhlx.rtcis' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'bgo-pbxaas002' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'beu-web001' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'beu-vmspwrfleet' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'SH - Direct Shipments Swiffer 2.' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'beu-prof-dc' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'beu-mestrnfc' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'beu-meshistfc' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'SH - Regional FSR (Financial Shi' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'bdlg3330' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'TAISC1GW' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'TAK-I003-LUPIN' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'USCLTP01WLC001' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'bdc-siebel220' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'USCUEP01SWA001' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'USCUEP01WLC001' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'USCVGP02SWA002' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'USCVGP02SWC001' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'USCVGP02WLC001' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'USCVGP03WLC001' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'USCVGP04SWA001' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'USCVGP04SWC001' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'USCVGP04WAP019' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'bdc-siebel211' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'USEDPP01WLC001' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'bdc-siebel138' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'bdc-siebel114' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'USFAYP01WLC001' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'bdc-sdc001' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'USGRRP01SWA001' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'USGRRP01WLC001' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'USMESP01RTR002' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'USMESP01SWA001' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'USCLTP01RTR001' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'USMESP01SWC001' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'USCHIP01WAP006' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'USCHIP01RTR002' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'UETSC1GW' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'UK TPM Add-on' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'UKWYCE1GW' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'UKWYCE2GW' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'UNIX' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'bdc-trimsql01' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'bdc-tarchsqldev' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'bdc-tarchsql01' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'bdc-tarchfa01' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'USAUEP01RTR001' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'USBNAP01PDU001' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'USBNAP01SWA001' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'bdc-sqlp032' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'bdc-sqld044' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'bdc-sqladr009' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'USBOIP01SWA001' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'USBOIP01WLC001' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'USBOSP01RTR001' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'USBOSP01SWA008' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'bdc-spfoaq01' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'USCHIP01RTR001' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'USCHIP01SWA002' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'bdc-v4esx043' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'USMESP01WLC001' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'USNJCP01SWC001' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'UTBE-I016-TE72-2' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'UTBE-I024-TEGS-1' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'UTBE-I031-TETRLD' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'UTBE-I032-TETRLD' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'UTBE-I033-TEBS-1' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'UTBE-I038-B42F1' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'bdc-rtcedge05' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'UTBECE1GW' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'bdc-rtcdir06' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'VALLPCE1GW' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'bdc-rtcav04' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'VALP-I007-TORRE1-2' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'VALP-I013-DOWNY' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'VALP-I024-MERQ' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'VALP-I030-BOD4CH' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'VALP-WC01' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'VBQ-I002-CR1' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'VBQSC1GW' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'VCR-AMA-Australia-SYDNEY GO-4F-4' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'bdc-qpcsa313' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'VCR-AMA-Indonesia-JAKARTA GO-14F' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'bdc-rtcedge06' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'USNJCP01RTR001' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'UTBE-I004-TE11-3' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'USZDCP01SWC001' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'USNTAP01RTR001' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'bdc-scc001' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'USORLP01WLC001' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'USPVEP01RTR001' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'USPVEP01RTR002' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'USSACP01RTR001' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'bdc-sbc003' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'USSEAP01SWA001-3' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'USSEAP01SWC001' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'USSEAP01WLC001' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'USSJBP01SWA001' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'USSJBP01WLC001' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'bdc-sapex003' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'USWASP01SWA001' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'USWASP01WLC001' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'USXCLP01RTR001' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'USXCLP01RTR002' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'USXDCD01FWL02' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'bdc-rtcsql102' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'USXEZP01SWS002' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'bdc-rtcsql101' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'USZDCP01WLC001' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'SAP-QM (LA)' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'bdc-v4esx503' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'Transportation View Prod (Asia A' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'THBKKP01SWA007' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'THP-I004-CR1SB3' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'THP-I021-CR8AH1' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'THP-I042-CR15' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'THP-WC01' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'THPCE3GW' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'THPD-I031-CR1C1' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'bdhp4462' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'bdhp4430' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'bdhp4379' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'bdhn9104-zl01' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'bdhn2772' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'bdhn2771' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'bdhh3070' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'bde5-exadata' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'bde12dbadm01vm1' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'TOM MOD 2 MD Reporting' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'TOPSPRO' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'TOR-I005-IDF01' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'TOR-I006-IDF02' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'TORCE3GW' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'THBKKP01SWA004 ' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'TORSC1GW' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'bdhp4603' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'TFTS (QA)' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'TAK-I005-PBXRM-2' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'TAK-I008-FACBDG' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'TAK-I010-LIQOFF' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'bdlg3319' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'bdlg3318' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'bdlg2917' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'TAK-I020-GBDG' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'bdlg2892' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'bdlg2848' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'bdlg2837' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'TAK-M001-MACHRM' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'TAK-WC01' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'TAKSC1GW' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'bdlg2604' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'bdlg2551' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'bdlg2122' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'bdhp6250' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'TCF QA' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'TDC-A001' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'bdhp4806' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'TFTS (PROD)' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'THA-I004-HR20' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'bdc-v5esx001' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'bde11-exadata' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'TRGEBCE1GW' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'bdc-voiceutil01' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'TSSS (Tibco Spotfire Statistics ' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'TWBI FP Ground ASIA Prod' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'Tableau Desktop Professional' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'Talent Engine' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'Talent Supply & New Hire Ticketi' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'Tax Solution' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'Teamcenter Production' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'bdc-vmback02' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'bdc-vgw015' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'Tenable Scanning Solution' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'TenableScanner-01' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'Terra Platform' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'bdc-var001' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'bdc-vaemas002' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'bdc-vaecms001' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'Transportation Cost Forecasting' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'bdc-v5vc002' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'Transportation Forecasting (Terr' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'Transportation Management' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'bdc-v5esx501' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'TSCE2GW' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'TRGEB-WC01' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'bdc-voiceutil02' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'bdc-wmiis01' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'TRGEBP01RTR001' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'TRGEBP02RTR001' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'TRIOS (2.3.0.1408) Shiga Product' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'TRISTP01RTR001' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'TRKCOP01RTR001' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'bdcrnesx3' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'bdciptcmclr001' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'TS-I003-100-1' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'TS-I005-100-2' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'TS-I006-100-4' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'TS-I014-400-11' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'bdc-xcas001' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'TS-I020-400-10' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'TS-I036-700-7' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'TS-I038-700-11' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'TS-I040-700-10' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'bdc-xa7wi001' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'bdc-xa7qadac002' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'TS-M001' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'TS-MCA-ALICS-SVR-1' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'TS-MCB-ALICS-SVR-1' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'TS-i001-10-1' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'hydlx4' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'gsr-app1' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'hyg-agv001' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'CAPE-I093-I21DC-1' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'seralicssw001_002' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'CAPE-WC02' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'CAPEGCE01GW' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'CAPESC1GW' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'semc-wfs001' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'semc-as101' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'sdz5-sdz6' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'sdln9252' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'CAPE-I071-I64A1' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'CBOG-I003-USER' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'CBOGSC1GW' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'CCBCSC1GW' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'sdln6574' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'sdln6439' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'sdln5503' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'sdln2808' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'sdln2227' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'sdlg8513' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'sdlg8508' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'sdln6690' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'CFR GLOBAL 10.0 (PROD)' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'CAPE-I069-I62A1' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'CAPE-I062-I53A1' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'Boomi-SimplementToMidas Producti' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'Boomi-Solace-ICCS Production' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'sgkdhdfpgco007' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'sgc-pbxaas001' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'Boomi-eContent' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'Box.com' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'Box.com (Prod)' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'sg-v5esx103' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'sg-v5esx100' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'CAPE-I063-I53B1' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'Business Planning and Reporting' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'sg-v5esx001' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'sg-v4esx100' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'sg-tenable02' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'sg-tenable01' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'CABRNP02RTR001' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'CAPE-I011-I06A1-1' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'CAPE-I029-I28A1' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'sg-hputil001' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'CAPE-I055-I52A1' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'Business Pulse 1.0 PROD' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'sdhn5569' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'CGO-CC01' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'CHBC-I015-P17' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'CNBOCE1GW' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'sdc-vgw007' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'CNCOSC1GW' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'CNCSC1GW' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'sdc-vgw005' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'CNHAP-A002' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'CNHAP-A107' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'CNHAP-I002-MAIN' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'CNHAP-I007-PDD' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'CMK Data Platform Release 1.0 - ' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'CNHAP-I033-HABC' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'CNHAPCE1GW' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'sd01b1c' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'CNHAPCE4GW' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'scv001-zw1' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'CNHAPSC2GW' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'CNLG-I003-SVRITRM1' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'CNLG-I015-SVRITRM2' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'CNLG-I017-EWMS' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'savdc-dns-na01' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'sdc-rtcsql102' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'CMEDSC1GW' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'sdciptcbsaf001' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'sdciptcmsub001' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'CHBC-I025-P20' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'CHBC-I026-P17' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'CHBC-I028-P20' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'CHBCSC1GW' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'CHIGSC1GW' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'CHNCSH01' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'sdhn2029' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'CHPA-I019-E2F1R5' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'CHPA-I021-B2F1A1' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'CHPA-I041-B4F1A3' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'sde3-exadata' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'CHSHRP01RTR001' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'CHSHRP01WLC001' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'CIMAT' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'CINCE2GW' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'sde2db01' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'sde2cel14' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'CMDB (Customer Master Data Base)' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'CMED-I001-ADM01' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'sde1-exadata' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'sdciptsmpub001' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'Boomi-SimplementToMidas' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'CNPDGB01FEX001' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'Boomi-SNOW-OT-Integration' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'Boomi-Product Process Package' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'BRTC-I145-CE-A' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'spb-quantum001' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'spb-mesrptbr' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'BRTC-I160-SERVR2' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'BRTC-M001' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'spb-esx001' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'solx2' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'BTC-I001-RDBFL' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'BTC-I016-RDFF4B' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'BRTC-I139-CE-B-3' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'solac-prod-zl11' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'solac-prod-zl01' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'BTSSC1GW-1' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'BUCCE1GW' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'skertcisesx1' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'BW C&FA (Capital & Fixed Assets)' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'skelg12' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'BW EDNOS (Est Daily NOS)' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'BW FAB (SRAP Budget Tool FAB)' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'skealicsw01' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'BTCPI1GW' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'BW GFSR (Global Financial Shipme' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'spg-apdc500' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'BRTC-I133-SERVR1' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'BRIC-I011-USERS' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'BRIC-I016-4-F-2' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'sqstore001-zw1' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'BRIT-I003-PORT01' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'BRITSC1GW' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'BRK-I002-UTIL' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'BRK-I010-RACK-1' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'sqlp040-zw1' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'BRKCE1GW' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'splx.rtcis' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'BRKSC1GW' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'BRSDCP01SWS013' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'BRSER-CC02' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'BRSER-I002-FLOOR1' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'BRSER-I004-SERVER' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'sqlp010-zw1' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'sqld040-zw1' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'sqld010-zw1' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'BRTC-I130-CP-A' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'splx2' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'sqlp013-zw1' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'ske-pbxaas001' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'sjc-sbc002' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'BW PMTS (Payment Services) - Pro' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'shalx2' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'sgts-meshstphc' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'Boomi-APO IDP' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'Boomi-Big Data' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'Boomi-C&F' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'sgts-mesappphc' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'Boomi-DTC-XI-Updater' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'Boomi-Distributor Connect' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'Boomi-Enovia to PIM Subscriber' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'Boomi â€“ DTC Inbound Orders' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'Boomi-FR Automation' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'Boomi-Global Product Stewardship' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'Boomi-Kardia' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'sgtalicssw001_002' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'Boomi-LDAP To Snow Integration P' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'sgsiniptsmsub001' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'sgo-sbc001' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'Boomi-MIND' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'sglx3' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'Boomi-PrIME Parcel API' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'Boomi-G11 to Enterprise PIM Plat' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'shalx4' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'Boomi - VIA Subscriber Integrati' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'Boomi - TIE' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'sjc-sbc001' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'shilx6' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'Banking' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'Base Plan (Prod)' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'Benefits and Pension Administrat' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'shilx5' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'shi-poputil002' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'shi-mesdtabe' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'shi-mesappbe' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'shi-esx001' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'Bomgar' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'Bomgar - Production' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'Boomi - CAS NA' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'shcrnesx1' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'Boomi - DTC Outbound Email NA (P' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'Boomi - MEGA to RITA (Numerify) ' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'shalx6' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'Boomi - PGP NA' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'Boomi - ServiceNow Supplier Feed' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'Boomi - Snow Mega Application Go' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'Boomi - Snow to Cash Funding' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'Boomi-RDS' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'CNPDGB01FEX003' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'rnlx.rtcis' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'rneg-poputil001' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'prga-sis-srx-RAK-02' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'prga-sis-srx-OCT-01' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'DACH sales reporting tool Prod' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'DALLGFOM1' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'KCD' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'prga-sis-srx-MEC-01' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'DAYLGVSA4' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'DBI-I010-HBF2' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'prga-sis-srx-MAN-01' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'prga-sis-srx-alb-01' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'DBI-I141-B3F1R4' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'DCPSC1GW' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'prga-sis-srx-GAT-02' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'prga-sis-srx-CAP-01' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'prga-sis-srx-AMI-02' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'prga-sis-srx-ABN-02' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'DERWSP01RTR002' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'prga-sis-sam-lon-03' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'DICG-M001-SW003' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'DIEU-M001-BL001' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'DBICE3GW' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'prctj-meshistbe' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'prga-sis-srx-bcp-01' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'prga-sis-srx-bma-01' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'prga-sis-srx-li-01' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'prga-sis-srx-kc-01' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'prga-sis-srx-kar-02' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'Compensating Controls Automated ' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'Concur Expense' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'prga-sis-srx-jpt-01' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'prga-sis-srx-jps-01' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'prga-sis-srx-inh-02' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'prga-sis-srx-icp-01' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'prga-sis-srx-bhi-02' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'prga-sis-srx-hug-01' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'prga-sis-srx-gge-01' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'Core Data Lake' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'Core Data Lake - Ingestion' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'prga-sis-srx-gbs-02' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'Core Data Lake - Shipments' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'Cost Accounting' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'prga-sis-srx-cnh-01' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'prga-sis-srx-chg-01' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'prga-sis-srx-br-01' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'prga-sis-srx-gsr-01' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'prctj-mesappbe' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'prctj-intra001' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'prctj-i009-b4f2r7' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'phishme-mw01' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'pgtaiwan.com.tw_44527' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'pgo-pbxaas001' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'pg.pgpaperlesstrial.com/Service/' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'pg.com.cn_4814' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'pema-mesapp001' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'pem-vgw002' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'DVR-I001-MDC-4' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'DVR-I016-IDF15-1' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'phlx.rtcis' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'DVR-I016-IDF15-2' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'DVRCE1GW' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'peg-vgw03' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'DVRSC2GW' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'DYMC-I004-TE01D' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'pantene.jp/ja-jp/_44717' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'pantene.es/es-es_33275' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'pantene.de/de-de_33274' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'DYMC-I017-TE04E-2' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'DYMC-I025-Serv1' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'DVR-I072-IDF19' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'DRD-I016-LINE' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'DRD-I007-B2' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'DRD-I006-B1' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'prctj-esx001' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'DILCE1GW' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'prcsg-quantum01' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'DIMA-M001-SW001' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'DITR-M001-SW002' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'prcsb-label001' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'DKCPHP01SWA001' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'DKCPHP01WLC001' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'prch-poputil001' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'DLMC-I009-TE02C' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'prch-mestrnbe' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'DLMC-M001-MDF' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'prccj-maple002' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'pom-anthea' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'DMT10' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'pillx.rtcis' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'DOne.Request (Prod)' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'phx-wfs001' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'phx-tapemm001' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'phm-intra001' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'DRD-I002-SRVR' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'prga-sis-srx-lon-01' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'prga-sis-srx-lon-03' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'prga-sis-srx-mec-03' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'prga-sis-srx-meq-01' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'CNTCCE1GW' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'rak-prod032' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'CNTNJO01SWC001' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'CNWHDC-A001-OFF' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'CNWHDCCE1GW' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'rak-prod031' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'COB-I002-B1F0R1' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'COB-I003-B1F0R1' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'COB-I012-B1F0R7' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'rak-wfs001' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'COB-WC01' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'qulx.rtcis' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'COBOGP01RTR001' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'qpcsa083-zw1' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'COBSC2GW' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'qpcsa045-zw1' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'qas-ladc501' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'CORIOCE1GW' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'CR-IDF-A3-3560G-1' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'CRA-I004-SRV60' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'r90p0dax-w10' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'ralx.rtcis' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'CNTC-I001-B1F2AD' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'rgm-aurora002' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'rneg-mestrnbr' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'rneg-mesappbr' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'riolx.rtcis' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'CNSB-CC01' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'CNSB-SRVR1' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'CNSB-WC01' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'CNSBSC1GW' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'CNSBSH01' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'CNSG-A015-5FOFF' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'CNSG-A017-5FOFF' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'CNSG-A018-5FOFF' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'CNSG-I051-B2F1R5' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'rgm-wfs001' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'rgm-trend001' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'CNSGSC1GW-2' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'CNSHCE1GW' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'CNSHO-I002-40ITRM-2' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'rgm-mesrptbe' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'rgm-mdadb001' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'rgm-d2dmm002' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'CNSHVSC1GW' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'CRA-I015-CPM253' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'BRIC-I005-5-A' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'CRA-I016-PERS79' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'CRA-I029-LINE21' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'prga-sis-srx-vbd-02' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'prga-sis-srx-val-01' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'prga-sis-srx-stl-02' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'CRM-Professional Oral Health EME' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'CRS APEX (PROD)' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'CRSJOP01RTR001' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'CS DevOps Digital Platform' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'prga-sis-srx-pom-01' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'prga-sis-srx-phc-01' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'CRGBSSC1GW' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'CSL' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'prga-sis-srx-nwb-02' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'CZRAKP01WAP001' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'CZXUYP01RT001' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'CZXUYP01RTR001' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'CZXUYP01RTR002' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'CZXUYP01WLC001' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'Capture Financial Data Productio' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'prga-sis-srx-nad-02' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'prga-sis-srx-mrp-02' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'CTrip Travel Agency Online Booki' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'prga-sis-srx-wor-01' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'CRGBS-WC01' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'CRGBS-I025-B1' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'CRA-I044-LINE46' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'CRA-I044-SWIFRM' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'CRA-I050-LAG141' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'CRA-I053-PLTRER' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'CRA-I057-HALLC1' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'CRA-I058-HALLC1' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'CRA-I059-GATEHS' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'psysp101' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'CRA-I069-SRV60' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'proficy' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'CRA-M006-LB14RM' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'CRACE2GW' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'CRALHN001' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'prgy-intra001' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'CRGBS-I004-A1' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'prga-sis-uac-nah-01' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'CRGBS-I008-B3' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'CRGBS-I011-C1' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'CRGBS-I012-C0' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'CRGBS-I013-C3' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'CRGBS-I014-C3' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'CRA-I025-LINE16' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'stk-intra001' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'BRGOCE2GW' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'BRGO-I007-FL27' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'APCH-ST-DHCP-04-F' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'vicks.co.uk/en-gb_33402' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'APCH1AAISE' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'APCH1GAWLC' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'APCH2GASA' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'APCHDV1GW' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'APCHEA2IPS' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'vgua-mesdatabc' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'vgo-safcl001' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'APCH-ST-DHCP-03-F' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'APCHMS-VMN1-1SV' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'vbq-vae001' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'API-A042' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'API-A070-HSE' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'vbq-meshisthhc' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'API-I003-LDL' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'valp-wfs001' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'valp-mapleliq01' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'valp-maplehst01' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'valp-esx004' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'APCHPI1GW' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'vEdge-DRCELL-03' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'APCH-ST-DHCP-02-F' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'vicks.it/it-it_33391' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'vpl-pbxaas001' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'vpl-intra001' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'AMIVSA004' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'AMSS (Prod)' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'ANC' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'ANDM-A001-FLR1' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'ANDM-I004-PBX-B' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'ANDM-I006-RD' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'ANDM-I014-WH1' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'APCH-ST-DHCP-01-F' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'vnbdpgwv' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'ANKCE1GW' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'vna-pbxerc01' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'vna-intra002' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'vmlx.rtcis' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'victoria50.fr_39014' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'AP-Singapore-SgIC-Biopolis-6F-6C' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'AP-South Korea-SEOUL GO-SI Tower' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'APCH-I001' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'APCH-I002-3' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'ANDMSC2GW' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'usqasb02sbc003' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'usqasb02rtr001' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'AVM-I012-B1F1R1' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'AVM-I061-B1F1R6' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'usalspgsa434' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'AVMCE1GW' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'usalspgsa425' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'usalspgsa407' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'usalspgsa262' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'AY-I151-MDF-A' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'usalspgsa208' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'AVM-I001-B1F0R01' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'AY-I170-IDF-23' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'AY-I177-IDF-42' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'AY-I207-IDF-63' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'usalspgsa206' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'AY-I210-IDF-66' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'AY-I211-IDF-7' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'usalspg25002' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'AY-I242-B45CF1' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'AY-I244-TE-WH2' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'AY-M003' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'AY-I171-IDF-29' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'AUWHSH01' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'AUSYDP01WLC001' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'AUSYDP01SWA002' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'AR view' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'usqasb01dnm001' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'ASN-I004-RM2-22' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'usqasb01dnf001' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'uslspgwa130-zw1' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'ushadlbpgco003' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'ATHCE2GW' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'ATHD-I009-CR1' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'ATHD-WC01' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'ATHSC1GW' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'ATSPIP01RTR001' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'ATSPIP01RTR002' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'ATSPIP01SWA023-3' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'uscvgp02dhc001' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'usbdclbpgco101' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'AUEP-I066-B2F0R6' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'AUGO-WC01' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'usbdcl3pgco101' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'AUMELP01SWA001' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'AUNRY-I001-B1F4R1' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'usalspgwa108' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'vzgo-intra004' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'AMI-M003-DCLAN' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'war-esx004' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'war-loftware' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'ABN-I041-SEVER2' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'xq-mesappbe' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'ABN-WC01' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'ABN-WEB002' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'wyn-sqstore001' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'wyn-scrd001' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'ADSBSC1GW' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'wyn-onekey001' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'wyn-nadc501' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'ABN-I039-LINE64' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'ADW4R' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'wyn-extdc400' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'wyn-ctx01dir01' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'AEDXBP01RTR001' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'AEDXBP01SWC001' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'wor-sqlagglo01' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'wor-esx001' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'AKA-LAP086-RBNWDK' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'AKA-WC01' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'wolx2' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'wyn-icsprd002' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'ABN-I037-LINE65' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'ABN-I034-HMI-B' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'ABN-I033-P3-A' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'xqlx4' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= '275e6fa61b3f4810f24a42a6bc4bcbc9' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= '3753P-SWS001' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'xqlx2' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= '475e6fa61b3f4810f24a42a6bc4bcb0e' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= '6c43eb4adb2b80d0072b24f4059619c9' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= '7Zip' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= '9293c1abdb3b40902b87c44305961921' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'A6A' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'A6C' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'xq-meshistbc' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'ABN-I010-SERVR1' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'ABN-I012-B' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'ABN-I013-F-A' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'ABN-I016-HMI-A' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'ABN-I017-P1-1' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'ABN-I019-P4-4' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'ABN-I020-P5-1' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'ABN-I024-LINE42' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'xq-mesdatabc' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'ALE-I018-B1F0R0' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'AYCE3GW' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'ALE-I031-B1F0R3' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'ALMCE2GW' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'ALX-I259-TE31' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'ALX-I264-TE26' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'ALX-LAP103-SCHOFF' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'wcmc-wfs001' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'war-vae001' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'AMI-CC01-PCKDC' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'AMI-CC04' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'AMI-I006-PACK1' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'AMI-I012-ADMINB' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'ALX-I253-BLDG2' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'war-reaupl001' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'war-readb001' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'AMI-I034-AHDL' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'AMI-I037-TWR2' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'AMI-I041-KOALA' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'AMI-I047-PACK2' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'AMI-I053-PACK5' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'AMI-I054-Z0' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'AMI-I058-AE40' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'war-mesrpt2bc' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'AMI-I019-DCLAN' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'ALX-I251-IDFF-3' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'ALX-I240-ORIEN' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'ALX-I234-DIST' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'wld-whvisu002' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'wld-vae001' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'ALT-I006-b1' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'ALT-I011-d1' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'wld-pbxaas001' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'ALT-I016-c1' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'wld-esx002' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'ALTLX902_MSA' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'wld-ais001' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'ALX-I068-OPSTN' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'ALX-I072-DRYPACK' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'ALX-I200-IDFA' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'ALX-I203-IDFB' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'ALX-I205-DRYEI' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'ALX-I208-LOGIST' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'wick.de/de-de_33382' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'welegacy-zw1' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'wdlg02' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'ALX-I223-ASRSN1' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'wdlg01' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'ALX-I230-SERVR2' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'ALECE1GW' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'pantene.com.br/pt-br_33267' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'AYL2TP1GW' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'Access Point Wifi PICKING' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'BLIN-I060-SFNET' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'tblx.rtcis' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'BLINCE1GW' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'tbd' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'BLISSCB107' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'BLISSEU132' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'BLISSHD181' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'BLO-I003-SB1' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'BLO-I014-SB10' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'BLIN-I054-SFNET' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'tampax.com/en-us_33352' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'BLOV-I005-SERVER' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'talx.das' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'BLOV-I016-MNRAIL' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'BLOV-I033-MEZZAN' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'taklx5' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'BLOV-I052-BOLT' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'takf-wfs002' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'takf-maple001' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'BLOV-M006-BOLT' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'BLOCE3GW' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'tak-wfs001' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'BLIN-I053-SFNET' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'tclx.rtcis' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'BIC-I058-M0SUPB' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'tilx2' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'BIC-I061-A3' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'BIC-M010-E2' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'BIC-M012-NB' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'tilx1' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'tide.com/en-us_33355' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'BIESC1GW' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'BKL-I013-B1F0R1' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'BLIN-I052-SFNET' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'BKL-I022-B1F0R2' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'BKL-I042-B1F2R4' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'thapbxaas001' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'BKL-I072-B1F2R7' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'BKLCE1GW' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'tha-pbxerc01' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'BKLSC2GW' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'telx.rtcis' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'BLIN-I007-GEDV2' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'BLIN-I019-GEDV4' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'BKL-I032-B1F1R3-1' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'BLOVCE2GW' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'tak-qw-hc' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'tak-mestrnhhc' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'swiffer.com/en-us_33344' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'swa-safcl001' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'BOR-I065-B5F2R6' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'swa-pact002' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'BORCE2GW' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'swa-adicom001' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'stl-wfs001' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'BOSGCE4GW' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'stl-pbxava001' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'syd-pbxaas001' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'BRBF-I013-BUILD6' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'stl-meskepio' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'BRDC-I100-TC-C' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'stl-esx004' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'stk-pbxaas001' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'BRDC-I110-MDF' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'BRDC-WC01' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'BRDCSC1GW' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'BRGO-I001-SERVER' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'BRGO-I004-FL24' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'BRBFCE1GW' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'BOOMI - Aravo (VMD & TPRM) - US ' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'BOISCE1GW' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'sylx.rtcis' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'tak-esx002' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'BMA-I016-ENGER8' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'BMA-I020-WARER9' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'BMA-I022-ENGR11' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'tai-pbxaas001' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'BMA-I038-BLM' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'BMACE3GW' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'BMASC2GW' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'BOBJ-BOP' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'BOGO-I010-FDOCK' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'BOGO-I012-2G' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'tablg2' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'BOGO-I016-7G' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'BOGO-I023-3A' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'BOGO-I033-4U_PBX' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'BOGO-I037-PWRHSE' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'BOGO-I042-ZX' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'BOGO-I044-M' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'szd-pbxaas001' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'BOGO-I063-J7' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'BOGO-I072-F5G' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'BIC-I055-J0' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'BIC-I047-G1' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'tilx4' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'BIC-I042-P1' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'ukbillbpgco004' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'Axway MFT' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'ukbillbpgco003' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'Axway MFT â€“ QA Instance' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'ukbillbpgco001' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'Azure Active Directory (AzureAD)' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'ukbildfpgco003' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'B2Bi' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'ukbildfpgco001' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'Avecto Defendpoint Client' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'tsp-tapemm001' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'B2G FIT' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'tsp-mpwprod' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'tsp-mesrpthhc' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'tsp-mesqadata1' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'BCFLEXRPT' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'tsp-meshisthhc' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'tsp-mesdatahhc' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'BDC-3PAR4162' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'BDC-3PAR4163' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'B2G Cygnet' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'Avecto - Defend Point' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'Avaya G450' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'url-localapp01' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'Account Manager' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'Account Service' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'usalspg22001' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'Adobe Illustrator' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'Adobe Reader' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'Affiliates' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'Agency Compensation Engine' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'AirWatch / Workspace ONE' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'Albany (ayh_das)' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'Albany (ayh_rtcis)' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'Amazon AWS' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'Anaplan TPM - Reporting - Prod U' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'usahadfpgco003' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'Application Management Quality M' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'Application Store' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'urlx1' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'url-wfs001' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'Aravo Prod' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'url-mestrnhc' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'url-meshisthc' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'url-mesdtahc' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'BDC-EVA1420' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'AZ-RG-AmazonOWEN-Prod-01' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'BDC-EVAB750' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'BDC-NAS' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'BELL-I092-B25MC-1' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'BELL-I097-B21S' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'ts-i070-200-7' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'ts-i062-200-3' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'BELSC2GW' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'BEOVRP01RTR001' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'ts-i061-200-2' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'BEOVRP01WLC001' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'ts-i057-300-4' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'tsp-enclw001' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'BGDSC1GW' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'BGSOFP01SWA001' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'BGSOFP01WLC001' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'BIC-I010-H0DC' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'BIC-I014-D0' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'tor-wfs001' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'BIC-I025-E2' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'BIC-I027-LB' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'BIC-I033-M0SUPA' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'tor-d2dmm001' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'tr.braun.com/tr-tr_32878' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'BEL-WC01' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'tsp-esx003' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'BEL-I049-FAM143' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'tsp-mesdata4' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'BDCEA1GW' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'BDCEX1FW' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'BDCFWGW' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'BDCOREGW' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'BDLG3349' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'BDLN7665' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'BDP-I004-DBAY' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'BDP-I013-FFPUA' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'tsp-mesconfig' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'tsp-iqagent101' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'BDP-WC01' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'BDPSC1GW' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'BEARCE01GW' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'BEARSC1GW' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'BEL-I004-NWO40' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'BEL-I007-EITRN' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'BEL-I022-SEO100' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'BEL-I023-OLAY2' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'BEL-I044-MDF' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'BEL-I045-SEWP150' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'BDC-LCCS600\INETP201' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'DYMC-LAP144-K' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'adln9369' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'pantene.com.ar/es-ar_33265' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'man-esx002' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'man-esx001' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'HCRC-I101-CFB-814' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'HCRC-I102-CF1-8211' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'HCRC-I102-CF1-8211-1' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'HCRC-I108-IVI-703' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'mad-pbxaas001' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'HCRC-I111-IV2-703' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'm.sk-ii.com.tw/tc-TW_24045' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'HCRC-I081-K2PT3' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'HCRC-WC01' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'luo-mestrnbc' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'HHPSC1GW' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'luo-meslocbc' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'luo-meshstbc' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'HKHKGP01WLC001' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'HKLSC1GW' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'luo-esx001' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'lulx6' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'lulx.rtcis' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'lxcc_f6p_db' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'HRZAGP01SWA001' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'man-mesappbc' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'HCRC-I074-DS1D-2' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'HCRC-I026-DS2C-2' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'HCRC-I028-DS3A' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'HCRC-I029-DS3A-2' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'HCRC-I035-DV1A-2' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'maralicssw002-2' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'mar-act-esxi01' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'HCRC-I038-DV2A' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'HCRC-I038-DV2A-2' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'HCRC-I040-DV2B-3' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'HCRC-I075-SR2' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'HCRC-I042-DV2C' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'man-vae001' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'HCRC-I055-SB3A' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'HCRC-I057-SB4A' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'man-onekey001' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'HCRC-I059-SB4A-2' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'HCRC-I061-SB4B-2' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'HCRC-I062-CF2B-2' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'HCRC-I071-DS1A-2' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'HCRC-I073-DS1B-2' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'man-wfs001' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'lonlgrtcis' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'HUB-A001' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'HUB-A002' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'lolx.rtcis' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'HYG-I060' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'HYG-I060-PATCH1' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'HYG-M001-B1F01' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'lmhm-maple004' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'lmhm-lpdspc01' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'lmdc-esx001' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'HYP' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'lmd-pbxava01' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'lon-esx003' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'lm01a1c' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'lm-vcenter001' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'IBA (Prod) v2.0' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'IBA-I004-FHC' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'lm-sitepdp_svr' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'lm-mestrnfhc' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'lm-i000-iscsi-20' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'IBM Guardium Prod' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'lm-ffmesdb01' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'lm-esx010' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'Hyderabad (hydlx_rtcis)' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'HYG-I032-B1TA30' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'HYG-I015-B1AE02' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'HYG-I012-B1AE01' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'HUB-I011-B1F1R1' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'HUB-I071-B7F1R7' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'HUBCE5GW' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'lonalicssw001_002' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'HUBUDP01RTR002' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'HUBUDP01WLC001' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'HUGP-I004-SERVER2' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'HUGP-I006-TC6' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'HUGP-I011-SR1-3' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'HUGP-I013-ASB1' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'HUGP-I019-RM1' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'HUGP-I024-SERV' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'HUGP-WC01' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'HUGPCE1GW' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'lon-wfs001' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'lon-tapemm001' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'lon-ortec001' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'HYD' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'lon-mes020' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'HYG-I002-B1F1R1' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'HYG-I007-B1F1R2' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'HCRC-I025-DS2C' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'marp-esx004' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'HCRC-I022-DS2A-2' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'HCRC-I020-DS1D' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'meq-poputil002' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'GSAW2-I181-H' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'GSAW2-I182-J' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'GSAW2-I183-K' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'GSAW2CE3GW' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'GSAW2SC1GW' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'GSAW2SC2GW' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'meq-mestrnbc' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'meq-mesdatabc' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'GRP SQL-DB WLD' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'meq-fsrv101' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'meq-esx001' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'GSDC-XP94073' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'meq-agvs102' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'mel-pbxerc01' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'GSR-I202-IDFD' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'GSR-I203-IDFE' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'GSR-I203-IDFE-1' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'GSR-I214-IDFB' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'GSR-I218-MDFB' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'meq-esx004' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'GRMI-WC01' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'meq-sqlt102' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'merlx.rtcis' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'GO-I044-CRF01B-4' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'GO-I051-CTF04A-3' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'GO-I060-PAV124-1' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'GO-I062-PAV124' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'mhf-mesrptphc' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'mhf-fdhistorian' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'mhf-esx004' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'GO-I085-TER03' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'GO-I088-TEF09H' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'GO-I147-CTF07A-1' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'mhf-esx002' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'GO-I170-TN1H' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'GO-I171-SERVER' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'GO-I180-SERVER' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'GO-M001-TNVSS' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'metamucil.com/en-us_43317' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'GOCC1GW' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'GOCOREGW' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'GORDB: Global Organization Datab' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'metamucil.com/en-us._33125' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'merlx6' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'GSRCE01GW' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'lm-esx001' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'mdp-meshistbc' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'mdp-mesappbc2' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'mb-qs-vp-dbo01' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'Golden Hand Instore Execution (C' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'mb-ifs-ipam' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'mb-db-rapid' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'mb-app-ispeed' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'matlx2' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'matlx1' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'mat-pbxaas001' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'HCRC-I005-CF1D-2' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'mb-web-i2m' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'HCRC-I008-CF2B' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'HCRC-I010-CF2D' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'HCRC-I012-CF3A' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'HCRC-I013-CF3A-2' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'HCRC-I014-CF3C' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'marp-poputil001' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'HCRC-I015-CF3D-3' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'marp-it002' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'HCRC-I018-DS1B' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'marp-image001' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'HCRC-I009-CF2C-2' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'DYMC-M001-MDF' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'mbdbora-zl1' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'mbi-pbxaas001' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'GVD' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'GXP' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'GZCE2GW' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'GZCE3GW' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'GZGO-GAWC01' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'GZGO-I002-L09H02_1' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'GZGO-I003-L08H01' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'GZGO-I013-L15H01' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'mdp-esx001' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'GZGO-LAP091-L1304' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'mcgo-intra001' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'mbraphost7-zw1' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'mbrap2gwv' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'GZGOPI1GW' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'GZGOSC2GW' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'mbrap-mestrnhc' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'mbrap-meshisthc' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'mbrap-kronos11' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'Geovisualization' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'mbrap-intra101' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'Global Customer Workflow' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'GTOFRA' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'IC-I013-16-1' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'IC-LAP037-B13' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'IC-WC01' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'jed-meshistbc' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'Identity Management' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'jed-esx002' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'Imperva-SecureSphere-MX' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'Imperva-SecureSphere-SOM' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'ingo-vms-01a' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'inbh-intra001' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'ina-pbxaas001' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'imp-intra001' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'Identity Central' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'igoa-meshstbc' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'igoa-intra001' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'igoa-esx001' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'igoa-ddsp001' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'icpoc-poputil01' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'Itatiaia (italx_das)' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'icpoc-esx002' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'J1P (bdln2515)' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'icp-pbxava001' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'iciaalicssw01' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'Integration Platforms for Cloud' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'IUCLID' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'ITROMP01WLC001' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'jed-vae001' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'ITC-I145-HF0S38' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'jij-service101' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'ITC-I147-MS1E11-8' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'jij-pcenter101' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'jij-mestrnbc' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'jij-meshstbc' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'jij-mesdtabc' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'jij-esx005' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'ITC-I167-HF0N32' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'ITC-I184-GPDFFR' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'ITC-I191-HF1S42' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'ITC-I198-M0C1' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'ITC-I213-TSDC' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'ITC-I215-TSDC' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'ITC-I216-TSDC-1' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'jhq-rcdb002' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'ITC-M002' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'ITRM-A002' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'ITRMCE1GW' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'jgo-pbxaas001' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'ITROMP01RTR002' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'JEDGOPIGW' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'ITC-I139-HF2C36' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'JIJ-CC03' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'JIJ-I004-BABYCARE' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'iba-mestrnhhc' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'iba-mesapphhc' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'JPYAUP02SWA008-2' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'iZoom RSi Retailer Connect - Pro' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'JPYAUP02WAP001' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'iAccess_CA' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'hylx4' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'hyg-wfs002' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'hyg-tampaxtsg' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'ibh-esx001' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'hyg-pbxaas001' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'K8Q' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'hyg-meshistbc' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'K9R' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'hyg-lbp001' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'hyg-i055-bivf0n' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'hyg-esystems001' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'hyg-esx003' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'KBC-WC01' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'hyg-cps002' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'hyg-mestrnbc' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'ibh-intra002' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'ibh-mesdatabr' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'JPTAKF-I004-FHCSTR' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'JIJ-I006-BABYCARE' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'ic-mestrnbe' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'JIJ-I022-DCENTER' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'ic-mesdatabe' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'JIJCE1GW' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'ic-esx002' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'ibp-wfs001' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'JPGO2-I003-L06H01' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'JPGO2-I004-L07H01' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'ibp-meshisthhc' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'JPGO2-I009-L12H01' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'ibmguardium-zl2' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'JPGO2CE1GW' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'ibh-poputil001' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'JPMICE1GW' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'JPNGOP01RTR001' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'JPTACE1VPNE' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'JPTAKF-A001-MACRM' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'JPTAKF-A032-FHCSTR' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'JPTAKF-I001-SERVER' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'JPTAKF-I003-PACARE' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'icia-esx003' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'GO-I029-TEF04H' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'jij-tempo102' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'jijalicssw001-1' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'IDJKTSC1GW' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'IDJPUP01SWA001-1' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'lbn-pbxaas002' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'IEDUBP01RTR001' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'IEDUBP01SWA001' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'IGM-I041-B1F0R4' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'IGM-I116-B1F1R1' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'IGMCE2GW' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'IMP-A074-MPR' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'IDJKRSC1GW' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'latam.oralb.com/es_42019' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'IMP-I023-B1F0I2' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'IMP-I026-B1F0I5' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'kukident.es/es-es_40808' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'IMP-I029-F1R9FC' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'IMP-I030-NSTGF' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'IMP-I031-F1R9FC' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'krgogwv' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'IMP-I048-F1JOG0' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'krgo-intra001' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'lap-pbxaas001' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'IDJKRCE1GW' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'IDJKR-SRVR2' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'ldz-logicprint1' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'lm-d2dmm013' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'lm-acagent06' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'ICIA-I076-IDFC3' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'ICIA-I079-IDFE1' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'ICIA-I080-SERVR2' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'ICIA-I084-IDFB1' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'ICIA-I092-FOA1SR' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'ICIA-LAP008-FO1STR' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'limlg4' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'ICSC1GW' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'lenor.de/de-de_41386' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'ldz-toolworx' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'ldz-meshistbr3' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'ldz-meshistbr2' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'IDJKR-C002' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'IDJKR-I001-HC-GF' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'IDJKR-I013-BDSER4' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'IDJKR-I024-GUARD' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'IDJKR-IDF-MSRV-SW1' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'IDJKR-IDF-RMS2-SW1' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'IDJKR-IDF-RMS3-SW1' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'IMPCE3GW' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'jij-vae001' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'koz-sql003' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'koz-bpm001' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'INHYD-I023-BCGNDIDF4' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'INHYD-I037-DCITRM' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'kc-mesio01' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'INHYDCE2GW' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'kc-mesdb101' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'kc-autocdo1' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'kalx_das' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'IPRD (Integrated Panelist Recrui' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'jpgo-sbc001' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'INHYD-CC02' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'IPaas-Boomi' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'joh-d2dmm001' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'jkt-pdpp001' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'jkt-meshstbc' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'ISOP Tax Forms' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'ISP (In Store Performance)' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'jkt-mesappbc' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'IST-I003-IDF1' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'jklx.rtcis' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'IT&OT at Plants' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'jop-pbxaas001' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'kc-mesio101' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'INGOCE4GW' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'kc-spcrpt01' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'kolx.das' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'kdhlx2' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'kdhlx1' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'kdh-vaecms001' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'INBAD-I017-FHC' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'INBAD-WC01' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'INBADCE1GW' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'kdh-linutil003' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'kdh-eudc500' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'INBADSC1GW-1' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'INBHI-I012-B1F1R1' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'kcp-pbxava001' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'kcp-avapbx001' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'INBOMP01SWA001' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'INDACCCE1GWE' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'INDFRLCE1GWE' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'INDLNTCE1GWE' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'INGO-I003-3FDC' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'INGO-I004-2FHR' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'INGO-I010-3FDC' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'INGO-WC01' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'koz-intra001' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'mhf-pbxaas003' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'mbappgrdm-zl1' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'GO-I018-TNF11' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'FVARCE1GW' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'ESMTOP01WLC001' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'mtep-mestrnbc' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'ESMTOP01RTR001' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'mtep-mesappbc' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'FastMart Prod' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'mtep-tapemm001' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'ESMADP02WAP001' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'msmo-sqlp002' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'mrp-vgw001' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'mrclean.com/en-us_33128' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'Firefox' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'mpc-pbxaas001' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'ESMADP02SWC001' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'Financial Management Center (FMC' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'mp_label3_b14' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'mum-safcl001' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'mum-vmlerc02' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'FIHELP01WLC001' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'oct-vms001' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'FLEXLabDbP-zw1' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'FMOT-LAP001' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'odaw16001-zw1' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'FNMS (Prod) 2' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'FRDIJP01SWA001' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'FOE (Fast Order Entry) v0.0- Pro' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'mvlg5' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'mvlg4' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'mvcrnesx2' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'mvcrnesx1' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'ESS Timesheet - CR' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'FRBLOP01RTR001' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'ogge-wfs001' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'FIHELP01RTR001' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'ogsr-meshisthhc' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'mp01a1c' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'olmdm-mesdb01' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'GAT-I036-PLC2' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'GATSC1GW' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'GATTCE1GW' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'onwb-wfs001' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'ENABLE Prod' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'olay.com/en-us_33149' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'EGSC1GW' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'oprch-mesdtabc' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'GB-I028-B48PAL' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'GB-I049-B71BDF' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'GB-I055-B79CGT' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'GB-I119-SERVER-2' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'mp-mestrnfc02' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'oprch-mesdatabe' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'Forecast One - F1 ControlTest' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'GAT-I009-IDF5' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'GAT-A034' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'mp-wfs006' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'GADC-3PAR3021' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'GADC-3PAR4100' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'mp-supermrkt' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'GADC-ALOHA001' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'EUS-I035-WAREN3' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'GAT-A070' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'GADC-XP66138' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'GADC-XP94070' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'olay.ca/en-ca_33135' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'GADCCE1GW' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'GAGSCE1GW' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'mp-monitors' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'GAT-A031' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'ESMADP01WLC001' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'EGCE1GW' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'FFMCE3GW' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'FERI (Front-End Reporting Interf' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'EUS-LAP145-WH7' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'EUS-M012-LAGERH' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'EUS-I003-HAUPT' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'EUS-I001-HAUPT' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'nov-meswbbc' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'nov-i049-b4f1an' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'EUS-I154-HALLE7' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'EUSLHN004' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'nov-esx001' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'EUR-UK-EGHAM GO-IC Branson B10 G' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'nwb-loftware001' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'Email Integration' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'Email messaging' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'nwb-mesdatahc' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'nov-esx007' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'EUCHEX1GW' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'EUS-I152-HALLE9' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'EUS-I070-9NEWC1' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'nov-vae001' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'nov-srtest002' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'EUS-I047-HALLE7' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'nov-wfs001' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'EUS-I024-CSCONT' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'novprimeesx3' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'nov-pbxaas001' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'EUS-I017-KLIMA' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'nov-srprod001' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'EUS-I054-9ENDE' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'EUS-I010-LAGERH' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'nov-poputil001' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'EUS-I062-CW01' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'EUS-I006-HAUPT' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'EUS-I013-EERAUM-1' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'oct-mesrptbc' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'nov-apalprod01' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'ngbay-proficy02' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'nbdc-eassqldev' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'nay-meshistfc' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'EUCH-ST-DHCP-05-F' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'EzP2 APIs (Back End) for Price U' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'F5 Big-IP Virtual' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'naup-meshisthc' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'obrk-maple005' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'nalx.rtcis' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'nach-st-dns-0-2' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'FAMICE1GW' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'FASTMART Platform' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'mxo-safcl001' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'oct-mesdatabc' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'mvlg6' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'oct-esx002' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'nwb-meshisthc' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'obosg-meshistbr' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'nbp-pbxaas001' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'Encase' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'ngbay-meshistfc' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'nwb-poputil001' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'neus-adicom001' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'nemc-wfs001' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'EUCHDV1GW' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'nbell-agv001' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'nemc-agvprod001' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'EUCH4GAWLC' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'EUCH3GAWLC' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'obell-int04' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'EUCH-ST-DHCP-10-F' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'ndvr-mesdatabc2' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'ncp-pbxava01' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'nem-apaltest02' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'EG-LAP080' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'GADC-NAS' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'GEN-I010-B2CR32' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'GDK-I002' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'ox-net001' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'pabc01agwv' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'mnrtcisesx1' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'mil-poputil002' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'pampers.be/fr-be_33206' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'GERMANY' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'mil-esx006' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'GCGOCE1GW' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'Domain Name System (DNS)' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'mos-esx001' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'GENCE3GW' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'GGE-I061-B1F3R6' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'GGE-I081-B3F0R8' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'Data Genie' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'GGE-I121-B6F112' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'mos-pbxaas002' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'orlx4' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'GBVEN-WC01' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'GBTUWP01SWC001' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'GBSSC1GW' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'GBSCE02GW' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'oralb.no/nb-no_41213' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'oralb.es/es-es_41008' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'GGE-I072-SERV' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'mnlg2' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'GEN-WC01' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'GEB-I002-MAINB' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'mmi-esx001' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'GEN-I037-TWRE23' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'orderyourdosingdevice.com_1674' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'ovalp-mesrptfhc' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'GEN-I032-TWRE18' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'GEN-I030-TWRC16' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'ord-mesdtahc' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'ord-mesdata01' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'GEN-I029-TWRB15' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'GEN-I028-TWRE14' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'min-pbxaas001' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'GEN-I027-TWRD13' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'GEN-I026-TWRC12' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'GEN-I023-TWRE09' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'mil-web101' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'mnl-pbxava01' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'mp-mesrptfc' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'mnl-vmlava01' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'ox-esx001' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'GEBSC1GW' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'GEBCE3GW' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'GEB-I017-LAUND' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'oralb.se/sv-se_41299' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'GEB-I016-LAUND-2' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'GEB-I006-ORKID' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'GBS-I125-PARK' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'ED01A1C' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'GGE-I182-BCF018' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'mmi-locweb' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'GBS-I002-MDF01-5' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'mil-esx004' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'EDCHUB1GW' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'mp-3par73306_DC14' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'mp-mesdatabc' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'micc-payroll002' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'mp-esx004' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'GO-A633-CT0709' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'mhf-sql001' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'GMIP (Global Manufacturing Intel' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'oralb.ca/en-ca_33172' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'GMDB: Material DB (R&D)' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'moslg005' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'mhf-v3vm002' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'DYMCSC1GW' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'GBHRTP01SWA001' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'DYMCCE3GW' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'GBHRTP01RTR002' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'EDI Market Services - GREATER CH' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'GBS-I008-IDFC01' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'GGE-LAP074' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'GGECE2GW' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'GBHRTP01RTR001' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'GO-I009-TNF0-2' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'pantene.co.id/id-id_33281' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'mp-mesdtafc02' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'moslg012' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'pantene.co.uk/en-gb_33300' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'GGE-I202-B5F110' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'GGE-I214-BEF120' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'pampers.de_33218' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'moslg019' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'GBS-I016-IDFJ01' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'EG-I052-BRANS5' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'GO-I016-TNF09H-1' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'pamperspakistan.com_41579' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'prga-sis-srx-cc-02' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'iNet Wiki' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'prga-sis-srx-bor-01' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'dentalcare.com/en-us_41001' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'pema-dpmm001' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'vicks.com/en-us_33403' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'kdh-nadc500' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'usbdclbpgco003' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'crgo1gwv' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'uscvgp01rtr006' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'hyg-esx001' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'dentalcare-aus.com.au/en-au_4209' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'usbdclbpgco004' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'iPlanning Visualization' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'novlx3' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'ox-agv102' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'cpu1-inpg-cnhap-1' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'ddsidb-zw1' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'gillette.nl/nl-nl_33015' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'jplx4' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'amw-actsvcprd01' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'xq-mestrnbc' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'usqasb02sbc001' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'amplg7' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'gillette.pl/pl-pl_33016' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'blin-mesdatabr2' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'gillette.ru/ru-ru_33017' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'prga-sis-srx-hyg-01' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'dvr-esx001' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'andm-esx003' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'gillette.fr/fr-fr_33007' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'peg-vgw02' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'andm-prime01' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'blo-esx001' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'prga-sis-srx-eus-01' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'blo-pbxaas001' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'adln9379' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'prga-sis-srx-dvr-02' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'hyg-fpdrfid' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'prga-sis-srx-inm-01' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'adln9391' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'vgo-pbxaas001' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'ox-mestrnfc' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'cps-pbxaas001' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'kalx_rtcis' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'nwb-vae001' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'nwb-esx001' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'dvr-pbxava001' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'wld-grpdb002' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'vicks.ua/ru_41167' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'jed-mesdatabc2' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'aeclx2' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'cape-esx001' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'oralb.ca/fr-ca_33173' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'phm-intra008' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'wcmc-vms101' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'wbe-vgw001' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'cape-web203' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'headandshoulders.co.uk/en-gb_330' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'ale-vae001' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'dallg6' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'brio-web001' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'jed-pbxaas001' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'dayplg5' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'prga-sis-ltm-aph-01' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'prga-sis-ltm-euh-01' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'dayplg7' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'phlx4' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'oralb.co.za/en-za_41639' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'altlx901' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'brklx2' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'oldspice.com/en_31505' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'cabrnp01wlc001' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'pom-wfs001' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'pom-hdl004' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'cab-maplerpt006' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'dam-esx001' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'calx4' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'ca.braun.com/en-ca_32854' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'oplx4' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'olay.co.th/th-th_33146' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'oral-b.co.in_43319' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'igoa-mesappbc' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'aeprimeesx1' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'daycrnesx2' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'bru-v4esx100' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'gsr-vgw001' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'ale-esx001' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'wdc-vgw001' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'wolx.rtcis' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'aka-mestrnbc2' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'braun.pl/pl-pl_32871' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'gsdc-siebel011' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'altlx902' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'jij-fsrv101n' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'prga-sis-srx-GEB-01' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'alx-wfs001' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'gsdc-esxgu001' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'oct-mestrnbc' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'wyn-wfs001' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'pgschoolprograms.com_7076' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'bosg-esx001' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'prga-sis-srx-GBY-01' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'ami-esx004' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'bosg-ems001' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'wynlx1' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'jij-sqlt102' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'wynlx2' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'borlx4' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'bor-wfs001' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'prga-sis-srx-NAL-03' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'oct-esx001' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'ibh-mestrnbr' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'wyn-smtapp001' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'gsdc-intra007' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'jiclx4' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'war-pbxaas001' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'jhq-bpm001' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'war-mestrnbc' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'adln9407' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'wyn-limsprod01' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'always.de/de-de_41017' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'wyn-limsql001' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'oralb.pt/pt-pt_41175' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'braun.be/fr-be_38129' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'cdlx6' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'adln9406' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'prga-sis-srx-APH-03' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'wyn-onekey002' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'war-mesdata2bc' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'celx4' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'adln9400' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'ceprimeesx1' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'adln9398' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'prga-sis-srx-DRD-01' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'jklx4' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'prga-sis-srx-meq-02' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'beu-esx002' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'ggo-pbxaas003' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'gadc-sqlp011' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'bdc-ovoc001' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'tablg4' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'bdc-poh001' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'bdc-pssdashbd01' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'mp-mesdatacpn2' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'fra-nadc500' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'marlx2' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'fva-pbxava01' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'marlx4' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'bdc-ntsupp001v' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'gadc-sqlp002' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'sylx2' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'bdc-rtcedge01' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'bdc-rtcedge03' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'mosln001' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'bdlg3496' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'moslg020' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'bdlg3477' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'swa-pbxaas001' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'bdlg3436' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'stlsc1gw' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'gadc-aclg001' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'tai-pbxaas002' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'bdc-nadc401' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'gadc-sqlp012' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'lvlx4' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'tblx4' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'bdln5597' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'mad-pbxaas003' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'bdc-eudc401' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'bdc-extra153' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'bdc-iamsql01' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'sdc-rtcedge01' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'gadc-sqspool006' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'talx.rtcis' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'bdln2738' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'man-mestrnbc' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'bdln2737' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'bdln2728' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'bdc-iptsme003cn' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'febreze.com/en-us_32989' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'takf-esx001' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'bdln2644' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'man-pbxaas001' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'bdc-ldapprd009' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'bdc-ldapprd011' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'sdc-var001' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'mp-meswebbc' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'gadc-plmgp004' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'bdc-safcl003' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'mos-sqlp003' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'gadc-payroll01' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'gadc-kgsfs02' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'mil-web002' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'gadc-elnd001' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'sg-onekey003' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'sjg-pbxava01' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'sg-swinds001' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'siln8115' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'shlg7' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'mil-vgw001' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'mil-mesdatabr' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'shilx2' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'merlx4' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'shcrnesx2' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'sgic-intra001' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'sglx.rtcis' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'sglx2' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'gadc-fnmp005' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'gadc-eptm001' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'mhf-tapemm001' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'sgo-pbxaas007' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'shalx.rtcis' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'bdc3gw' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'mhf-pbxaas001' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'bdc-sqlp045' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'bdc-elnm001' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'skelg3' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'bdhp5250' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'gadc-ompvfs02' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'mbc-vgw001' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'bdlg3399' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'gadc-cfm007' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'sdhn6641' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'gadc-omp004' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'gadc-cmadvp001' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'mnlg6' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'gadc-odessey003' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'gadc-cmdvp001' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'gadc-nadc500' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'sdln5718' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'gadc-mpsgdbp01' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'gadc-mpsdb' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'se.braun.com/en_32875' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'secret.com/en-us_33329' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'mdp-esx005' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'med-pbxaas001' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'med-vae001' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'solac-qa-zl01' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'sg-asiabidb01' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'gadc-labvntgd06' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'skelg6' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'prga-sis-srx-mhf-02' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'tep-vgw001' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'riolx4' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'axlg2' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'usahadfpgco005' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'ay-esx003' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'ldz-esx005' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'gen-pbxaas001' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'ay-mestrnfc' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'nov-directum001' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'geb-vae001' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'egy-companyshop' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'geb-poputil001' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'nov-mestrnbc' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'azl-adln9390' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'ldz-mesdatabr2' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'newlx.rtcis' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'url-esx001' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'nemc-meshistmx1' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'nemc-alpsmain' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'limlx9' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'gbs-mestrnhc' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'lis-pbxaas001' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'uk.braun.com/en-gb_32881' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'gbs-asvr001' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'beu-wfs001' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'prga-sis-srx-spa-01' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'usahal3pgco201' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'usalspg21001' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'kolx.rtcis' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'kolx4' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'gglx3' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'prga-sis-srx-mmi-01' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'prga-sis-srx-nah-01' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'atllg4' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'usalspgsa410' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'gglx2' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'usalspgsa284' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'ePADEx' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'prga-sis-srx-new-rgm-01' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'usalspgsa257' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'krgoagwv' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'eQMS' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'bidlx2' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'edc-cccvgw001' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'kutatasi-kozpont.hu/hu-hu_41178' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'lag-pbxaas001' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'avm-esx001' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'lbn-pbxaas001' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'usalspg25001' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'prga-sis-srx-phx-01' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'gge-esx001' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'gbrdnp01dhc001' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'tsp-stewcs02' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'tsp-stebms001' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'gbp-vgw001' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'azw-shrsqlps01' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'azw-wmdvsqlp01' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'lon-iismaple' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'lon-mes010' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'badlx4' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'bdln9256' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'bajlx4' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'balx6' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'tor-safcl001' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'gadc-udwevt01' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'bdln9000' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'bdln7723' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'msmo-vms001' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'bclx2' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'lonlg3' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'bcru-app001' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'eus-pfm001' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'mplx4' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'bdc-222-sw01 irf' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'mplx.rtcis' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'rgo-pbxaas001' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'thp-pbxaas001' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'luo-mesappbc' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'azw-shrsqlds01' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'mp-web003-app' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'tsp-appserver' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'azw-gp20adosprd' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'mhf-poputil001' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'lm-3par72135_BCKP' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'tsp-mesqahist1' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'nem-apalprod01' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'gbay-esx005' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'nbdc-tarchfadev' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'bell-traksys001' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'gat-maple002' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'azl-enoh003' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'tsp-mesdata3' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'bell-mhdas01n' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'tsp-mesdata1' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'gadc-wfshrd001' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'pt.braun.com/pt-pt_41298' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'azl-shrtomp01' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'bell-esx101' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'mxmil1gwv' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'etln1132' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'tsp-esx005' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'etln1134' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'gadc-viasqlp' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'lmlx2' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'tsp-esx001' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'euch-st-dhcp-09-f' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'bor-tapemm001' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= '-' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'LM-I002-PHROOM' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'NACH-ST-DHCP-01-F' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'NACH-I006' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'NACH-I005' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'NACH-I001' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'BRBFSC1GW' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'Microsoft SharePoint Online - PR' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'BRDC-I109-TC-M' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'BRIC-I002-4-MDF' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'BROPCE1GW' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'Media Data Warehouse - Productio' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'Media Data Warehouse' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'MXMIL-I017' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'MXMIL-I008' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'MXMIL-C012' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'MXHXCP01WLC001' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'MXHXCP01SWA006' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'MXHXCP01SWA004' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'MXHXCP01SWA002' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'MSMOCE1GW' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'MP-I135-B52-3' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'MP-I093-24-2' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'BRTC-I137-CP-C' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'MMSD-I001-SITE' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'NACH-ST-DHCP-02-F' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'NACH-ST-DHCP-05-F' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'NACH-ST-DHCP-06-F' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'NACH-ST-DHCP-07-F' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'NWB-I007-B1F1A2' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'NWB-I006-B1F1R1' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'NWB-I001-B1F1R1' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'BOR-I011-B1F3R1' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'NOV-I047-B4F1AU' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'NOV-I026-B73F1R' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'NOV-I023-B4PAMP' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'BOR-I015-B5F2R6' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'NOV-I015-B73F3P' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'NOV-I013-B4F1AM' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'MMICE02GW' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'NGSO2CE1GW' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'NEMC-I016-TE05B' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'NAUPSC1GW' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'NAUP-I118-GALERIA' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'NACL1AAISE' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'BOR-I041-B3F1R4' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'NACHCE1GW' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'NACH1GAWLC' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'NACH10AAISE' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'NACH-ST-DHCP-09-F' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'NACH-ST-DHCP-08-F' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'BORCE1GW' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'NEMC-I025-TEWTO' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'Normative Forecaster' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'BRTC-I149-CE-C' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'MICD-I011-HCMTG' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'LM-I101-LFEPRC' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'adln9364' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'LDZ-I046-LMCBOF' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'LDZ-I043-LMCBOL' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'LDZ-CC01-LMC01' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'LDZ-A001' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'LBNSC1GW' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'LBNCE2GW' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'LBN-I012-B1F0R1' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'BW COPA (Controlling Profitabili' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'BW COST (Cost Accounting)' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'KRSELP01SWC001' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'KROSC1GW' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'KRO-I062-AA' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'KRGO-WC01' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'KP-I020-B10R23' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'KP-I015-B10R19' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'KIEV-WC01' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'KCTAPE001' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'BW PMTS (Payment Services)' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'KBCCE4GW' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'KBC-I009-ITROOM-1' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'KBC-I005-ITROOM-3' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'LM-I172-STORRM' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'LM-I182-BLDG49' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'LM-I191-PFOFC' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'LM-i041-DOCK2' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'MICD-I001-DTCTR' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'BRTC-I154-CE-F' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'MHFSC2GW' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'MHFSC1GW' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'MHF-I037-IDF4' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'MHF-I027-B1F1RD' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'MHF-I021-B1F2RA' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'MHF-I009-B1F0R3' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'MHF-CC02' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'MEC-I043-7F5C9' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'MEC-CC03' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'MIND (Production)' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'MARP-I002-SERVR1' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'Linux' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'BTC-I005-RDSFLL' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'LONCE5GW' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'LON-I046-HUB3' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'LON-I044-H23C1' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'LON-I043-H10C2' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'LON-I042-H22C1' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'LMDCCE2GW' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'LMCON-M001-MCS' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'BTCSC1GW' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'LMCON-I025-SUD26' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'MANCE3GW' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'OCT6B-I005-40TC5' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'OCT6B-I007-43TC7' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'OCT6CE4GW' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'SAP-HR-PAYROLL-NZ' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'Aravo (VMD & TPRM) - US' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'Aravo (VMD & TPRM) - US PROD' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'Argus R 8.1 Production' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'AspireHR_Ceridian' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'Azure Information Protection' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'B2G - SAP eDocuments' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'BACKUP' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'BDCEA2GW' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'BDP-I019-GFWARH' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'BEL-I009-TRKSHP' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'BEL-I056-DPUB' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'BELL-I096-B25NW' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'SAP-AR - L6P' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'SAP-AR - A6P' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'BEOVRP01SWC001' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'BESOVP01SWA001' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'BGSOFP01RTR001' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'SAP Payroll Calendar' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'BIC-I034-NB' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'BIC-I045-U0' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'BIC-WC01' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'BKL-I052-B1F0R5' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'AYSC1GW' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'AY-I163-IDF-8' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'SAP-IM AAI/GC SC (A6P)' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'AUMELP01RTR001' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'SPARSC1GW' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'SPARCE3GW' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'SNKDCE1GW' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'SMTP Backbone' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'SKECE1GW' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'SKBTSP01RTR001' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'API-I002-FHC' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'SHICE2GW' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'SHI-I006-OFFICE' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'SHI-I003-SERVRM' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'APILCE1GW' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'BKLSC1GW' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'SGTU-I011-B2F1C2' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'SER (Store Execution Reporting)' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'SEKCE3GW' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'APISC1GW' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'SAP-SM Change Request Management' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'APRO (AssignmentPro) Expatriate ' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'SAP-SD (Transportation) instance' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'APRO - EDE (Decommissioned)' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'ATH-I008-F2CR7' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'ATH-WC01' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'ATSPIP01SWS001' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'ATVIEP01RTR001' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'SGTU-I005-B2F1C2' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'BLIN-CC01' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'BLIN-I003-GEDV2' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'SAP Ariba - Production' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'PRCXQ-I306-B1F2R3' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'PRCXQ-I032-B3F210' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'PRCXQ-I019-B4F120-1' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'PRCTJCE3GW' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'POMSC1GW' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'POM-I055-HDLEGF' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'PLLODP01SWS001' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'PLLODP01SWA005' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'PLAWLO01SWC001' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'PKKARCE2GW' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'PHXCE02GW' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'PRCXQCE3GW' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'PHGOCE2GW' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'PHCCE3GW' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'PHC-WC01' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'PHC-I023-CADC' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'PHC-I007-SB2F' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'PEMASC1GW-1' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'PEGA E2E MD Platform' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'PABCCE4GW' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'BMASC1GW' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'BOGO-I015-6G' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'BOGO-I071-5ABK' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'ORDSC1GW' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'PHGOCE1GW' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'KBC-I001-ITROOM-1' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'PROSYS on the Cloud' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'BLOVCE1GW' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'SAC-I012-D401FE' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'Revenue Accounting' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'RUNMKP01SWA002' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'BLIN-M001-GEDV1' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'ROTCE1GW' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'RONASC1GW' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'RONA1GW' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'RONA-I001-IDFA' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'ROBUHP01WLC001' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'ROBUHP01SWA005-3' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'ROBUHP01RTR002' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'PRSJUP01RTR002' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'ROBUHP01RTR001' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'RGM-I014-B5F1RC' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'BLOV-I011-BCARE' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'RAKCE1GW' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'BLOV-I014-BLUE' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'Proficy Plant Application Servic' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'BLOV-I038-VLC' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'Platform Security' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'PingID' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'BLOV-I058-LAIC2' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'PUR-Easy Pricing' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'PTLISP01RTR001' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'RGM-I016-B5F0RE' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'K8A' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'BW SRCG (Sourcing)' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'JPYAUP02WLC001' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'FPSS-External Reporting Service' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'FASTMART Platform (Non-PROD)' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'CHPA-I016-B5F1R1' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'CHPASC1GW' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'CINSC3GW' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'CMED-I009-COM01' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'CMEDCE1GW' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'CNC-I111-B1F2R1' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'CNHAP-I037-SRVR2' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'EUSCE4GW' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'EUS-I076-ANLAGE' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'EUS-I050-8GCLC' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'EUS-I033-GITTER' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'EUS-I031-CSHOP' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'CNHAP-SRVR1' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'EUS-I023-MODUL1' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'EUR-Kazakhstan-ALMATY GO-4F-Alma' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'EUCHEC1SV' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'EUCHCE1GW' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'EUCH1GAWLC' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'EUCH-ST-DHCP-08-F' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'EUCH-ST-DHCP-07-F' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'EUCH-ST-DHCP-06-F' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'CHIGCE3GW' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'CFTI (Consumption Forecast & Tra' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'FRDIJP01RTR001' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'FRDIJP01SWC001' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'GKROCE1GW' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'GGELHN001' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'GGECE1GW' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'GGE-I021-B1F1R2' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'GEPDB: Global Equipment and Part' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'GENSC1GW' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'GEN-I060-R3Zon3' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'GEN-I040-TWRC25' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'GEN-I039-TWRC25' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'GEN-I015-TWRC03' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'CBOGCE3GW' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'EUCH-ST-DHCP-04-F' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'GBVENCE1GW' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'GBS-I028-APDO' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'GBHRTP01WLC001' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'GBCE2GW' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'GBCE1GW' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'GB-I120-SERVER-3' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'GADC-3PAR70435' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'G9P' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'CCURE9000' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'FireEye as a Service (FaaS)' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'Fiori' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'CFS - Customer Financials System' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'GBS-I111-IDFZ1' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'EUCH-ST-DHCP-02-F' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'EUCH-ST-DHCP-01-F' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'EUCH-I006-1' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'DIL-I006' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'DIL-I001-AE2' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'DIJE-M001-SW001' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'DEFRAP01RTR001' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'DEFAULT' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'DEDARP01SWA001' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'DEDARP01RTR001' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'CNSHVCE1GW' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'DBICE2GW' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'DAYLGVSA3' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'Credit Management Portal' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'DIL-I008-AE2 ' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'CNTC-I006-B1F2AD' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'CNTCSC1GW' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'CNWHDCSC1GW' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'COBCE4GW' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'COMPASS Production' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'Cloud Provisioning Automation Pr' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'CRA-I070-SRV253' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'CRGBS-I005-A1' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'CSDCSC1GW' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'CSD - C B2B eCommerce' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'CRS (Prod)' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'CRGOCE1GW' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'CNTC-I016-B3F2RDC' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'GO-I023-TEF01H' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'CNSHOSC1GW' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'DKCPHP01RTR001' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'EUCH-I002' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'ESMADP01RTR001' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'EDWM (EDW Mapping Tool)' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'CNPDGB01FTD001' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'Direct Shipment Data(B2B) SH Dir' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'Data Validation Module' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'Data Transformation Systems' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'Data Hubs' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'Data Adjustment' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'DYMC-WC01' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'DYMC-I026-Serv2' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'DILSC1GW' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'DYMC-I017-TE04E' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'DYMC-I009-TE03A' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'DVRSC1GW' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'DTCS Development' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'DST' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'DRDSC1GW' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'CNPDGB01SWB001' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'CNSBCE3GW' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'DNSServer' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'DLMCCE1GW' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'CNSHOCE1GW' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'DLMC-I010-SERV2' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'DYMC-I012-TCCS' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'SRAP Accounting' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'GO-I027-TEF03H' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'GO-I150-CTF01B' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'ITC-I142-HF2N32' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'ITC-I138-HF3N32' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'ISTCE2GW' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'ISOP' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'IRRT (Initiative Risk & Readines' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'Boomi- Retail Connect Walmart' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'IOPT GLOBAL (Prod)' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'IOPT GLOBAL (Dev)' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'Boomi-LAStore-SalesFactData' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'INHYDSC2GW' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'INHYDSC1GW' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'INGOIP01RTR001' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'INBOMP01RTR001' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'INBHI-WC01' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'INBADGW' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'INBAD-I010-B1F2RA' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'INAMDP01SWC001' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'INAMDP01RTR002 ' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'IMPSC1GW' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'IMP-I042-B1F0R1' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'IMP-I018-B1F1R8' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'IMP-I017-B1F1R7' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'IMP-I006-B1F0R2' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'ITC-I153-MN2F12' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'ITC-I154-MN3F12' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'ITC-I154-MN3F12-5' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'ITC-I158-MPRL2S' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'JPYAUP02SWS002' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'JPYAUP02SWA007' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'JPYAUP02SWA002' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'JPGO2SC1GW' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'JPGO2-WC01' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'JPGO2-I006-L09H01' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'JPGO2-I001-L08S01' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'JIJ-I012-DCENTER' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'JIJ-I002-Server' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'JEDGOCE3GW' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'Big Data Platform' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'IMP-I003-B1F0R2' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'Internet Explorer 11 - Productio' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'Innovation Record Management (fo' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'Infoblox DDI' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'Binder (aka iBinder 2)' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'Imperva-SecureSphere-GW-01' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'Imperva SecureSphere' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'Identity Digital Certificate Man' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'ITROMP01SWA006-7' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'ITROMP01RTR001' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'ITC-M001' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'ITC-I185-TSDC' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'ITC-I166-HF3N32' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'Integration Platforms for SAP' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'Boomi-MDM Chatbot' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'IDJKT-I002-B1F14' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'IDJKR-SRVR1' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'HCRC-I049-PL1B' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'HCRC-I048-PL1A' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'HCRC-I044-DV3A-2' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'HCRC-I037-DV1C' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'HCRC-I024-DS2B-2' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'HCRC-I023-DS2B' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'HCRC-I019-DS1C' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'HCRC-I004-CF1D' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'HCRC-I003-CF1C' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'HBP' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'Global PEA (Post Event Analytics' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'HCRC-I072-DS1C-2' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'Gigamon' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'GZGO-I016-L41H01' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'CAPE-WC01' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'CAS Data Cubes (Datamart) Produc' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'GTE' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'GTD' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'GSR-I217-SERVER' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'GSR-I197-MDF' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'GSDC-XP49073' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'GSDC-PURE0338' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'GSDB: Global Supplier Database (' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'GRDLIMS R2 Prod' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'CAPE-I093-I21DC' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'GO-I069-CTF08A' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'HCRC-I103-CF1-8211' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'Boomi-VMI IF Product Family Inte' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'IDF-ADE Prod' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'IDF' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'ICPOCCE1GW' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'ICPOC-I003-DC1' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'ICIASC1GW' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'ICIA-I082-WHSE' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'ICCE2GW' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'ICCE1GW' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'IC-I011-13-1' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'IBACE3GW' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'Hermes (MADS)' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'HCRC-I109-IVI-703' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'HYG-WC01' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'HYG-I037-B1AE07' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'HYG-I004-B1F1R2' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'HYG-CC02' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'HUBUDP01RTR001' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'HUBCE2VPN' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'HRZAGP01WLC001' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'HRSS SAP Platform Operations Too' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'HKZTWB01RTR002Â ' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'HKZTWB01RTR002' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'HKGSKCE1GW' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'Boomi-TFM MDM subscriber Prosys' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'APCHEACE1GW' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'NOV-I017-B76F2F' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'CRM-Pampers Pro (US)' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'VCR-PRVT-EUR-UK-COBALT PARK GO-3' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'AMI-I066-SERVER' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'VCR-PRVT-EUR-SUI-GENEVA-F4-E-Dav' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'VCR-PRVT-EUR-SUI-GENEVA-F2-W-Mor' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'T&W BI FP Ground NA Prod' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'VCR-PRVT-EUR-SUI-GENEVA GBC-Mobi' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'VCR-PRVT-EUR-SUI-GENEVA GBC-F-1-' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'VCR-PRVT-EUR-Poland-WARSAW PSC-4' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'VCR-PRVT-EUR-Germany-SCHWALBACH-' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'VCR-PRVT-EUR-France-PARIS GO-2F-' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'VCR-PRVT-APAC-Japan-TOKYO OFFICE' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'VCR-PRVT-APAC-Japan-KOBE GO IC-7' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'VCR-NA-USA-WHBC-B6280-3F-C362-Ca' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'TAK-I012-LIQABG' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'AMI-I068-KHEOPS' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'VCR-NA-USA-Mehoopany-1F-B32-Fami' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'VCR-NA-Puerto Rico-SAN JUAN GO-6' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'VCR-GC-Taiwan-TAIWAN GO-7F-A01 T' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'VCR-GC-Hong Kong-HKGO-6F-Harbour' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'TAK-I028-SRVR02' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'VCR-GC-China-SHANGHAI SO-40F-Col' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'VCR-GC-China-GUANGZHOU-GT4-PSC-9' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'AMI-I061-S4F0' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'VCR-GC-China-GUANGZHOU-GT4-16F-1' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'VCR-EXEC-AMA-Singapore-SGO-18F-M' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'VCR-EUR-Ukraine-KIEV GO-3F-Board' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'ALX-I211-IDFH' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'AMI-I040-UNIDOS-1' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'TDCCE2GW' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'VCR-EUR-UK-READING PLANT IC-GF-G' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'VCR-NA-USA-MINNEAPOLIS SO CBC-40' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'VCR-PRVT-NA-USA-MASON BC-CF-3F-6' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'VGUACE2GW' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'VZGO-I012-FLOOR6' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'ADW7T' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'AKA-I012-PRJHSE' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'WebCenter - Freeflow' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'AMICE4GW' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'AKA-I017-MEETRM' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'AKACE1GW' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'SiteMinder' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'WLDSC2GW' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'WLD-WC01' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'Sitescope' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'ALOHA' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'WLD-I035-DRK' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'WLD-I020-F2' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'Solarwinds (DXC) PROD' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'WH-I077-BB3N5D' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'WH-I072-BB4S2A' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'WH-I060-FW3N31' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'Visualization Solution' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'ALT-WC01' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'ALT-I014-h1' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'WAR-I001-MOB' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'USCUEP01RTR001' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'WAR-I010-MOB' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'VCR-EUR-UK-READING PLANT IC-1F-1' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'WCMC-I001-TE01E' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'WDCSC1GW' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'WH-I011-FE2E19' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'WH-I016-BAN216' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'WH-I031-PDFEQP' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'WH-I033-FC1C14' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'WH-I054-FW4C17' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'WDCCE4GW' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'VCR-EUR-UK-NEWCASTLE IC-1F-Irthi' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'VCR-EUR-UK-COBALT PARK GO-GF-Pao' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'VCR-EUR-Turkey-ISTANBUL GO-MF-Pa' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'VCR-EUR-Hungary-BUDAPEST GO-6F-D' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'VCR-EUR-Hungary-BUDAPEST GO-6F-B' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'VCR-EUR-Greece-ATHENS GO-2F-Cap-' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'VCR-EUR-Germany-EUSKIRCHEN-EngrB' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'VCR-EUR-France-PARIS GO-3F-C03-L' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'VCR-EUR-France-AMIENS Plant-Admi' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'VCR-EUR-Finland-ESPOO GO-3F-Inar' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'VCR-EUR-Croatia-ZAGREB GO-GF-Big' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'VCR-EUR-Belgium-BRUSSELS BIC-GF-' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'VCR-EUR-Azerbaijan-BAKU SO-4F-CR' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'VCR-APAC-Japan-KOBE GO IC-9F-Tsu' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'VCR-APAC-Japan-KOBE GO IC-6F-N03' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'VCR-APAC-Japan-KOBE GO IC-10F-N0' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'Transportation Forecasting' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'VCR-AMA-India-MUMBAI GO-3F-Board' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'VCR-AMA-India-MUMBAI GO-2F-Cap-1' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'Unemployment - Employment Verifi' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'USEDPP01RTR001' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'USBOIP01RTR001' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'USBNTP01WLC001' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'USBNTP01RTR001' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'USFAYP01SWA005' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'USGRRP01RTR001' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'VCR-EUR-Israel-TEL AVIV GO-2F-To' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'USSEAP01RTR001' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'UTBE-I015-TE72-1' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'ALX-I213-FRCON1-1' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'UTBE-I040-B41F1' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'ALX-I224-ASRSNW' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'UTBE-I043-B74F1' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'USXEZP01SWS001' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'Webhosting' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'TS-I053-SERVER' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'VCR-EUR-Italy-ROME GO-3F-M3W01-C' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'VCR-EUR-Sweden-STOCKHOLM GO-3F-T' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'TF Prod' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'VCR-EUR-Spain-MADRID GO-3F-Valen' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'VCR-EUR-Spain-MADRID GO-2F-Porto' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'VCR-EUR-Slovakia-BRATISLAVA SO-5' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'VCR-EUR-Serbia-BELGRADE GO-1F-53' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'VCR-EUR-SUI-GENEVA GBC-F4-C-Base' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'AMI-I030-PAC2E2-2' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'VCR-EUR-SUI-GENEVA GBC-F3-W-Morg' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'VCR-EUR-SUI-GENEVA GBC-F3-E-St G' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'VCR-EUR-SUI-GENEVA GBC-F1-C-Base' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'VCR-EUR-SUI-GENEVA GBC-F0-W-Bern' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'VCR-EUR-SUI-GENEVA GBC-F-1 2 Col' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'VCR-EUR-SUI-GENEVA GBC-F-1 18 Ma' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'VCR-EUR-SUI-GENEVA GBC-F-1 16 Ma' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'VCR-EUR-SUI-GENEVA GBC-F-1 15 Ma' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'AMI-I014-DCSYS' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'VCR-EUR-Italy-ROME GO-4F-M4W01-C' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'TS-I004-100-3' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'VCR-EUR-Poland-WARSAW GO CUBE-GF' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'TS-I002-SERVER' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'VCR-EUR-Poland-WARSAW GO-1F-BUSI' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'VCR-EUR-Poland-WARSAW PSC-5F-Pol' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'TS-I044-700-12' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'AMDB' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'AMI-A179' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'VCR-EUR-Russian Fed-MOSCOW GO-2F' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'VCR-EUR-Russian Fed-MOSCOW GO-5F' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'VCR-EUR-SUI-GENEVA GBC-F-1 12 Ma' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'VCR-EUR-SUI-GENEVA GBC-F-1 13 Ma' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'VCR-EUR-SUI-GENEVA GBC-F-1 14 Ma' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'VCR-EUR-Portugal-LISBON GO-3F-Fo' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'ADW4P' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'USCHIB01RTR001' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'Security' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'adlg3827' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'SWA-I012-TEC1L4' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'adlg3825' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'adln5756' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'adlg3824' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'SWA-I019-STCE01' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'SWA-I009-TEC1L1' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'adlg3610' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'adlg3841' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'adlg3926' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'ABN-I031-LINE61' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'adln2621' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'SWA-I021-STCE03' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'SWA-I028-STCE04' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'adlg3916' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'adlg3828' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'adln5439' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'adlg3857' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'adln5732' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'adlg3840' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'adlg3843' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'adln5737' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'adlg3846-zl1' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'Segmentation Translation Engine' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'adlg3847' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'adln5690' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'adlg3848' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'adlg3850' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'adlg3853' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'adln5741' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'adlg3839' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'adln5744' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'adlg3838' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'STL-I016-TE61-1' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'adlg3600' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'adlg3923' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'STL-I013-TE82-5' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'Schedulin on Exalytics (PROD)' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'adlg3968' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'adln9290' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'ZAGGCE1GW' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'APCH-I002' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'APCH-I006-1' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'abn-esx004' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'adlg8204' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'adln9241' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'ABN-I050-PEARL' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'adlg3957' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'AP-Singapore-SGO-Metropolis-18F-' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'adlg8203' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'adln9306' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'AP-Indonesia-JAKARTA GO-Jakarta ' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'ACA' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'adlg8269' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'adln9240' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'adhn5641' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'gillette.hu/hu-hu_33009' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'aka-vgw001' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'LAGNCE1GW' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'pqlx4' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'DLMC-WC01' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'BW EC (Expense Control)' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'herbalessences.com/en-us_33086' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'DLMCSC1GW' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'Datalliance VMI (Vendor Managed ' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'gillette.es/es-es_33006' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'Digital Signals' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'adln5665' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'bdc-intra1240' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'golx1' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'pllx4' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'gsdc-siebel013' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'adln2400' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'LDZ-I011-LMCBX' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'CNPDGB01RTR005' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'DTC eStore - Consumer Shop' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'adlg8243' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'adln2753' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'LM-I192-PFMIXRM' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'DRDCE1GW' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'Data Direct Solution' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'LMCON-I192-PFMIXRM' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'skertcisesx2' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'VCR-EUR-SUI-GENEVA GBC-F0-E-Sion' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'VCR-EUR-Poland-WARSAW GO-1F-Agry' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'LON-I013-H2C2' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'pillx4' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'adln2612' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'VCR-EUR-SUI-GENEVA GBC-F2-W-St G' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'LON-I035-H15C1' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'CNSGSC1GW' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'gillette.co.in/en-in_33010' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'mil-quantum001' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'ggo-safcl001' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'Mac laptop - Instance' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'gadc-siebel111' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'Material Costs Analysis (TDC)' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'BRSERSC1GW' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'adln6740' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'BRSER-I012-CONST' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'BRICSC1GW' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'Microsoft Project' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'UTBESC1GW' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'BOSGCE3GW' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'BOSG-I055-SERVR3' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'bdc-rtcedge04' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'prga-sis-srx-euh-04' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'NACH-I004' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'adln9261' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'Consumer 360 Insights' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'bdc-rtcpocse1' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'USZDCP01RTR001' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'CORIO-WC01' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'USWASP01RTR001' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'Cloud Launchpad' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'CRA-I015-CPM253-3' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'adln9300' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'CVT (Chemical Volume Tracking) /' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'NACHBE-TMSXE1-4' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'USFAYP01RTR001' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'NACHEC1SV' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'xqlx3' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'gadc-intra664' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'MYPGS - Compensation & Benefits' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'CNSNYP01RTR001' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'MXMILSC1GW' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'gadc-sqlp013' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'ggo-pbxaas001' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'MANSC1GW' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'DIL-I005-AE2' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'MEC-I047-BRLIN45' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'MEP (Market Estimates and Projec' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'VCR-EUR-Germany-SCHWALBACH-S02-F' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'wee-pbxaas001' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'gbs-esx001' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'KRO-M001-U' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'VCR-EUR-Germany-SCHWALBACH-S01-A' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'gblx.rtcis1' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'MHF-I042-B1F1RD' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'MHF-I044-B1F0RJ' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'spb-esx003' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'MAN-WC01' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'gadc-winautop01' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'DEDARP01SWC001' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'MICDSC1GW' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'bdc-lccs600' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'VCR-EUR-Denmark-COPENHAGEN GO GF' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'adln5747' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'MOSC1GW' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'adln5755' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'MSE Corporate Reporting' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'MXHXCP01RTR001' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'MXHXCP01SWA001' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'adln6719' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'gadc-sqman001' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'adln6720' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'webforge-zl1' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'prga-sis-ltm-nah-01' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'MHF-I026-B1F1RC' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'hyg-mesdatabc' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'Direct Shipment Data (B2B)' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'sdlg3862' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'HCRC-I058-SB4B' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'HCRC-I086-DV1B' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'mailprov' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'ALT-I001-a2' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'HCRCSC1GW' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'Boomi-TFM MDM subscriber-Echelon' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'mtep-esx001' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'lvlx.rtcis' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'FSS Invoice Integration' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'lulx5' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'lulx4' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'WH-I059-FW3N31' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'WLD-I022-H1B' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'HUGPCE2GW' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'FCP' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'Boomi-Solvoyo Cloud-DPI' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'IBA-I019-IDF' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'IBASC1GW' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'Boomi-PLOG' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'adlg3837' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'naclsc1gw' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'WDC-I044-SERV3' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'WCMC-I023-Serv2' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'limlg99' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'Executive Insights Daily NOS Pro' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'ldz-serena' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'HYG-CC01' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'Evaluate' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'sg-wfs001' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'WLD-I036-U1' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'ADW Platform' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'Wireless Local Area Network (WLA' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'mil-esx001' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'GIST' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'CBI (Customization BI)' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'mklg1' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'GO-I028-TEF03H' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'GO-WC01' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'GOSC1GW' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'GSAW2-I180-G' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'anp-pbxava001' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'GSDC-3PAR3018' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'mnlg9' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'manlx2' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'sdln9215' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'Wazuh Endpoint Agent' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'meclx2' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'GBSC1GW' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'sdln6689' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'mdclx6' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'GZGO-WC01' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'mcbc2gwv' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'GZGOCE2GW' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'GBADSC1GW' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'HCRC-I002-CF1A' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'HCRC-I015-CF3D-2' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'HCRC-I017-DS1A' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'adlg2999' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'WebCast' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'CMED-I014-PROD' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'sgo-safcl001' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'sdciptcmpub001' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'always.com/en-us_32800' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'Internal Management Reporting' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'adlg3896' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'igm-pbxaas001' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'shi-vgw001' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'EUCH-ST-DHCP-03-F' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'VCR-GC-China-BEIJING IC-2F-2.190' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'JIJ-WC01' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'VCR-GC-China-BEIJING GO-6F-BJCBD' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'VCR-EXEC-EUR-SUI-GENEVA-F2-W-24-' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'bcru-esx001' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'JPTAKF-I008-MACRM' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'VCR-EXEC-AMA-Singapore-SGO-21F-C' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'balx8' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'EUCH-I005' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'ESMADP02RTR001' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'GEN-I042-TWRD26' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'sblx4' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'CNLGCE1GW' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'KBC-I004-ITROOM-4' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'wee-vae001' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'sac-vgw001' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'EDCI1FW' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'rot-pbxaas001' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'adlg3991' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'hyd-esx004' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'KP-I010-B7R11' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'EC2AMAZ-CKI1M9M' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'welegadbqa-zw01' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'ALX-I209-AMB1' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'nwb-mestrnhc' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'iolx2' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'azl-enop06' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'Enterprise Directory  - QA' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'nemc-esx001' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'kro-wfs001' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'kro-pbxaas001' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'Enterprise Data Dictionary' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'INBAD-I002-B1F0R1' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'INBAD-I016-B1F111' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'VPL-I051-B1F0R5' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'VPL-I021-B1F0R2' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'INGOCE3GW' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'INHYDCE1GW' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'kc-esx004' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'CNHAP-I001-MAIN' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'newlx3' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'Employee Data Extract Request' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'Echelon (PROD)' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'VCR-PRVT-EUR-SUI-GENEVA-F0-E-Vev' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'EUS-I057-LEHRWE' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'ITC-I146-HMSLF9' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'ITC-I149-MS2E10' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'novlg2' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'VCR-PRVT-AMA-Philippines-MANILA-' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'CNHAPCE3GW' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'Boomi Veeva CRM EU SAP Interface' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'EUS-I028-HALLE1' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'adlg3861' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'Boomi - CRM POH EMEA integration' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'Boomi - BrandStore Integrations' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'KRO-I046-HC' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'WAR-I008-MOB' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'APCHEC1SV' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'PRCXQSC1GW' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'gadc-bnkgsmrt01' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'T&W BI FP Ground ASIA' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'ORCA' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'Personal computer' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'bdc-vgw012' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'OX-I002-SERVER' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'eulg1' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'AVM-WC01' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'BMA-I004-DC1CR1' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'eus-adicom001' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'ALXSC1GW' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'bdln2826' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'TPM-Iberia/UK' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'RGMSC1GW' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'TAI-I031-B1F7R3' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'Onapsis Security Platform' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'PLC-Product Life Cycle Automatio' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'SUA' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'BLIN-I051-SFNET' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'BKL-I032-B1F1R3' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'Time & Attendance' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'AY-I222-DL-2' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'takalicssw001-1' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'bhlx4' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'bdlg3396' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'BLOV-WC01' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'BLINSC1GW' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'SAP Master Data' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'SHICE1GW' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'BIC-I019-B1' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'SalesFactData' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'bdlg2533' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'tsp-stewcs03' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'AY-I209-IDF-65' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'Onapsis-Console' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'Skybox - Ashburn' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'SGCLEB01RTR001' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'TS-I019-400-9' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'cdlx2' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'PG Tube' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'TAK-I027-SRVR01' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'SAP-ERP (Treasury Banking)' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'TAK-I014-BWARE' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'SGGO-I006-L20S02' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'Oracle BI on Exalytics (UAT BDL2' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'BMA-I037-Molding' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'BMA-I013-SENSR7' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'dentureliving.com/en-us_32994' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'Active Control (Transport Expres' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'tsp-mesapphhc' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'AXON ADW6P NON-CBP' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'vbq-tapemm001' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'fnmp005-zw2' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'eus-pbxaas001' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'talx4' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'One Health TrackWise GSH (GTrack' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'BDC-3PAR4105' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'TS-I001-USER' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'Ping Access' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'BDC-XP53270' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'daylg7' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'PHCSC1GW' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'TAK-I011-LIQABG' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'usalspgra011' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'RGM-I005-B7F0R3' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'bell-famsql01n' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'TAKSSC1GW' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'BDCC1GW' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'AOV-Advanced Order Visibility' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'cgo-pbxava101pr' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'beu-esx001' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'SHI-I002-SERVRM' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'Network Management Operations' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'bdc-sqlpfp002' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'cnt-pbxaas001' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'BMA-I002-SERVCR2' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'prga-sis-srx-tak-01' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'PQASC1GW' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'UDW (Unstructured Data Warehouse' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'PRCXQ-I001-B1F2R1' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'Trigger NG (Prod)' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'NOV-I072-B75F3B' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'SAC-I002-B40-D' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'bdu01a2c' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'NOV-WC01' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'NOVCE3GW' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'usahadspgco200' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'BLIN-I050-SFNET' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'tclx4' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'bdhp4176' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'blov-sql004' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'gadc-inetdbq01' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'gadc-iamsql01' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'gadc-glbtp001' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'NAUPCE3GW' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'SAP Core Purchasing SAP-MM-PUR -' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'THPSC1GW' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'telx4' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'eQMS Cloud' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'NEMC-M001-MDF' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'TIBCO BW PROD Instance' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'bdlg3443' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'brdlx2' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'NGLG-I006-SERVER' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'brg-safcl001' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'bdln9257' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'usahadspgco300' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'NOVLHN001' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'SAP-AR - F6P' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'cxc1-ldapprd002' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'gadc-easwgp01' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'tak-rtt002' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'BLOVSC1GW' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'SH - Chemicals Shipments Reporti' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'blov-mesdtabc' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'ALX-I232-DIST' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'SH - MDO Shipments Reporting' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'bru-rtcedge01' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'gadc-easfa01' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'PMAT' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'PLOG US&UK' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'cape-mesdatafc' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'gadc-dmsprod' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'Shipment Planning' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'bdw01a2e02' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'Requirements Management (MBD)' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'BDP-I022-IDF01' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'gadc-easwgp02' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'eMail' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'Security Information Event Manag' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'ATVIEP01SWA001' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'SWA-I011-TEC1L3' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'RetailX Smart Selling APAC-IMEA' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'BELLCE1GW' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'SAP-IM EMEA SC (F6P)' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'KHP' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'polx3' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'Price Workflow' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'GZP' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'shlg2' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'GSDB: Global Supplier Database' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'phm-pbxaas001' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'DLMC-I001-SERV1' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'BLOV-I057-LAIC1' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'JIJSC1GW' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'Perfume Initiative Execution (PI' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'SGTUCE1GW' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'DMT--HL' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'eCARM â€“ TRIM' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'KHP 2' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'ABN-I044-G2' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'agizbakimuzmani.com/tr-tr_41166' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'iclx2' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'KDP' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'SAP-PI-Customer EDI (Dev)' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'PSSS & TO - Order Management IT' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'CAPE-I040-I41B1' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'CNSGCE3GW' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'ServiceNow - ITSolutions' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'ALTSC1GW' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'DS Agent Prod' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'Resource Scheduler' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'lvlx3' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'HGD' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'IMP-I027-B1F1I1' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'bdlg3415' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'krln1001' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'crest.com/en-us_32912' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'ESD3SWS [Prod]' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'VPLCE3GW' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'IMS (Innovation Management Syste' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'thlx2' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'WLD-I003-SERV2' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'Boomi-LIMS' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'AUGOCE1GW' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'IMP-M001-B1F1R7' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'Supplier Portal - Base and Admin' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'CNPDGB01GWC001' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'Boomi-Order Acquisition POH (Pro' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'AMICE3GW' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'circuit--hl' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'lonlg1' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'SAP BW - Shared Master Data' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'lonlg9' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'WH-I066-FE1C19' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'IBP Integrated Business Planning' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'Storage Optimization: eCARM HA' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'WERCS' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'oralb.nl/nl-nl_33187' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'avm-poputil001' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'HKGOCE1GW' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'WCMC-I008-TE05E' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'Boomi-TFM MDM subscriber Optima ' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'S4 (Prod)' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'HCRC-I080-K1PT1' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'ahmlx6' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'WLD-I009-A1A' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'AUNRYSC1GW' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'badlx1' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'daylg6' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'adln2620' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'ITCSC1GW' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'jelx4' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'SAP IT Security Services' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'THACE3GW' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'AVMCE2GW' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'DXC Operational Analytics' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'Boomi - MEGA to RITA Integration' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'SG-3PAR3186' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'DTCS Operations' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'TAK-I026-SVRRM' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'AVMSC1GW' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'dbi-pbxaas001' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'TAICE3GW' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'daycrnesx1' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'BIC-I059-Q1' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'VPL-I002-BL02F1' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'CNPDGB01RTR003' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'Supplier Portal - Material Plann' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'BLO-I022-SB11' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'azw-cnfg-vm02' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'VCR-PRVT-GC-China-GUANGZHOU-GT4-' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'Boomi-Capture and Validation' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'SAP Freight Cost Documents - Pro' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'SZDC-I003-CR1' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'IRA/IPP Administration' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'rneg-esx001' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'HCRC-I027-DS2D' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'AMI-I065-SERVER' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'IST (Integrated Security Tool)' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'shalx1' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'adlg3954' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'alp-pbxava001' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'DERWSP01SWA001' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'bdc-iptsmpub001' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'CCDQ (Customer Centric Data Qual' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'MOS-WC01' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'gadc-cfm004' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'MOSCE1GW' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'MOSCE2GW' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'OMP+' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'VCR-EUR-Belgium-BRUSSELS BIC-1F-' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'MPSC1GW' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'bel-pbxava001' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'OCT6SC1GW' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'Tibco-BW' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'gadc-swinds001' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'bdc-vaesys001' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'Numerify Cloud Analytics' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'ABN-I046-SERVR3' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'adln9275' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'adlg3846' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'MMISC1GW' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'MMICE01GW' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'GBRDNP01RTR001' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'MHF-I034-IDF1' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'BRTC-WC01' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'MHF-I035-IDF2' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'adhn4801' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'mp-mesdtafc' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'PRCXQCE4GW' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'B2G Cygnet (Decommissioned)' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'gadcdistgw' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'GBADCE1GW' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'ami-pbxaas001' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'gadc-wmdgsqlp01' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'ORDER' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'GB-I018-MDF' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'COBSC1GW' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'VCR-EUR-Czech Rep-PRAGUE GO-4F-C' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'Nexus LIMS' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'VCR-AMA-Thailand-BANGKOK GO-20F-' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'NACH-I002' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'NOV-I016-B1F2I' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'sdhn5389' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'us.braun.com/en-us_32882' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'NACH-ST-DHCP-03-F' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'NACH-ST-DHCP-04-F' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'bdln2519' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'nalx3' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'adln9307' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'NACHBE-TMS1-3SV' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'CMED-I012-ADM01' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'NEMC-I010-TE03D' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'BOR-I071-B5F1R7' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'Expat Tax Email Reminder (ETER)' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'NACLEACE1GW' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'braun.ru/ru-ru_32874' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'BORSC1GW' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'ami-alps001' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'BRDC-I104-TC-G' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'MXMIL-C015' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'bdc-pbxava011' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'bdln9114' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'bdc-v6esx511' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'Maple Application' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'Cloud Active Directory Prod' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'BRTC-I131-CP-A' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'MHF-I025-B1F1RC' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'braun.be/nl-be_32852' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'B2G Acepta' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'bdln2517' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'Travel Management' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'CRA-I066-L41' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'BRK-I024-SwWet' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'gadc-oorchpdb01' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'CRGBSCE1GW' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'McAfee AV' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'gbs-pbxava01' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'WH-I040-BB2S83' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'cailx5' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'ACP' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'PLM PickList Manager' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'L7P' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'LON-I050-HUB24' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'WorkFusion Automation - TCO' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'bdc-intra112' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'VCR-EUR-Netherlands-ROTTERDAM GO' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'TIBCO-BWAS' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'BEL-I058-B21S' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'eus-esx001' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'eulg3' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'cai-esx001' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'etlx1999' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'LM-I061-OFFICE' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'DBI-I011-B1F1R1' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'ADW6T' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'bdln2726' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'MHF-I006-B1G1R2' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'novlx2' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'GO-I080-CTF11C' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'PLLODP01SWA007' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'BUDGOCE1GW' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'prga-sis-srx-AMI-01' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'DEFRAB01RTR001' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'SUA Production - Instance' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'bdln2399' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'GO-I077-CTF10C' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'headandshoulders.de/de-de_33032' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'PPM (ProductNet->PLM Interface)' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'headandshoulders.com/en-us_33061' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'MEC-WC01' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'tablg3' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'MHF-CC01' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'MEQSC1GW' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'hugp-esx001' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'gelx4' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'anlx6' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'MEQ-I011-SERVER' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'ami-sql003' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'KRGOCE3GW' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'MEC-I048-SERVER' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'TSSC1GW' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'BW GL (General Ledger)' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'VCR-EUR-Germany-SCHWALBACH-S03-F' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'bdhm' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'ServiceNow' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'MEC-I024-7F2C14' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'mkh2' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'GDC Global Data Client (G11)' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'STLCE3GW' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'Customer Dashboard Pharma' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'merlx2' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'usalspg17001' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'merlx3' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'gillette.ca/fr-ca_33002' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'CASTORO' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'chdlx1' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'EGFE-I004-FLR4' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'FVP' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'HXP' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'melx2' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'bdln2518' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'urlx4' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'cailx8' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'ENOVIA Exalead' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'CATIA Client' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'SAP-PI' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'Adobe Creative Suite' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'SAP-SCM-gATP - GVP' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'ablx3' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'usalspg11001' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'Global Payroll' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'SAP Freight Cost Documents' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'bos-pbxava001' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'mkh1' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'mnlg1' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'sdln9220' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'Social Security Tax' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'C&F Reporting Tool' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'WLD-I037-V1' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'ade12-exadata' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'wmgxsqlp01-zw1' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'BDC-3PAR3437' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'WLD-I044-WF1' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'EUS-WC01' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'matlx6' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'BIC-I016-A0' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'EUSCE3GW' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'BICSC3GW' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'Employee Data Management' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'WWMD (PROD)' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'lvlx2' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'adlg3893' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'cgp-pbxava001' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'atlcrnesx1' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'GEP' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'mpp-pbxava001' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'cailx6' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'EUSSC1GW' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'WHGW' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'caslx1' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'Forecast Mix' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'AY-I169-IDF-14' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'olay.co.uk/en-gb_33148' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'ServiceNow - HR Payroll Manageme' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'Excel & Uploads' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'lolx1' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'gillette.jp/ja-jp_33012' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'eus-mesdata1' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'relx4' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'PLLODP01SWA004' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'gsdcdistgw' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'belx4' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'aeclx1' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'entsr-zw011' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'A7P' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'skelg1' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'aelg2' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'EGFE-I003-FLR3' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'THPD-M030-SRVR' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'sk-ii.com.au/en/index.aspx_3152' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'KNIME Server on Azure NAS' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'prch-esx001' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'eManufacturing-Newton' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'KBCCE1GW' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'sjc-safcl001' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'PUR-Atlas' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'bhlx1' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'JPTOCE1GW' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'Performance Management' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'SGTU-I001-B1F2C1' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'Pool Tool' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'taklx4' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'DRDCE2GW' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'PHC-I038-LQD' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'LONSC1GW' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'BTC-WC01' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'TS-WC01' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'NEMC-I011-SERV1' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'adln9316' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'USORLP01RTR001' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'CSBGOCE1GW' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'gadc-esq002' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'BOSGSC1GW' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'Microsoft Office' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'API Management Platform PROD' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'VCR-AMA-Malaysia-KUALA LUMPUR GO' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'Claims Manager' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'gadc-eassql01' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'Managed Print' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'Mac laptop' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'Inventory Insights' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'MXMIL-I011' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'MP-I060-75-1' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'VCR-EUR-Belgium-BRUSSELS IC GF M' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'OXSC1GW' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'gadc-wpi001' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'COBCE3GW' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'BOGO-I049-2L' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'VCR-EUR-Germany-KRONBERG PLANT I' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'Core Data Hub - NA' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'Optima Promo Planning tool (PPT)' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'tablg1' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'adln9254' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'ralx4' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'CyberArk' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'MPI - My Personal Information (E' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'defraiptsmsub001' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'helpdesk' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'daylg1' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'SAP - BW CheckMate [GRP] DB' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'lma-pbxava01' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'dalcrnesx1' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'Reform' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'crulx3' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'Boomi â€“ DTC Outbound Catalog and' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'oxp-pbxava001' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'bkl-pbxaas001' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'ATSPIP01SWC001' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'dallg1' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'ASNCE2GW' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'SAP-SD (Shipping) - A6P' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'Symposia City' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'pampers.com/en-us_33259' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'Boomi â€“ DTC Outbound Email' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'EDC-3PAR8077' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'dallg3' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'HYG-I042-B2SRV' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'infoPaGe Direct Shipment Reporti' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'RBW Project Dashboard' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'HYGCE3GW' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'aka-esx001' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'aylx4' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'VPL-I116-B1F0R1' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'shalx5' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'Pulse Secure (Prod)' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'imp-pbxaas001' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'Database Services' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'daylg4' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'APSA - Annual Plant Standard Aut' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'OMP+ APS FHC5-PROD' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'tablg6' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'bllx2' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'BRTCSC1GW' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'vpl-cdr001' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'laglx2' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'GBS-I001-SERVER' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'MEC-I040-9F1C19' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'MHF-I012-B1F0R5' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'SKU Complexity' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'ABNSC1GW' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'Demand Planning Reporting' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'Google Chrome' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'mplx3' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'nov-mesdtabc' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'NCP' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'sglx1' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'alx-pbxava001' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'brclx4' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'bdc-sbc01' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'lmlx1' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'NLAMSB01RTR001' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'APCH-ST-DHCP-05-F' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'APCH-ST-DHCP-03-P' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'usahadfpgco001' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'NOV-I084-B75F3B' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'Centrify Infrastructure Services' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'Microsoft Lync' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'BRSERCE1GW' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'NPI portal' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'Finance MDM' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'EGFECE1GW' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'chdlx3' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'MAP (Market Analysis Platform a.' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'WH-I013-FE2E19' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'tha-safcl001' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'gadc-sqman002' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= '3PLConnect' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'oralb.pl/pl-pl_41165' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'fixodent.co.uk/en-gb_32993' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'gillette.co.uk/en-gb_33020' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'TSCE1GW' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'merlx5' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'AY-I150-SERVR2' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'VCR-PRVT-EUR-SUI-GENEVA-F4-W-Mor' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'HCRC-I036-DV1B' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'gillette.ca/en-ca_33001' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'marlx1' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'tilx3' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'EUS-I013-EERAUM' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'eFC (Electronic Formula Card)' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'adlg3869' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'talx6' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'meclx1' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'AMI-I044-PAC5OS' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'wfgovern-zl01' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'wolx1' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'jiclx3' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'JPTAKFSC1GW' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'GZGOCE1GW' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'tor-pbxava01' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'atllg3' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'C3DB' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'usalspgsa438' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'skelg5' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'gadc-icsprd001' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'tampax.co.uk/en-gb_33351' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'eulg2' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'INBAD-I015-B1F111' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'HCRC-I082-K2PT3' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'BELL-I092-B25MC' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'bdcdistgw' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'LMSC1GW' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'malx4' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'GEN-I038-TWRB24' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'PLLODP01SWA006' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'Webcenter SaaS' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'IMP-I047-NSTGF' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'LDZ-I018-LMCPC3' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'LDS (Longterm Demand Sensing) PR' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'azl-shrorape01' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'bdc-extra155' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'EUS-I046-7ERAUM' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'prga-sis-srx-euh-03' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'brclx3' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'DPF (Data Processing Framework)' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'polx2' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'AY-I150-SERVR1' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'EUCHEACE1GW' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'SAP-SD (Order Management) - F6P' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'SPA (Spend Pool Analysis)' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'SH - CFR Root Causing Tool' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'newlx2' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'ARGUS' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'SLS (Smart Learning System)' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'usqasb02swc001' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'blov-esx001' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'Security Weaver' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'EDC-3PAR8069' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'aelx1' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'Direct Tax & Local GAAP' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'Enterprise Directory  - PROD' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'CNHAPSC1GW' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'LDZ-I012-LMCBOA' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'Expat Tax Settlement (ETS)' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'melx1' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'SAP Single Sign On (Single User ' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'gzlx6' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'C3DB (Production)' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'emclg4' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'emclg3' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'eis001-zw1' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'celg2' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'hydlx3' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'SAP EnableNow' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'BW PROC (Procurement)' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'thlx1' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'JPYAUP02SWC001' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'JPYAUP02SWA008' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'PeopleFinder' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'axlg99' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'kalx2' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'ALT-I021-M1' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'balx5' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'bdln2641' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'Pulse Secure (VPN.pg.com) - **fo' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'Integrated Security Tool' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'LDZ-I014-LMCBOC' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'Prod' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'IBA (Intelligent Business Alerts' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'tclx6' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'HYGSC1GW' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'aylx3' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'SAP Basis' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'SAP Build Services' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'dolx5' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'LDZSC1GW' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'INAMDP01SWS002' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'ADZ11-ADZ12' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'Azure API Management' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'Material Master Automation (MMA)' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'adlg3817' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'Microsoft Teams' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'MHF-I028-B1F1RD' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'mvlg3' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'AMA Hub Application Blueprint 2' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'NLAMSB01RTR002' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'NOVSC1GW' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'MECSC1GW' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'Artios CAD' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'PASS' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'mnlg5' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'USXDCD01FWL01' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'PLLODP01SWA002' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'NACHBE-CUCMP-1SV' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'NEMCSC1GW' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'bdln2465' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'cailx3' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'VALP-I001-VALDC' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'SAP-BW (Global)' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'Internet Explorer' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'shalx3' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'Indirect Tax Compliance' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'ahmlx5' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'DPF Application (EDW MM)' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'CRASC1GW' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'badlx3' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'INBADSC1GW' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'USABNB01RTR001' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'jplx3' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'phlx3' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'MSA Expense Management' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'Citrix PG VirtualApp  (productio' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'belx3' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'sntlx2' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'bdln9267' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'xqlx1' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'DAT-AOV (Advanced Order Visibili' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'D4P' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'adlg8225' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'Cyber Defense Operations' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'adln5723' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'bdc-iptcbsaf001' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'eCARM - KGS' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'K5P' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'JPYAUP02SWS003' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'qulx4' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'bhlx3' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'pillx3' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'sylx1' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'PLLODP01SWA003' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'VCR-AMA-Singapore-SGIC-Biopolis-' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'bclx1' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'xqlx6' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'Purchased Materials Automation (' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'INAMDP01SWS001' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'C360 Data Platform' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'cdlx1' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'SAP ERP Financials - SRA' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'WLD-I019-F1' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'novlx1' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'lvlx1' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'sblx3' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'lulx3' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'rnlx2' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'oralb.fr/fr-fr_33178' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'adhn4913' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'tclx3' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'CEO Award' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'braun.de/de-de_32859' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'GBS-I046-SERVER' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'mxo-cmecube001' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'Audit' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'IDF (Prod)' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'Datalliance AP (Prod)' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'Endpoint Threat Management' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'IDFP' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'Award Payment Preferences' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'FPP' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'calx3' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'GPDB: Global Product Database (P' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'EUCHSC1GW' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'BRTC-I134-CP-B' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'UNIX--HL' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'SAP Payroll Control Center' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'SH - RCT (Rapid Correction Tool)' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'SH - P&G Worldwide Shipments' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'External Reporting' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'gulx3' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'Wirekey' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'Microsoft Teams DirectRouting' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'golx3' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'gadc-plmgp001' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'tablg7' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'gglx1' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'solx1' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'Microsoft O365 - OneDrive for Bu' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'MFTSentinel (Prod)' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'DIL-I007-AE2' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'brsdfsql01-zw1' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'CCM - Consumer Complaints Manage' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'MIC' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'adln9265' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'Consult (Digital In-Store Counse' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'APIGEE API Management Platform' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'Global Separation System (GSS)' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'AMISC1GW' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'BW FMR (Financial Management Rep' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'RTDC' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'CNPDGB01RTR001' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'ITC-I133-HF4C35' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'DV Common Layer' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'S/4HANA P2P Reporting' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'Store Execution App' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'bidlx1' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'cob-pbxava02' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'J1P' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'SAP Ariba STRM' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'Security Ops Center' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'Spot Rate Request Tool' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'hylx3' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'SAP-S2C BW Chemicals Business Re' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'rnelx6' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'SH - Direct Shipments SWIFFER' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'SH - Case Fill Rate (CFR)' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'K6P' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'merlx1' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'vmlx1' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'Trackwise' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'Cloud Platforms' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'limlg1' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'Cloud Active Directory' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'SH - SFDS (Shipments Fused Dimen' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'marlx3' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'Rulex - Production Instance' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'matlx5' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'jklx5' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'adlg8266' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'jolx3' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'KNIME Platform' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'laglx1' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'Group Genie' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'F7P' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'brdlx1' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'tblx3' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'orlx3' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'FireEye HX' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'gadc-cell2-sw01' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'VPL-I060-NBDR' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'WebCenter - RTA Softpoints' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'malx3' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'SAP-BW ES-HR (Employee Services)' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'cgo-sbc001' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'PC Trade Up' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'ServiceNow - Employee Care HR Ca' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'amplg5' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'HKZTWB01RTR001' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'GEDB: Global Enterprise Database' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'GSP' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'SH - Business Pulse' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'PLM Central User Registration' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'LA TST - SmartSelling' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'sntlx1' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'MHF-I043-B1GRTR' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'Corporate Home Page' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'lodlx1' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'ANP' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'BigFix Corporate Production' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'ralx3' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'splx1' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'CFM Canada' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'relx3' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'shilx1' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'riolx3' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'TIE' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'SAP-SD (Order Management) - L6P' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'daylg5' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'jklx3' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'SRM PP (Price & Promo)' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'celx3' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'T&W BI FP Ground EMEA' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'DIL-I009-AE2' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'VCR-AMA-Singapore-SGO-Metropolis' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'kalx1' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'pqlx3' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'SAP Ariba Network (SCC)' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'anlx1' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'atlx6' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'TAX Vault' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'dallg5' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'brklx1' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'chdlx2' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'MarketScope' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'thlx5' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'oralb.com/en-us_33198' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'eCARM - KOFAX Software' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'Executive Distribution' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'ACL AX - Global (Production)' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'oplx3' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'HCRC-M001' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'SAP BO (Prod)' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'borlx3' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'T&W Analytics' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'tablg5' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'MyPSP (Performance Stock Program' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'iclx1' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'dalx3' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'prga-sis-srx-nah-03' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'gblx1' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'shlg6' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'WebEx' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'gsdc-cell3-sw01' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'hplx1' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'LDZ-I013-LMCBOB' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'bdln2729' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'allx3' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'WOM (Web Order Management v0.0 I' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'qulx3' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'aelg1' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'SIOD (Shopper Insights On Demand' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'NACHEACE1GW' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'CAS Data Cubes (Datamart)' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'GVP' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'gadc-ldapprd001' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'seklx6' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'Walmart Galaxy' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'L6P' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'gillette.com/en-us_33021' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'xqlx5' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'sk-ii.co.th_4387' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'ILM Optimization' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'brsql001-zw1' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'thlx6' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'always.co.uk/en-gb_32799' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'JDA Business Analytics for TMS' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'iSARA (Prod)' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'My Payroll Files' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'urlx3' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'BELSC1GW' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'sk-ii.co.id/in/index.aspx_27753' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'APCHSC1GW' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'TCF Prod' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'Hierarchy Tool (HIT)' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'General Ledger' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'gadc-eptmepo01' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'Switch' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'jelx3' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'IPaaS-Boomi (PROD)' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'lvlx6' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'HWP' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'gadc-oorchpd001' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'bdlx4003' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'GMP' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'GBP' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'DPF (Data Processing Framework) ' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'novlg3' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'talx3' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'ENOVIA Data Handler' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'SCSI (Supply Chain Synchronizati' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'FireEye Endpoint Threat Preventi' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'cdlx5' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'celg1' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'G11' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'SAP-HR-PAYROLL-GT' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'taklx3' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'D1P' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'Career by Design' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'CDS' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'oralb.de/de-de_33176' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'DPR (PROD)' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'italx6' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'telx3' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'Servers (Linux/UNIX)' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'SAP ERP Financials - MSA' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'celg3' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'newlx1' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'daylg3' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'balx7' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'adln9321' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'Enterprise Search' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'Exabeam' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'bdc-223-sw01' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'Payroll Performance Management' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'NACHSC1GW' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'skii.com.cn_3148' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'myISOP' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'gylx1' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'anlx5' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'SAP Logon' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'KPP' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'McAfee Endpoint Protection' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'polx1' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'IVR (Interactive Voice Response)' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'Electronic Lab Notebook (ELN)' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'Media Reporting Service - iRisk ' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'LAN' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'FPT Profit Forecast' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'FASTMART Platform (PROD)' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'tenableappliance' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'CISPro' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'US Retirement Plans (USRP)' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'adln9304' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'BW SRAP (Legacy)' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'kolx3' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'oralb.co.uk/en-gb_33197' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'Selling Content (formerly Custom' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'sk-ii.com.my/en/index.aspx_3149' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'gzlx5' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'sk2.co.kr/kr/index.aspx_2645' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'adlg2998' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'Chromeleon' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'adln9288' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'GDSN - LANSA' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'bdc-iptcmpub001' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'pllx3' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'iolx1' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'talx5' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'F5P' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'Global People Mobility Services ' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'G4P' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'GCDB: Global Customer Database' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'bdc-221-sw01' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'cailx7' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'gelx3' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'BARS (Budget and Actuals Reporti' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'NP1' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'Power of You (globoforce)' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'eManufacturing' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'SAP-HR-PAYROLL-MY' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'BW IPSR' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'DV (Data Virtualization) Platfor' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'atlx5' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'IDP' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'mdclx5' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'ADW Reference Data (RDSv2)' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'IOP Tracker (IOPT)' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'Data Fabric' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'bajlx3' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'D2P' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'Enginuity' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'rnlx1' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'Microsoft Lync (Prod) 2' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'Digital SKU Base Plan' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'WAN' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'Xerox Secure Print Manager Suite' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'My Career' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'manlx1' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'APIGEE API Management Platform P' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'seklx5' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'SAP-ERP (Human Resources)' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'KAP' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'CA API Management Platform' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'bllx1' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'CF - Revenue Accounting' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'sk-ii.com.sg/en/index.aspx_3150' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'Optima Tx LA Prod' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'Agile PC' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'SAP-HR-PAYROLL-VN' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'Office Plus' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'sde2-exadata' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'SAP SEM - Financial Consolidatio' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'Security Role Development' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'gadc-cxesys01' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'Golden Eye (aka DICOM)' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'SAP-HR-PAYROLL-CH' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'WorkFusion' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'rnelx5' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'CRM-Pharma Italy' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'PingFederate' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'APO DRP' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'SAP-HR-PAYROLL- PA' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'nt--hl' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'SAP-BW (Regional)' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'A6P' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'GAIMS' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'LDS (Longterm Demand Sensing)' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'SAP-HR-PAYROLL-HK' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'tclx5' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'D3P' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'italx5' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'bdc-126-sw01' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'Enterprise Directory (LDAP)' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'SAP-HR-PAYROLL-TW' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'ECM - Customer Portal Genesis Tw' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'novlg1' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'Consumer Research Center' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'Customer Forms' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'Price Corridor (PROD)' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'MEGA' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'LabWare Digital Quality LIMS' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'Office' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'sk-ii.com.hk/tc/index.aspx_3151' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'General Ledger Accounting' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'Brand Health on Demand' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'MIC Customs Solutions' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'ade11-exadata' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'SAP - ERP' then 'SAP - ERP'
when coalesce(ci.name,'UNSPECIFIED')= 'Core Data Platform' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'ISC (Inventory at Standard Cost)' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'REA (Retail Execution Alerts)' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'sk-ii.com.tw_2646' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'CAS NA' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'SAP Landscape Transformation Rep' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'Microsoft Office 365 (O365)' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'lvlx5' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'IBP-I Integrated Business Planni' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'ZScaler' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'WLAN' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'SAP ERP Financials - CO-PA' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'SAP SCS - PROD Instance' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'GCS - Salary Planning' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'F6P' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'SAP-BW R/3 Security / CheckMate' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'Voice' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'B2G outbound' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'B2Bi (Prod)' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'SAP-HR-PAYROLL-AU' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'Core Data Hub - EU' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'bdc-222-sw01' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'SAP-HR-PAYROLL-ID' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'KWP' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'SAP-PO' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'Perfect Store (FR)' then 'Perfect Store (FR)'
when coalesce(ci.name,'UNSPECIFIED')= 'Sentinel (PROD)' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'RTDX' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'SAP' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'My Pay & Benefits Information' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'Master Minder' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'shlg5' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'Counter Insights' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'LAStore' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'sk-ii.jp_2338' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'STEAM' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'RTDC (Realtime Distributor Conne' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'SAP-Netweaver (HR Portal)' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'IT@Labs' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'SAP-S2C BW/BO Retail Business Re' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'My Pay' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'SAP-HR-PAYROLL-KR' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'MOI - My Organization Informatio' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'Financial Master Data' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'Blue Prism Automation Platform' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'Darwin' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'Workfusion Automation - OM' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'iBOT - MSA Expense Management' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'Optima Tx CEEMEA Prod' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'Axon' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'Microsoft Azure' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'SAP-HR-PAYROLL-SG' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'Big Data AWS Cloud (PROD)' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'K4P' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'Di Junction' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'SOARS' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'SAP-SD (Transportation)' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'SAP-HR-PAYROLL-TH' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'SIMPLEMENT PROD' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'eBest iMarket (JP Samurai Pro)' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'Category Supply Planning (CSP) B' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'B2G Edicom' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'Enhanced Vulnerability Protectio' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'MYPGS - Employee Data Management' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'Core Data Hub - AMA' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'Anaplan TPM - transactional - Pr' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'RTA (Real Time Artwork)' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'Payroll' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'SRAP Expense Management' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'SAP-HR-PAYROLL-ES' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'ae.braun.com/ar-ae_40200' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'Integration Platforms' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'SAP-HR-PAYROLL-IN' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'SAP-SD (Order Management) - N6P' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'SAP-SD (Order Management) - ANP' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'ADW7P' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'Brand Health Interim Data Hub (C' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'CNGC Data service' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'N6P' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'KBP' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'Proficy Plant Applications' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'Salesbook Content Authoring & Pu' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'Core Data Hub - LA' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'SAP-HR-PAYROLL' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'Transportation View' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'Core Data Hub - JP' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'SAP-HR-PAYROLL- CR' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'SAP R/3 DRP' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'B2G GRC' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'SAP-HR-PAYROLL-JP' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'Business Service Management (BSM' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'Servers (Wintel)' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'SAP-HR-PAYROLL-IE' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'TMS' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'DC - LAN' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'FastMart' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'Optima Tx WE Prod' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'Optima reporting (AX) - Prod' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'ESD3SWS Marimba' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'itAccess' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'SAP-HR-PAYROLL- PE' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'IT @ Labs' then 'IT @ Labs'
when coalesce(ci.name,'UNSPECIFIED')= 'SAP-HR-PAYROLL- VE' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'SAP-HR-PAYROLL- CL' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'ALICS' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'PS EDW - KAP' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'FPT' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'SAP-HR-PAYROLL-RU' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'UNSPECIFIED' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'Forecast One - F1' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'SAP-HR-PAYROLL-PH' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'ADW6P' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'rtcis1' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'SAP-HR-PAYROLL- CO' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'Optima Tx Asia Prod' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'Windows 10 [PROD]' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'Axway MFT â€“ PROD Instance' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'IDF (Intelligent Daily Forecasti' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'Control M' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'TIBCO-BW (Production)' then 'TIBCO-BW (Production)'
when coalesce(ci.name,'UNSPECIFIED')= 'Microsoft Exchange' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'SAP-HR-PAYROLL-GB' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'SAP-SM (Solution Manager)' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'GPDB: Global Product Database' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'TMS Atlas (Transportation Manage' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'GTP' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'SKII SDC (counters solution)' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'SAP-SD (Order Management) - A6P' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'SAP-SD (Shipping Documents)' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'SAP-SCM-gATP' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'Core Data Lake - MDM Tool' then 'Core Data Lake - MDM Tool'
when coalesce(ci.name,'UNSPECIFIED')= 'Spotfire Server (Production)' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'HGP' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'Windows' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'MIO' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'SH - Incremental Shipment Engine' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'Active Directory (PG.com Forest)' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'Global SAP TM (Lane Management)' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'SAP-HR-PAYROLL-BE' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'K8P' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'SAP-HR-PAYROLL-CN' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'Kinaxis RapidResponse' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'SAP Core Purchasing SAP-MM-PUR' then 'SAP Core Purchasing SAP-MM-PUR'
when coalesce(ci.name,'UNSPECIFIED')= 'Citrix PGVirtualApp' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'Capture Financial Data' then 'Capture Financial Data'
when coalesce(ci.name,'UNSPECIFIED')= 'STC Analytics' then 'STC Analytics'
when coalesce(ci.name,'UNSPECIFIED')= 'DSM (Digital Specification Manag' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'Cloud Operations Monitoring Plat' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'SAP-HR-PAYROLL-CA' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'K9P' then 'K9P'
when coalesce(ci.name,'UNSPECIFIED')= 'BW Platform' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'SAP ERP Financials - Assets' then 'SAP ERP Financials - Assets'
when coalesce(ci.name,'UNSPECIFIED')= 'SAP ERP Financials - Intercompan' then 'SAP ERP Financials - Intercompan'
when coalesce(ci.name,'UNSPECIFIED')= 'GPPDB: Global Price and Promotio' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'Order Acquisition B2B platform' then 'Order Acquisition B2B platform'
when coalesce(ci.name,'UNSPECIFIED')= 'SAP-HR-PAYROLL-MX' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'SAP-HR-PAYROLL-DE' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'APO IDP (Integrated Demand Plann' then 'APO IDP (Integrated Demand Plann'
when coalesce(ci.name,'UNSPECIFIED')= 'SAP-PM' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'ENOVIA (PLM)' then 'ENOVIA (PLM)'
when coalesce(ci.name,'UNSPECIFIED')= 'SAP-HR-PAYROLL-BR' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'WMS PrIME' then 'WMS PrIME'
when coalesce(ci.name,'UNSPECIFIED')= 'SAP-HR-PAYROLL- AR' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'Simplement' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'SAP-HR-PAYROLL-IT' then 'num_grouped_others'
when coalesce(ci.name,'UNSPECIFIED')= 'Voyager' then 'Voyager'
when coalesce(ci.name,'UNSPECIFIED')= 'ServiceNow IT Service Management' then 'ServiceNow IT Service Management'
when coalesce(ci.name,'UNSPECIFIED')= 'SAP-AR' then 'SAP-AR'
when coalesce(ci.name,'UNSPECIFIED')= 'SAP ERP Financials - Tax' then 'SAP ERP Financials - Tax'
when coalesce(ci.name,'UNSPECIFIED')= 'SAP ERP Financials - Payment Ser' then 'SAP ERP Financials - Payment Ser'
when coalesce(ci.name,'UNSPECIFIED')= 'MIC â€“ Production' then 'MIC â€“ Production'
when coalesce(ci.name,'UNSPECIFIED')= 'SAP-HR-PAYROLL-FR' then 'SAP-HR-PAYROLL-FR'
when coalesce(ci.name,'UNSPECIFIED')= 'SAP-PI-Customer EDI' then 'SAP-PI-Customer EDI'
when coalesce(ci.name,'UNSPECIFIED')= 'Technology Hosting Solution' then 'Technology Hosting Solution'
when coalesce(ci.name,'UNSPECIFIED')= 'CDS - Data Store (ADW)' then 'CDS - Data Store (ADW)'
when coalesce(ci.name,'UNSPECIFIED')= 'SAP-QM' then 'SAP-QM'
when coalesce(ci.name,'UNSPECIFIED')= 'SAP ERP Financials - Costs' then 'SAP ERP Financials - Costs'
when coalesce(ci.name,'UNSPECIFIED')= 'SAP-WM' then 'SAP-WM'
when coalesce(ci.name,'UNSPECIFIED')= 'SAP ERP Financials - Banking Ser' then 'SAP ERP Financials - Banking Ser'
when coalesce(ci.name,'UNSPECIFIED')= 'SAP ERP Financials - GL' then 'SAP ERP Financials - GL'
when coalesce(ci.name,'UNSPECIFIED')= 'OMP+ APS' then 'OMP+ APS'
when coalesce(ci.name,'UNSPECIFIED')= 'ServiceNow (PGGEIPROD)' then 'ServiceNow (PGGEIPROD)'
when coalesce(ci.name,'UNSPECIFIED')= 'RTCIS' then 'RTCIS'
when coalesce(ci.name,'UNSPECIFIED')= 'APO DRP Application' then 'APO DRP Application'
when coalesce(ci.name,'UNSPECIFIED')= 'Mercury' then 'Mercury'
when coalesce(ci.name,'UNSPECIFIED')= 'PI-APPS' then 'PI-APPS'
when coalesce(ci.name,'UNSPECIFIED')= 'SAP-PP (MPS & MRP)' then 'SAP-PP (MPS & MRP)'
when coalesce(ci.name,'UNSPECIFIED')= 'Oracle BI on Exalytics (PROD SDL' then 'Oracle BI on Exalytics (PROD SDL'
when coalesce(ci.name,'UNSPECIFIED')= 'LAN--HL' then 'LAN--HL'
when coalesce(ci.name,'UNSPECIFIED')= 'SAP-PP (Process Order Execution)' then 'SAP-PP (Process Order Execution)'
when coalesce(ci.name,'UNSPECIFIED')= 'SAP-IM' then 'SAP-IM'
when coalesce(ci.name,'UNSPECIFIED')= 'Telepresence' then 'num_group_no_failure'
when coalesce(ci.name,'UNSPECIFIED')= 'SAP-PI-Customer EDI (Prod)' then 'SAP-PI-Customer EDI (Prod)'
when coalesce(ci.name,'UNSPECIFIED')= 'SAP-HR-PAYROLL-US' then 'SAP-HR-PAYROLL-US'
when coalesce(ci.name,'UNSPECIFIED')= 'Cross Box (XBox)' then 'Cross Box (XBox)'
when coalesce(ci.name,'UNSPECIFIED')= 'Order and Load Builder (LEO)' then 'Order and Load Builder (LEO)'
when coalesce(ci.name,'UNSPECIFIED')= 'SAP Systems' then 'SAP Systems'
when coalesce(ci.name,'UNSPECIFIED')= 'TMS (Transportation Management S' then 'TMS (Transportation Management S'
when coalesce(ci.name,'UNSPECIFIED')= 'SAP-SD (Order Management)' then 'SAP-SD (Order Management)'
when coalesce(ci.name,'UNSPECIFIED')= 'SAP-SD (Shipping)' then 'SAP-SD (Shipping)'
end  cmdb_ci_grouped,f.cmdb_ci_grouped_c,change_request.state 
FROM png_mdsdb.change_request_final change_request
 join png_mdsdb.cmdb_ci_final as ci on change_request.cmdb_ci = ci.sys_id and change_request.sourceinstance = ci.sourceinstance
and  change_request.cdctype<>'D' and ci.cdctype<>'D'
join png_mdwdb.d_change_request d on change_request.sys_id=d.row_id and change_request.sourceinstance=d.source_id and change_request.cdctype<>'D' and change_request.state<>'4'
join  png_mdwdb.d_change_failure f on d.row_key=f.change_request_key and d.source_id=f.source_id and f.current_flag='Y'
where coalesce(ci.name,'UNSPECIFIED') in ('zh-hk.pghongkong.com_44584',
'extra975-zw1',
'PABCSC1GW',
'PARTS',
'extra085-zw1',
'exprov',
'PC and software',
'evaxtampax.es_38151',
'PEGOSCE1GW',
'PEGOSSC1GW',
'PABC-I003-MDF2',
'PEMACE2GW',
'PG Apps Center',
'eus-sqldb001',
'PG Tube v1.0 [Prod]',
'PGNetwork',
'PHC-I003-ETS2F',
'eus-pfm003',
'PHC-I017-FHC2F',
'eus-pfm002',
'PHC-I025-RTB31',
'eusrtcisesx1',
'PABC-I002-MDF1',
'P&G Enterprise Chat Bot (Lucy)',
'P&G + Microsoft Azure (IaaS) Pro',
'OX-I040-SERVRB',
'OX-I052-XC1',
'OXCE3GW',
'gadc-apaltest03',
'OXSC2GW',
'gadc-apaltest02',
'gadc-apaldrx02',
'gadc-aloha002',
'gadc-adpreport',
'One Key',
'fra-eudc500',
'fnmp006-zw2',
'Optima Tx LA UAT',
'fnmp004-zw2',
'flexlabflp-zw1',
'fixodent.fr/fr-fr_32991',
'firewall',
'Oracle BPM',
'Oracle database-server',
'Order Builder',
'febreze.co.kr/kr-KR/Index.aspx_2',
'PHC-I033-2SRVBL2',
'eus-paledo001',
'eus-mesrptbc',
'eus-mesdtabc',
'etlg1153',
'etlg1120',
'ethp2065',
'erpgntspt-prd01',
'PMK - MASCON Kronberg Production',
'PMW - MASCON Wallduern Productio',
'POM-CC01',
'POM-I050-HDL',
'entsr-zw041',
'POMCE3GW',
'emclg1',
'POMSC2GW',
'emc-wfs101',
'PPSOCE1GW',
'PPSOSC1GW',
'PQA-I001-ITRM -3',
'PQA-I002-WARE',
'PQA-I008',
'PQACE1GW',
'PQACE2GW',
'emc-vpick101',
'PLLODP01SWS002',
'OX-I012-OFF',
'etlg1162',
'etlg1163',
'PHGO-I003-L10S01',
'PHGO-I005-L11H101',
'PHGO-I007-L15H101',
'PHGO-I008-L10H201',
'PHGO-I010-L12H201',
'PHGO-I011-L14H201',
'PHGO-WC01',
'eus-mesappbc',
'eus-maxxsys001',
'PHPASC1GW',
'PHX-I002-IDFB',
'PHX-I006-IDFF',
'PHX-I007-SERVER',
'eus-agv003',
'eulg90',
'PISCES-PD-Shipping Service',
'eulg4',
'eulg10',
'etln1144',
'etln1140',
'etln1135',
'PLLODP01SWA010',
'OX-I004-CITRUS',
'gadc-argusd01',
'ORFLSH01',
'NEMC-WC01',
'gadc-esxgu025',
'NEO-France',
'gadc-esxgu017',
'NGLG-I019-GH1',
'NGLG-WC01',
'NGLGCE2GW',
'gadc-esxgu009',
'gadc-esxgu001',
'gadc-esx127',
'NLAMSB01SWE004',
'NOV-I010-B75F4A',
'NOV-I011-B2F2AR',
'gadc-esstinyurl',
'gadc-eskoaeq1',
'gadc-eskoaep1',
'gadc-eptmdb001',
'NOV-I020-B73F2V',
'gadc-enclw015',
'NOV-I034-B75F2D',
'NOV-I035-B75F3C',
'gadc-esxgu029',
'NOV-I039-B1B1AE',
'gadc-esxgu041',
'NEMC-I018-TE06A',
'NACHMS-VMN1-1SV',
'NACHMS-VMN3-3SV',
'NACHPI1GW',
'gadc-intra945',
'NACL-I004',
'gadc-intra2021',
'gadc-intra107',
'NAS-LAP001-CONF1',
'NAUP-I027-B2F2R7',
'NAUP-I051-B2F2R5',
'NAUP-I071-B2CEA',
'gadc-intra1010',
'NAUP-I181-B2F1R8',
'NAUP-I216-B1F1R1',
'gadc-gdsprd051',
'gadc-gdslog001',
'gadc-ext-sw01',
'gadc-evsq101',
'NEMC-I014-TE04C',
'NEMC-I015-TE05A',
'gadc-evs04',
'NEMC-I024-TETCC',
'PRCBJ-I141-B3F2R4',
'NOV-I044-B1E1AI',
'gadc-enclw003',
'gadc-deveca101',
'Nexthink',
'gadc-cumulus6',
'NiFi',
'Nielsen Answers desktop',
'Nigeria Payroll (VIP)',
'gadc-ctxvaldb01',
'gadc-ctlmbrzl01',
'OCT6-i003-ADMIN2-2',
'OCT6B-I004-50TC4',
'gadc-cmdcp001',
'OCT6BSC1GW-1',
'gadc-chrmadv001',
'gadc-bdnaprdv02',
'gadc-bdnaprdv01',
'gadc-balkans2',
'ORD-I156',
'gadc-autosched2',
'gadc-argusd02',
'ORDSC2GW',
'ORFL-I001-5FMDF',
'NYCBC-WC01',
'gadc-enclw010',
'NX',
'NWB-I009-B1F1A1',
'NOV-I056-B73F1R',
'NOV-I060-B73F2V',
'NOV-I066-B5F1K',
'gadc-encl029',
'NOV-I074-B4F1AM',
'NOV-I081-B73F1',
'NOV-I082-B2F3CR11',
'gadc-elnq001',
'NOV-I085-B4F1AM',
'NOV-M001-B75F4A',
'NOV-M013-B1F2I',
'gadc-edp001',
'gadc-ecmkgsp01',
'gadc-eca102',
'gadc-eca023',
'NP1 (sdln5626)',
'gadc-eca001',
'gadc-eassp101',
'NWB-I005-B1F1R1',
'gadc-dsipt012',
'gadc-dsipt010',
'NWB-I014-B2F1A6',
'NACHMS-ESXi-2SV',
'PRCC-A001-CDC',
'PRCTJ-I002-B1F1R1',
'chpa-esx001',
'chig-intra001',
'cgo-vgw012',
'cgo-vdm001',
'cgo-safcl003',
'cgo-iptsme006cn',
'cgo-cdr101',
'cg-supermrkt',
'cg-mestrnbc2',
'SAP ERP Financials - Assets - GB',
'cg-mesdatabc',
'cdl-sh-orc-zl01',
'caslx2',
'SAP PH1 (Poland)',
'cascadeclean.com/en-us_32889',
'cape-wfs004',
'SAP Quality',
'cape-web204',
'cape-web103',
'cape-meswebbc',
'cdlx.rtcis',
'chpa-esx002',
'chpa-intra001',
'chpa-mesdtabc',
'cra-whse101',
'cra-pbxaas001',
'S/4HANA Bank Account Management',
'cra-mr002',
'cra-mesdtabc',
'cra-mesappbc',
'SAC-I004-B52-C',
'cra-energ101',
'SACTCE1GW',
'SACTCE2GW',
'SANFRCE02GW',
'cra-apalprod01',
'cob-intra005',
'cnsg-mestrnbr',
'cnsg-app001',
'SAP Ariba STRM Production',
'SAP BO (Dev)',
'cmed-poputil001',
'cmed-bfm002',
'chpa-web003',
'chpa-mestrnbc',
'cape-d2dmm001',
'canetworkm-ml-691',
'SAP-AR - F5P',
'canetworkm-ml-305',
'braun.nl/nl-nl_32870',
'braun.jp/ja-jp_32868',
'braun.hu/hu-hu_41163',
'br.pg.com/pt-BR_5382',
'bpp-pbxaas001',
'bosg2gwv',
'bosg-toolworx',
'bosg-poputil002',
'bosg-metasys001',
'bosg-mestrnbr2',
'bosg-mesappbr',
'bosg-esx005',
'bosg-esx002',
'bosg-archibus',
'bos-vgw001',
'SAP-PI-Customer EDI (QA)',
'SAP-PM (NA)',
'SAP-PP (EMEA)',
'SAP-PP (LA)',
'bor-mesappbc',
'bor-esx001',
'braun.ro/ro-ro_32873',
'cra-whse102',
'brbfgwv',
'brdc-d2dmm001',
'SAP-AR - N6P 2',
'cailx.rtcis',
'cai-wfs001',
'cab-vms101',
'cab-mestrnbc',
'cab-mapledb005n',
'cab-esx001',
'c11800a51ba78c907e35ff39cc4bcba5',
'buc-safcl001',
'buc-pbxaas001',
'btc-pbxaas501',
'bru-vmcobx006',
'bru-v5eesx001',
'bru-rtcsql01',
'bru-rtcedge02',
'bru-polkali002',
'brlx2',
'brk-wfs001',
'brk-esx001',
'brio-meshistbe',
'brdc-vms001',
'brclx_rtcis',
'Retail Execution Alerts (REA)',
'Retail Connect (Wal-mart)',
'Resource Scheduler_Flexi',
'dymc-as101',
'PaaS Data Base NonProd',
'Palisade @Risk',
'Password Genie',
'dymc-apaltest02',
'dvr-vgw001',
'dvr-recipehmi',
'dvr-mestrnbc2',
'dolx6',
'dodot.es_41012',
'Ping Access - Prod',
'Ping Access - Prod Internal',
'dlmc-wfs001',
'dlmc-esx003',
'PingOne',
'ditr-i00b-sw001',
'dil-pbxaas001',
'dieu-s001-bl001',
'diak-m001-sw001',
'Procure to Pay',
'defrab02sbc003',
'dymc-wfs101',
'defrab02rtr002',
'PTLISP01RTR002',
'e7972b78db4418d08b3d5716f496193c',
'emc-vms101',
'PRCXQ-I001-B1F2R1-1',
'PRCXQ-I008-B1F2R4',
'PRCXQ-I009-B1F2R4',
'PRCXQ-I013-B1F2R7',
'PRCXQ-I017-B1F121-1',
'edefect01-zw1',
'PRCXQ-I021-B1F123',
'edciptcmsub001',
'edciptcbsaf001',
'edccmg01',
'edc-vgw003',
'edc-vgw001',
'PRG-I001-SERVRM',
'PRGA-SIS-SRX-KAR-01',
'PRGCE2GW',
'PRGYSC1GW',
'PRRI-LAP003',
'PRSJUP01SWA001',
'PRWHSC1GW',
'PSAT',
'e-Consent',
'PRCTJ-D2DMM001',
'dcp-pbxnec01',
'Quality Window (QW)',
'dam-meshisthhc',
'RONA-I010-IDFJ',
'dam-cust001',
'RONA2GW',
'dam-cdr001',
'ROT-I001-SERVC2',
'ROT-I002-TCOMC1',
'ROT-I005-HUB3C1',
'dalx4',
'dallg9',
'dallg4',
'dallg2',
'dalcrnesx2',
'cxln1005',
'RUNMKP01SWA002-1',
'RUNMKP01SWA004',
'RUNMKP01SWA005',
'RUNMKP01SWA006',
'RUNMKP01SWA007',
'cxhn1002',
'crulx.rtcis',
'dam-mestrnhhc',
'dbsql1-zw1',
'ROBUHP01SWA005-2',
'dam-wfs001',
'Queimados (qulx_rtcis)',
'RAK-I048-B1DR57',
'RAK-I055-B15R72',
'RAK-I056-B20R50',
'RAK-I057-B31R85',
'dbi-vae001',
'RAKSC1GW',
'dbi-intra001',
'RCTv4.0 - MUT (Manual Upload Too',
'dayplg9',
'RGM-A043',
'RGM-I001-B1F0R1-1',
'RGM-I002-B1F0R1',
'RGM-I006-B7F0R3',
'RGM-I015-B5F1RD',
'daycrnsw01',
'RGM-I024-B5F0RM',
'RGM-I031-SEWP',
'RGM-I033-B1F0R1',
'RGM-I034-BTFCRF0',
'RGMCE3GW',
'dam-tapemm001',
'NACHEX1GW',
'NACHEE-IN-1SV',
'gadc-intra965',
'LON-I006-H1C3',
'golx2',
'LON-I017-H4C1',
'LON-I017-H4C1-1',
'LON-I025-H9C1',
'LON-I028-H10C1',
'LON-I030-H10C2',
'LON-I031-H11C1',
'LON-I032-H12C1',
'LON-I002-H1C3',
'LON-I033-H13C1',
'gillettearabia.com/en_41524',
'gillette.it/it-it_33011',
'LON-I052-H25C1',
'LON-M102-H2C1',
'LONCE2GW',
'LONCE4GW',
'gillette.com/es-us_33022',
'LVP',
'gillette.com.au/en-au_32999',
'gillettevenus.com/en-us_33372',
'LON-CC01',
'LMSC2GW',
'golx4',
'gsdc-encl016',
'LM-I190-UODLOG',
'gsdc-encl007',
'gsdc-dr-sw01',
'LM-WC01',
'gsdc-control137',
'LMCE3GW',
'gsdc-cnlassas01',
'LMCON-I089-HDLSRV',
'LMCON-I089-HDLSRV-1',
'LMCON-I091-HDLPRO',
'LMCON-I191-PFOFC',
'gsdc-cmanssas01',
'grealicssw001_002',
'LMDC-I007-B3-OFC',
'LMDC-I008-TELCO',
'LMDC-I010-B1-OFC-1',
'LMDC-I114-B3-14',
'LMDC-I124-B2-24',
'LMDC-I224-B2-24',
'gonclv5esx103',
'Legal Hold Pro',
'Life & Career',
'Life & Career - Production Insta',
'gillette.com.ar/es-ar_39216',
'gglx.rtcis',
'MEC-I015-5F0A7',
'MEC-I017-7F0A12',
'gge-pros003',
'MEC-I033-7F5C9',
'MEC-I034-7F5C9',
'MEC-I037-8F1A15',
'gge-poputil001',
'gge-mestrnhc2',
'gge-mesapphc2',
'gge-d2dmm001',
'MECCE1GW',
'MECCE2GW',
'gen-safcl001',
'gen-rtcsbs01',
'MEQ-I006-OFPOPUP',
'MEQ-I010-CPD',
'gen-intra001',
'MEQ-I015-WWTA',
'MEQCE1GW',
'MEQCE2GW',
'MDMS: Master Data Management Sys',
'LM-I181-BLDG48',
'MDE2View Marktheidenfeld Produci',
'MCBC-LAP007',
'Lync 2010 (Server) Prod',
'MAN-A017-SPARE',
'MAN-I006-B1F1R2',
'MAN-I008-B1F1R2',
'MAN-I010-B1F1R1',
'MAN-I017-B1F0R4',
'MAN-I032-PREPCNTR',
'MAN-I033-B1F0RA',
'gillette.co.il/he-il_41571',
'MANCE4GW',
'gglx4',
'MAP (PROD)',
'MAR-HC-MK-AOS11',
'MAR-HC-PK-VCT',
'MARP-CC01',
'MARP-I011-SNWMAN',
'MARP-I040-CASETA',
'MARPSC1GW',
'MBRAP-I006-B3F2C5',
'MBRAP-I009-MDC',
'MBRAPCE1GW',
'MD - Master Data',
'LM-I151-CONSTR',
'LM-I119-DOCK1',
'LM-I111-HDLULF',
'KRO-I047-HC',
'hkg-pbxaas001',
'KRO-I076-AB',
'KRO-I090-AM',
'KRO-I092-AN',
'KRO-I099-H',
'KRO-I105-HB',
'KRO-I151-TT',
'hhp-pbxaas001',
'KRO-M006-A',
'herbalessences.co.uk/en-gb_33085',
'KRSELP01RTR001',
'KRSELP01SWA002-1',
'KRSELP01SWA003-1',
'headandshoulders.sa/ar_41309',
'headandshoulders.ru/ru-ru_41170',
'headandshoulders.pl/pl-pl_41366',
'L6A',
'headandshoulders.it/it-it_41221',
'headandshoulders.com.tr/tr-tr_41',
'LA-Chile-SANTIAGO BC-SBC-17F-325',
'hplx6',
'LA-Colombia-BOGOTA GO-Bogota GO-',
'KRO-I029-RA',
'hub-esx001',
'KEL-A001',
'KHA',
'hyd-mestrnhc',
'hyd-mesapphc',
'hyd-locdev01',
'KIEVSC1GW',
'KLD',
'hugp-poputil001',
'hugp-pcc-app',
'KNIME Server on premise PROD',
'KP-I001-SERVER',
'hugp-meshistbc',
'hugp-mesappbc',
'hugp-lottrig001',
'KP-I030-B98R98',
'KP-I042-B10R22',
'KP-I044-B91R91',
'KP-I128-BLD8CF1',
'KP-I129-SERVB2F2',
'hugp-grp-db',
'hub-meshistbe',
'KRGOSC1GW',
'MEQSC1GW-1',
'headandshoulders.co.in/en-in_410',
'hairrecipe.jp_31164',
'LDZ-I017-LMCPC1',
'gsr-mesdtahhc',
'LDZ-I022-LMCAP4',
'adln9368',
'LDZ-I044-LMCBOA-DECOMM-20181101',
'gsdc-xa7ds002',
'LDZ-M0010-LMCBX',
'LDZ-M008-LMCSW',
'LDZCE1GW',
'LISCE2GW',
'LM-3PAR72134_MAIN',
'gsdc-pgdc501',
'LM-I010-SERVER',
'LM-I011-NSPINE',
'LM-I022-SUD2',
'LM-I023-SUD3',
'LM-I026-SUD6',
'LM-I031-DOCK2',
'LM-I091-HDLPRO',
'gsdc-gpcsp001',
'LM-I101-LFEPRC-1',
'LDZ-I016-LMCBOI',
'headandshoulders.ca/fr-CA_33028',
'LDZ-I015-LMCBOD',
'gsr-meswebhhc',
'h2py1z2-w10',
'gzu-vae001',
'LBN-I016-B1F0R1',
'LBN-I051-B1F0R5',
'LBN-I061-B2F0R6',
'LBN-I142-B1F0R2',
'gzu-a001',
'gylx2',
'LBNSC2GW',
'gwmrcsqlp1-zw1',
'gua-vae001',
'gsr-wfs001',
'LDZ-A003',
'LDZ-A009',
'LDZ-A049',
'LDZ-A051',
'LDZ-ASSET004',
'LDZ-CC02-LMC02',
'LDZ-I010-LMCBX',
'gsr-poputil001',
'gsr-pbxava01',
'gsr-mestrnhhc2',
'MEWA - Migrate Easy Way in ADW',
'MGSD-I001-MDF01',
'MGSDCE2GW',
'MXSPGP01RTR001',
'MXSPGP01SWC001',
'MYGO-I001-SRV',
'gadc-sqld011',
'gadc-sqlanaly01',
'gadc-spfwsvp02',
'gadc-spfwsvp01',
'gadc-siebel112',
'gadc-secdb01',
'Master Data Sync (MD Sync)',
'gadc-scv002',
'Master Minder Prod (Decommission',
'MasterMinder - TST Datafabric PR',
'gadc-rptsfdb01',
'gadc-resschp01',
'MathCAD',
'gadc-prov002',
'gadc-plmgq001',
'gadc-pgdc500',
'gadc-payroll03',
'MediaTools',
'MXNDJP01RTR001',
'Meeting Services',
'MXNALP01RTR001',
'MXMILCE1GW',
'gadc-sslpki001',
'MXHXCP01RTR002',
'gadc-ss009',
'MXHXCP01SWA003',
'gadc-sqspool002',
'gadc-sqlvc001',
'MXHXCP01SWC001',
'gadc-sqlp028',
'MXMIL-A114',
'MXMIL-A115',
'MXMIL-A116',
'MXMIL-C009',
'gadc-sqlp020',
'gadc-sqlp014',
'MXMIL-I002',
'MXMIL-I010',
'MXMIL-I016',
'gadc-sqlp010',
'MXMIL-I019',
'MXMIL-I025-EC9',
'MXMILCC1GW',
'gadc-sqlp005',
'MXHXCM01FWL001',
'gadc-p2pc01',
'Microsoft LYNC Phone Edition (20',
'NACH-I003',
'gadc-meassas01',
'gadc-mace003',
'gadc-lstappsrv1',
'NACH-ST-1ACRONIS',
'gadc-lsp01',
'gadc-lmss004',
'gadc-lmsq006',
'gadc-limsesx01',
'gadc-ldapqa003',
'gadc-ldapprd003',
'gadc-ldapprd002',
'gadc-lccs010',
'gadc-labvntgd01',
'NACH1GAISE',
'gadc-kofaxsql01',
'gadc-kofaxcap01',
'gadc-irs001',
'gadc-irisp001',
'NACHDV1GW',
'gadc-irisd001',
'gadc-mega006',
'gadc-ort014',
'gadc-mimsprod01',
'NA-USA-FAYETTEVILLE SO-CBC-1F-22',
'gadc-ort013',
'gadc-ompvp002',
'gadc-ompvfs03',
'gadc-omp013',
'Microsoft One Drive for Business',
'Microsoft Outlook',
'gadc-omp012',
'Microsoft Project Professional',
'gadc-omp006',
'gadc-omp003',
'Microsoft Visio',
'Mozart',
'gadc-nilic01',
'gadc-msols01',
'My Total Rewards',
'MyPGS ServiceNow - IT Support Fo',
'MySAP SIP',
'',
'N6A',
'NA-USA-CHICAGO SO-CBC-9F-Video C',
'NA-USA-CINCINNATI GO-C-1F-209-Ro',
'NACH-GA-DHCP-W1-F',
'boomi-z31',
'MTOSC1GW',
'MTEPCE1GW',
'MICD-I012-MAPLE-1',
'MICD-I023-PSG5',
'MICD-I032-DC2',
'MICD-I043-DTCTR',
'MICDI1GW',
'gadc-wfs002',
'gadc-wfs001',
'MINNSC1GW',
'gadc-wercdbp002',
'MITDCE3GW',
'MKTCE3GW',
'MMI-A004',
'MMI-A040',
'MMI-I021-B2F0R2',
'MMI-I031-B3F1R3',
'gadc-vtdc501',
'gadc-vmback02',
'MMPQ (Market Measurements Panel ',
'gadc-viasqld',
'gadc-v6vc002',
'MOS-3PAR7072',
'gadc-wfs003',
'MOS-3PAR7073',
'gadc-wikiprd01',
'gat-intra001',
'geb-mestrnbc1',
'geb-maple102n',
'MHF-I001-B1F0R1',
'geb-esystem01',
'MHF-I007-B1G1R2',
'geb-esx004',
'gbs-ora004',
'MHF-I019-B1F1R9',
'MHF-I020-B1F1R9',
'MHF-I022-B1F2RA',
'MHF-I024-B1F2RB',
'gbs-mesapphc',
'MHF-I029-B2F0RE',
'MHF-I031-B1F0RG',
'gblx2',
'gbe44nta',
'gbay-sqlp001',
'gbay-proficy002',
'gbay-meshistfc',
'MHFCE3GW',
'gb-mesappfc',
'gadc-wpad001',
'MTEPCE2GW',
'MOS-I008-METBC5',
'gadc-v6vc001',
'MP-WC01',
'MPC-I007-wkshop',
'MPCE1GW',
'MPCE2GW',
'gadc-tracesql01',
'gadc-torrmxsql',
'MPWH-I100-IDF-C',
'MPWH-I109-IDF-M',
'MPWH-I111-IDF-O-1',
'MPWH-I122-IDF-Z',
'MSA Accounting',
'gadc-tcuautmsc1',
'MSA Reporting',
'gadc-tcuamsc1',
'MSI (Market and Share Insights)',
'MSMO-I001-SERVER',
'MSMO-I002-SERVER',
'MSMOCE1G',
'gadc-tcpartsq1',
'MSMOSC1GW',
'MSMOSC1GW-1',
'MP-M002',
'MOS-I009-METBC5',
'MP-M001',
'gadc-tracvs001',
'gadc-v4esx104',
'gadc-v3esx001',
'gadc-udwsql01',
'MP-I021-5-1',
'MP-I026-14-1',
'MP-I031-24-1',
'MP-I033-42-1',
'MP-I041-32-1 -1',
'MP-I043-25-1',
'MP-I044-25-1',
'MP-I050-11-1',
'MP-I073-8-2',
'MP-I076-11-2',
'MP-I079-12-2',
'MP-I080-13-1',
'MP-I086-16-3',
'MP-I091-23-1',
'MP-I092-23-2-1',
'gadc-trimsql01',
'MP-I122-45-2',
'MP-I133-B41-1',
'MP-I139-B83-3',
'hydlx2',
'SAP-QM (AP-A6P)',
'SAP-QM (NA)',
'WCMC-I007-TETCS',
'azl-davinci14',
'WCMC-I013-TE01F',
'WCMC-I022-Serv1',
'azl-davinci04',
'WCMCCE3GW',
'WDC-I008-IDFJ',
'WDC-I015-IDFR-1',
'WDC-I017-GRDSHK',
'azl-davincipr01',
'WDC-I028-TEJ1',
'WDC-I036-TEQ1',
'WDC-I042-SERV1',
'azl-davinci016',
'WDC-WC01',
'azl-arguspdb01',
'azl-argusdb01',
'azl-adln9392',
'WGPCE1GW',
'WH-I007-BC1N15',
'WDC-I034-TER1',
'WARCE3GW',
'WAR-I021-MOB',
'WAR-I016-CUBE',
'azl-shrwlsd01',
'VPL-I056-NIDF2SW',
'VPL-I057-NWHSP1',
'VPL-I115-B1F0R1',
'azl-shrorade01',
'VPL-WC01',
'azl-sdln2687',
'azl-satispedprd',
'Veeva Vault',
'Venafi',
'Vertex O-series -TaxEngine (Prod',
'azl-micddb',
'azl-loomsys12',
'WALMGWE2',
'azl-endh301',
'azl-elnorap01',
'WAR-I002-MOB',
'WAR-I004-MOB',
'azl-elnorad03',
'WAR-I009-MOB',
'azl-efcdbp01',
'WH-I008-MDF',
'WH-I009-BC3E60',
'WH-I010-FE1C19',
'azl-adln9279',
'WLD-I002-SERV1',
'WLD-I004-D1',
'WLD-I007-l1A',
'avlx1',
'WLD-I011-A1C',
'WLD-I012-B1',
'WLD-I013-E1B',
'WLD-I014-E1',
'avl-pbxava001',
'aussie.com/en-us/_32837',
'auep-intra001',
'WLD-I023-M1',
'WLD-I033-S1',
'auditdb-zw1',
'WLD-I036-I1B',
'aubalicssw003_004',
'au.braun.com/en-au_32851',
'WLD-I038-F2',
'WLD-I043-WF0',
'atlmc-vms101',
'WLDCE3GW',
'WLD-I001-G',
'azl-solcpdr012',
'avm-mesappbc',
'WH-WC01',
'WH-I014-FE4N11',
'azl-adln9246',
'WH-I022-S2S39',
'WH-I028-FC2C47',
'aza-APCSInetF5LBProd-01',
'ay-wfs001',
'WH-I035-FC2C15',
'WH-I042-BAN161',
'WH-I044-BB3N78',
'WH-I049-BB2S06',
'WH-I051-FWT28',
'ay-mesdata002',
'axrtcisesx1',
'WH-I070-BB3S59',
'avm-web005',
'WH-I074-BC4SZ',
'avm-mestrnbc',
'WH-I078-W1A16B',
'WH-I081-FWBNK',
'WH-I101-SOLV',
'WH-M090-MDF_A',
'avm-meshistbc',
'azw-abdagilep01',
'VNGOSC1GW-1',
'VNGOSC1GW',
'bdc-ibadev002',
'bdc-gts101',
'bdc-extra195',
'VCR-EUR-Romania-BUCHAREST GO-1F-',
'bdc-extra150',
'bdc-esxlnx002',
'bdc-esxagl001',
'bdc-encl049',
'bdc-encl047',
'bdc-encl040',
'bdc-encl031',
'VCR-EUR-SUI-GENEVA GBC-F-1 24 Di',
'bdc-emfgh001',
'bdc-elnp002',
'bdc-dsipt020',
'bdc-dsipt012',
'bdc-dr-sw01',
'bdc-doapoap001',
'bdc-dachplog01',
'bdc-ctxlimsq01v',
'bdc-css001',
'bdc-imc002',
'bdc-control107',
'bdc-intra1068',
'bdc-intra1235',
'VCR-AMA-Vietnam-HO CHI MINH-11F-',
'bdc-ocsfs001',
'VCR-APAC-Japan-KOBE GO IC-5F-Fuj',
'bdc-nexp110',
'VCR-APAC-South Korea-SEOUL GO-37',
'bdc-mfgnet001',
'bdc-mace002',
'bdc-limsesx01',
'bdc-ldapprd008',
'bdc-kofaxsql01',
'bdc-kfxkcns01',
'VCR-EUR-France-PARIS GO-2F-A13-C',
'bdc-k2qa01',
'bdc-k2dbqa01',
'bdc-iptcmsub008',
'bdc-iptacs002',
'bdc-intra963',
'bdc-intra941',
'bdc-intra668',
'bdc-intra2012',
'bdc-intra124',
'bdc-intra1230',
'WLDCE4GW',
'bdc-cax002',
'bdc-apdc520',
'bag-vgw002',
'VCR-NA-USA-WHBC-C6090-2F-E58-Cap',
'VCR-PRVT-AMA-UAE-DUBAI GO-Phase ',
'badlx2',
'badlx.rtcis',
'VCR-PRVT-EUR-Belgium-BRUSSELS-1F',
'azw-wg32datman',
'azw-utsp01',
'azw-shriisd01',
'azw-r2r01',
'azw-mpsqadb',
'azw-mega004',
'VCR-PRVT-GC-China-GUANGZHOU GO-A',
'azw-finsol01',
'VCR-PRVT-LA-Panama-PANAMA GO-Tow',
'azw-cmdbp002',
'VCR-PRVT-NA-USA-WashDC-5F-Small ',
'VGUA-I007-SERVER',
'azw-cdnceddbs01',
'VNDBPCE1GW',
'VNDBPCE2GW',
'VCR-NA-USA-SEATTLE SO-Chihuly-Ca',
'bdc-apdc521',
'VCR-NA-USA-SEATTLE SO-CBC-1F-Sea',
'VCR-NA-USA-MASON BC-CF-2F-310-Ca',
'bdc-apaltest001',
'VCR-EUR-UK-NEWCASTLE IC-GF-Main ',
'bdc-3par8872',
'bdc-126-sw01 irf',
'bcru-poputil001',
'bcru-mestrnbc',
'VCR-EXEC-EUR-SUI-GENEVA GBC-F1-W',
'VCR-EXEC-NA-USA-CINCINNATI GO-C-',
'VCR-EXEC-NA-USA-WHBC-B6280-4F-C3',
'VCR-GC-China-BEIJING IC-1F-1460-',
'bclx.rtcis',
'bc-wfs001',
'bc-mestrnbc',
'bc-meshistbc',
'bc-esx003',
'bc-esx001',
'VCR-GC-Taiwan-TAIWAN GO-7F-A08 A',
'VCR-GC-Taiwan-TAIWAN GO-7F-A12 T',
'VCR-LA-Brazil-LOUVEIRA PLT-GF-Pa',
'VCR-LA-Panama-PANAMA GO-Tower 5-',
'VCR-NA-USA-CINCINNATI GO-C-1F-20',
'bajlx.rtcis',
'VCR-AMA-UAE-DUBAI GO-Phase 3-1F-',
'atllg1',
'atlcrn-vsautil',
'adlg8272',
'aka-mesdatabc2',
'aka-mesappbc',
'aka-intra001',
'aka-fm001',
'adln2735',
'airwatchcc-zw1',
'adln2802',
'adln2840',
'aka-meshistbc',
'aeprimesw01',
'adln5600',
'aelx8',
'adln5719',
'aelx2',
'adln5725',
'aelg11',
'ae.braun.com/en_39236',
'adlvm0001',
'adln5745',
'adln5593',
'aka-mesrptbc',
'adlg8253',
'adlg8244',
'adlg3942',
'adlg3944',
'adlg3948',
'ale-wfs001',
'adlg3960',
'adlg3961',
'adlg3964',
'ale-mestrnbe',
'adlg3971',
'adlg3972',
'adlg3978',
'ale-intra001',
'adlg5734',
'adlg5763',
'adlg5764',
'aka-wh001',
'adlg8211',
'adlg8213',
'aka-wfs001',
'adlg8227',
'adlg8229',
'adln5746',
'adln9412',
'adln5750',
'adln5751',
'adln9283',
'adln9287',
'adln9393',
'adln9392',
'adln9293',
'adln9305',
'adln9374',
'adln9373',
'adln9314',
'adln9315',
'adln9372',
'adln9371',
'adln9333',
'adln9338',
'adln9347',
'adln9348',
'adln9361',
'adln9362',
'adln9363',
'adln9370',
'adln9365',
'adln9282',
'adlg3936-zl1',
'adln9280',
'adln9271',
'adln5752',
'adln5753',
'adln9408',
'adln5771',
'adln5772',
'adln6503',
'adln6592',
'adln6650',
'adln9405',
'adln6722',
'adln9399',
'adln9246',
'adln9247',
'adln9251',
'adln9397',
'adln9255',
'adln9259',
'adln9396',
'adln9395',
'adln9268',
'adln9269',
'adln9394',
'adlg3936',
'adlg3929',
'allx4',
'amw-wnes11',
'amw-venafiweb01',
'WorkFusion - AR Cash Application',
'WorkFusion Automation - AR Claim',
'Workfusion - Legal IP',
'Workfusion Automation - Planning',
'WorldWide Market Data (WWMD)',
'amplg6',
'amisc2gw',
'ZASTN-I003',
'ZASTNCE3GW',
'ZASTNCE4GW',
'ami-vae001',
'ami-poputil002',
'abn-apps001',
'ami-pfmprod002',
'abn-esx007',
'abn-hvac001',
'abn-lanswpr',
'ad01a2c',
'ad01b1c',
'Wireless Controller Cisco 5520',
'adc-encl008',
'Wireless Area Network - P&G Mana',
'WinBDE',
'WOM (Web Order Management)',
'WOR-I007-BCF2C3',
'WOR-I011-BBF1C2',
'WORCE3GW',
'WORSC2GW',
'WVWCE1GW',
'asn-safcl001',
'WWPROCESS',
'ariel.in/en-in_32812',
'Warehouse Analytics',
'ariel.co.uk/en-gb_32827',
'WebCC',
'api-tapemm001',
'api-meshistbe',
'api-maplehdl',
'anp-vgw004',
'WebEx Productivity Tools',
'Webcenter (ENOVIA plugin)',
'andmsc1gw',
'andm-wfs001',
'Wide Area Network (WAN)',
'andm-mesdatabe',
'atlcrnesx2',
'adc1extrace',
'ade11dbadm06',
'alx-mesrptfhc',
'alx-mesdatafhc',
'alx-mdchisthhc',
'alx-esx001',
'adlg3845',
'alx-engcsrv59',
'alx-engcsrv116',
'alx-engcsrv113',
'alx-engcsrv111',
'alx-engcsrv110',
'alwaysdiscreet.de/de-de_40798',
'alwaysdiscreet.com/en-us_38191',
'alwaysdiscreet.co.uk/en-gb_38190',
'alwaysdailies.eu_38760',
'adlg3869-zl1',
'altlxsw01',
'adlg3899',
'adlg3903',
'adlg3906',
'adlg3920',
'adlg3921',
'amb-ups001',
'ami-pfmbkp002',
'adlg3829',
'ami-data006',
'ami-pfm001',
'ami-pdpdev001',
'ami-maple12n',
'ami-maple013',
'adhn5668',
'adlg2979',
'adlg2982',
'ami-intra001',
'ami-hdlhist02',
'ami-esx008',
'adlg3601',
'adlg3602',
'ami-esx007',
'adlg3612',
'adlg3616',
'adlg3621',
'adlg3633',
'ami-esx006',
'adlg3822',
'adlg3823',
'ami-esx005',
'amc-pbxava003',
'bdc-onekey004',
'bdc-pbxava102dm',
'VCR-AMA-Philippines-MANILA NETPA',
'SVDC3SC1GW',
'SW-I016-U-1-002',
'SW-I031-B-1N-005',
'SWA-I002-TEC2L0',
'SWA-I007-TECJLL',
'bdln7689',
'SWA-I010-TEC1L2',
'bdln7670',
'bdln7666',
'SVDC3CE1GW',
'SWA-I014-TEC1L6',
'bdln6597',
'bdln2828',
'SWA-I031-S4F0R7-2',
'SWA-I033-CASINO',
'SWA-M007-BOILER',
'SWACE2GW',
'SWASC1GW',
'bdln2819',
'bdln2780',
'SWA-I015-TEC1L5',
'SV-WC01',
'SV-LAP001-100-2',
'SV-I010-100-2',
'bdlx4089',
'SPB-I025-NPCK',
'SPBCE1GW',
'SPBSC1GW',
'bdlx4014',
'bdln9276',
'SRM (Strategic Revenue Managemen',
'SRM Revenue Pulse',
'bdln9150',
'bdln9109-zl',
'STKCE1GW',
'bdln9109',
'STL-I014-TE61-2',
'STL-I015-TE61-3',
'STL-I023-TE1-1',
'STL-WC01',
'STORAGE1',
'bdln7719',
'bdln7718',
'SV-I007-100-7',
'SV-I008-100-8',
'bdln2778',
'bdln2747',
'Scorecard Ordzhonikidze Ukraine ',
'bdln2730',
'bdlg3478',
'Spotfire Platform',
'Spotfire Platform - Production I',
'Spotfire Server (Test)',
'Spotfire Server (Test) 2',
'bdlg3435',
'bdlg3433',
'bdlg3432',
'bdlg3414-zl1',
'bdlg3410',
'Symphony GOLD - Apollo Space Pla',
'bdlg3405',
'Systems Engineering',
'bdlg3391',
'bdlg3385',
'T&W BI FP Ground NA',
'bdlg3359',
'T&W BI Ocean&Air FP RPMI/ RPMI G',
'TACSCE1GW',
'TADCE2GW',
'TADSC1GW',
'bdlg3491',
'bdp-vgw001',
'Skybox Firewall Assurance (Prod)',
'SiteScope v11.33- Production Ins',
'Security Services: Authenticatio',
'bdln2693',
'bdln2647',
'Sentinel',
'bdln2611',
'bdln2516',
'bdln2489',
'bdln2487',
'bdln2470',
'bdln2457',
'ServiceNow - HR BSR Case',
'bdln2398',
'bdln2212',
'bdln2036',
'SharePoint Online Provisioning',
'bdln2035',
'Shipments Mix',
'Shipping Documents â€“ Exstream (X',
'ShortLink',
'bdlg7763',
'bdlg7735',
'bdlg7734',
'SPAR-I009-B1F1A3',
'SPAR-I003-B1F0R2',
'bdu01a2e07',
'SEMC-I016-Serv1',
'SEMC-I017-Serv2',
'SEMCCE3GW',
'SEMCSC1GW',
'bkk-d2dmm001',
'SESTOP01RTR001',
'SESTOP01WLC001',
'SET3 -- My Stock Options/Future ',
'SEW-LAP003',
'bjn-pbxaas101',
'SG-APDCE01',
'bjn-pbxaas001',
'SGCLEB01RTR002',
'SGGO-I001-L18S01',
'SGGO-I002-L18S02',
'SGGO-I003-L18S03',
'SGGO-I004-L18H01',
'SGGO-WC01',
'SGGOCE1GW',
'SGIC-I001-DC101',
'SGIC-I014-L4H21',
'SEKSC1GW',
'SGICCE1GW',
'bkk-esx001',
'bkk-mesappbe',
'bogosc1gw',
'bman-simplex101',
'bman-intra101',
'bman-esx002',
'blov-web003',
'SAP-SD (Order Management) - A6A',
'blov-smv003',
'SAP-SD (Order Management) - F5P',
'blo-d2dmm001',
'blin-sql005',
'blin-quantum02',
'SAP-SD (Shipping Documents) - N6',
'blin-mestrnbr2',
'blin-mesrptbr2',
'SAP-SD (Shipping) - F6P',
'blin-mesappbr2',
'blend-a-dent.de/de-de_32990',
'bkl-rtcsbs01',
'bkk-mesdatabe',
'SAT',
'SAT (Segmentation Analysis Tool)',
'SDHN5476',
'bdlg3343',
'SGICSC1GW',
'SGSINP01RTR001',
'bell-whids001',
'SHI-I011-1FCCR',
'SHI-I012-MEZAIN',
'SHI-LAP060-CORR3F',
'bell-mhdrn01n',
'SHISC1GW',
'bell-mestrnbc',
'bell-mesrptbc',
'SKBTSP01WLC001',
'SKE-I316-C29-HBCRANE06U',
'SKE-WC01',
'bell-int04n',
'SKESC1GW',
'bell-int04',
'bell-famdas01n',
'bell-enclw003',
'SMTP Backbone v0.0- Production I',
'beedclbpgco001',
'SNKDCE2GW',
'bdu01a3c',
'SOFSC1GW',
'belx.rtcis',
'SGSINB01SWE001-2',
'ber-pbxaas002',
'beu-mesappfc',
'SGSINP01SWA002',
'SGSINP01SWA004',
'SGSINP01SWA011',
'SGSINP01WLC001',
'bic-safcl002',
'SGTU-I004-B2F1C2',
'bic-pbxaas001',
'SGTU-I008-B1F2C1',
'bhp-pbxaas001',
'SGTU-I012-B2F2C1',
'SGTU-I014-SRVR1',
'bhlx2',
'SGTUSC1GW',
'bhlx.rtcis',
'bgo-pbxaas002',
'beu-web001',
'beu-vmspwrfleet',
'SH - Direct Shipments Swiffer 2.',
'beu-prof-dc',
'beu-mestrnfc',
'beu-meshistfc',
'SH - Regional FSR (Financial Shi',
'bdlg3330',
'TAISC1GW',
'TAK-I003-LUPIN',
'USCLTP01WLC001',
'bdc-siebel220',
'USCUEP01SWA001',
'USCUEP01WLC001',
'USCVGP02SWA002',
'USCVGP02SWC001',
'USCVGP02WLC001',
'USCVGP03WLC001',
'USCVGP04SWA001',
'USCVGP04SWC001',
'USCVGP04WAP019',
'bdc-siebel211',
'USEDPP01WLC001',
'bdc-siebel138',
'bdc-siebel114',
'USFAYP01WLC001',
'bdc-sdc001',
'USGRRP01SWA001',
'USGRRP01WLC001',
'USMESP01RTR002',
'USMESP01SWA001',
'USCLTP01RTR001',
'USMESP01SWC001',
'USCHIP01WAP006',
'USCHIP01RTR002',
'UETSC1GW',
'UK TPM Add-on',
'UKWYCE1GW',
'UKWYCE2GW',
'UNIX',
'bdc-trimsql01',
'bdc-tarchsqldev',
'bdc-tarchsql01',
'bdc-tarchfa01',
'USAUEP01RTR001',
'USBNAP01PDU001',
'USBNAP01SWA001',
'bdc-sqlp032',
'bdc-sqld044',
'bdc-sqladr009',
'USBOIP01SWA001',
'USBOIP01WLC001',
'USBOSP01RTR001',
'USBOSP01SWA008',
'bdc-spfoaq01',
'USCHIP01RTR001',
'USCHIP01SWA002',
'bdc-v4esx043',
'USMESP01WLC001',
'USNJCP01SWC001',
'UTBE-I016-TE72-2',
'UTBE-I024-TEGS-1',
'UTBE-I031-TETRLD',
'UTBE-I032-TETRLD',
'UTBE-I033-TEBS-1',
'UTBE-I038-B42F1',
'bdc-rtcedge05',
'UTBECE1GW',
'bdc-rtcdir06',
'VALLPCE1GW',
'bdc-rtcav04',
'VALP-I007-TORRE1-2',
'VALP-I013-DOWNY',
'VALP-I024-MERQ',
'VALP-I030-BOD4CH',
'VALP-WC01',
'VBQ-I002-CR1',
'VBQSC1GW',
'VCR-AMA-Australia-SYDNEY GO-4F-4',
'bdc-qpcsa313',
'VCR-AMA-Indonesia-JAKARTA GO-14F',
'bdc-rtcedge06',
'USNJCP01RTR001',
'UTBE-I004-TE11-3',
'USZDCP01SWC001',
'USNTAP01RTR001',
'bdc-scc001',
'USORLP01WLC001',
'USPVEP01RTR001',
'USPVEP01RTR002',
'USSACP01RTR001',
'bdc-sbc003',
'USSEAP01SWA001-3',
'USSEAP01SWC001',
'USSEAP01WLC001',
'USSJBP01SWA001',
'USSJBP01WLC001',
'bdc-sapex003',
'USWASP01SWA001',
'USWASP01WLC001',
'USXCLP01RTR001',
'USXCLP01RTR002',
'USXDCD01FWL02',
'bdc-rtcsql102',
'USXEZP01SWS002',
'bdc-rtcsql101',
'USZDCP01WLC001',
'SAP-QM (LA)',
'bdc-v4esx503',
'Transportation View Prod (Asia A',
'THBKKP01SWA007',
'THP-I004-CR1SB3',
'THP-I021-CR8AH1',
'THP-I042-CR15',
'THP-WC01',
'THPCE3GW',
'THPD-I031-CR1C1',
'bdhp4462',
'bdhp4430',
'bdhp4379',
'bdhn9104-zl01',
'bdhn2772',
'bdhn2771',
'bdhh3070',
'bde5-exadata',
'bde12dbadm01vm1',
'TOM MOD 2 MD Reporting',
'TOPSPRO',
'TOR-I005-IDF01',
'TOR-I006-IDF02',
'TORCE3GW',
'THBKKP01SWA004 ',
'TORSC1GW',
'bdhp4603',
'TFTS (QA)',
'TAK-I005-PBXRM-2',
'TAK-I008-FACBDG',
'TAK-I010-LIQOFF',
'bdlg3319',
'bdlg3318',
'bdlg2917',
'TAK-I020-GBDG',
'bdlg2892',
'bdlg2848',
'bdlg2837',
'TAK-M001-MACHRM',
'TAK-WC01',
'TAKSC1GW',
'bdlg2604',
'bdlg2551',
'bdlg2122',
'bdhp6250',
'TCF QA',
'TDC-A001',
'bdhp4806',
'TFTS (PROD)',
'THA-I004-HR20',
'bdc-v5esx001',
'bde11-exadata',
'TRGEBCE1GW',
'bdc-voiceutil01',
'TSSS (Tibco Spotfire Statistics ',
'TWBI FP Ground ASIA Prod',
'Tableau Desktop Professional',
'Talent Engine',
'Talent Supply & New Hire Ticketi',
'Tax Solution',
'Teamcenter Production',
'bdc-vmback02',
'bdc-vgw015',
'Tenable Scanning Solution',
'TenableScanner-01',
'Terra Platform',
'bdc-var001',
'bdc-vaemas002',
'bdc-vaecms001',
'Transportation Cost Forecasting',
'bdc-v5vc002',
'Transportation Forecasting (Terr',
'Transportation Management',
'bdc-v5esx501',
'TSCE2GW',
'TRGEB-WC01',
'bdc-voiceutil02',
'bdc-wmiis01',
'TRGEBP01RTR001',
'TRGEBP02RTR001',
'TRIOS (2.3.0.1408) Shiga Product',
'TRISTP01RTR001',
'TRKCOP01RTR001',
'bdcrnesx3',
'bdciptcmclr001',
'TS-I003-100-1',
'TS-I005-100-2',
'TS-I006-100-4',
'TS-I014-400-11',
'bdc-xcas001',
'TS-I020-400-10',
'TS-I036-700-7',
'TS-I038-700-11',
'TS-I040-700-10',
'bdc-xa7wi001',
'bdc-xa7qadac002',
'TS-M001',
'TS-MCA-ALICS-SVR-1',
'TS-MCB-ALICS-SVR-1',
'TS-i001-10-1',
'hydlx4',
'gsr-app1',
'hyg-agv001',
'CAPE-I093-I21DC-1',
'seralicssw001_002',
'CAPE-WC02',
'CAPEGCE01GW',
'CAPESC1GW',
'semc-wfs001',
'semc-as101',
'sdz5-sdz6',
'sdln9252',
'CAPE-I071-I64A1',
'CBOG-I003-USER',
'CBOGSC1GW',
'CCBCSC1GW',
'sdln6574',
'sdln6439',
'sdln5503',
'sdln2808',
'sdln2227',
'sdlg8513',
'sdlg8508',
'sdln6690',
'CFR GLOBAL 10.0 (PROD)',
'CAPE-I069-I62A1',
'CAPE-I062-I53A1',
'Boomi-SimplementToMidas Producti',
'Boomi-Solace-ICCS Production',
'sgkdhdfpgco007',
'sgc-pbxaas001',
'Boomi-eContent',
'Box.com',
'Box.com (Prod)',
'sg-v5esx103',
'sg-v5esx100',
'CAPE-I063-I53B1',
'Business Planning and Reporting',
'sg-v5esx001',
'sg-v4esx100',
'sg-tenable02',
'sg-tenable01',
'CABRNP02RTR001',
'CAPE-I011-I06A1-1',
'CAPE-I029-I28A1',
'sg-hputil001',
'CAPE-I055-I52A1',
'Business Pulse 1.0 PROD',
'sdhn5569',
'CGO-CC01',
'CHBC-I015-P17',
'CNBOCE1GW',
'sdc-vgw007',
'CNCOSC1GW',
'CNCSC1GW',
'sdc-vgw005',
'CNHAP-A002',
'CNHAP-A107',
'CNHAP-I002-MAIN',
'CNHAP-I007-PDD',
'CMK Data Platform Release 1.0 - ',
'CNHAP-I033-HABC',
'CNHAPCE1GW',
'sd01b1c',
'CNHAPCE4GW',
'scv001-zw1',
'CNHAPSC2GW',
'CNLG-I003-SVRITRM1',
'CNLG-I015-SVRITRM2',
'CNLG-I017-EWMS',
'savdc-dns-na01',
'sdc-rtcsql102',
'CMEDSC1GW',
'sdciptcbsaf001',
'sdciptcmsub001',
'CHBC-I025-P20',
'CHBC-I026-P17',
'CHBC-I028-P20',
'CHBCSC1GW',
'CHIGSC1GW',
'CHNCSH01',
'sdhn2029',
'CHPA-I019-E2F1R5',
'CHPA-I021-B2F1A1',
'CHPA-I041-B4F1A3',
'sde3-exadata',
'CHSHRP01RTR001',
'CHSHRP01WLC001',
'CIMAT',
'CINCE2GW',
'sde2db01',
'sde2cel14',
'CMDB (Customer Master Data Base)',
'CMED-I001-ADM01',
'sde1-exadata',
'sdciptsmpub001',
'Boomi-SimplementToMidas',
'CNPDGB01FEX001',
'Boomi-SNOW-OT-Integration',
'Boomi-Product Process Package',
'BRTC-I145-CE-A',
'spb-quantum001',
'spb-mesrptbr',
'BRTC-I160-SERVR2',
'BRTC-M001',
'spb-esx001',
'solx2',
'BTC-I001-RDBFL',
'BTC-I016-RDFF4B',
'BRTC-I139-CE-B-3',
'solac-prod-zl11',
'solac-prod-zl01',
'BTSSC1GW-1',
'BUCCE1GW',
'skertcisesx1',
'BW C&FA (Capital & Fixed Assets)',
'skelg12',
'BW EDNOS (Est Daily NOS)',
'BW FAB (SRAP Budget Tool FAB)',
'skealicsw01',
'BTCPI1GW',
'BW GFSR (Global Financial Shipme',
'spg-apdc500',
'BRTC-I133-SERVR1',
'BRIC-I011-USERS',
'BRIC-I016-4-F-2',
'sqstore001-zw1',
'BRIT-I003-PORT01',
'BRITSC1GW',
'BRK-I002-UTIL',
'BRK-I010-RACK-1',
'sqlp040-zw1',
'BRKCE1GW',
'splx.rtcis',
'BRKSC1GW',
'BRSDCP01SWS013',
'BRSER-CC02',
'BRSER-I002-FLOOR1',
'BRSER-I004-SERVER',
'sqlp010-zw1',
'sqld040-zw1',
'sqld010-zw1',
'BRTC-I130-CP-A',
'splx2',
'sqlp013-zw1',
'ske-pbxaas001',
'sjc-sbc002',
'BW PMTS (Payment Services) - Pro',
'shalx2',
'sgts-meshstphc',
'Boomi-APO IDP',
'Boomi-Big Data',
'Boomi-C&F',
'sgts-mesappphc',
'Boomi-DTC-XI-Updater',
'Boomi-Distributor Connect',
'Boomi-Enovia to PIM Subscriber',
'Boomi â€“ DTC Inbound Orders',
'Boomi-FR Automation',
'Boomi-Global Product Stewardship',
'Boomi-Kardia',
'sgtalicssw001_002',
'Boomi-LDAP To Snow Integration P',
'sgsiniptsmsub001',
'sgo-sbc001',
'Boomi-MIND',
'sglx3',
'Boomi-PrIME Parcel API',
'Boomi-G11 to Enterprise PIM Plat',
'shalx4',
'Boomi - VIA Subscriber Integrati',
'Boomi - TIE',
'sjc-sbc001',
'shilx6',
'Banking',
'Base Plan (Prod)',
'Benefits and Pension Administrat',
'shilx5',
'shi-poputil002',
'shi-mesdtabe',
'shi-mesappbe',
'shi-esx001',
'Bomgar',
'Bomgar - Production',
'Boomi - CAS NA',
'shcrnesx1',
'Boomi - DTC Outbound Email NA (P',
'Boomi - MEGA to RITA (Numerify) ',
'shalx6',
'Boomi - PGP NA',
'Boomi - ServiceNow Supplier Feed',
'Boomi - Snow Mega Application Go',
'Boomi - Snow to Cash Funding',
'Boomi-RDS',
'CNPDGB01FEX003',
'rnlx.rtcis',
'rneg-poputil001',
'prga-sis-srx-RAK-02',
'prga-sis-srx-OCT-01',
'DACH sales reporting tool Prod',
'DALLGFOM1',
'KCD',
'prga-sis-srx-MEC-01',
'DAYLGVSA4',
'DBI-I010-HBF2',
'prga-sis-srx-MAN-01',
'prga-sis-srx-alb-01',
'DBI-I141-B3F1R4',
'DCPSC1GW',
'prga-sis-srx-GAT-02',
'prga-sis-srx-CAP-01',
'prga-sis-srx-AMI-02',
'prga-sis-srx-ABN-02',
'DERWSP01RTR002',
'prga-sis-sam-lon-03',
'DICG-M001-SW003',
'DIEU-M001-BL001',
'DBICE3GW',
'prctj-meshistbe',
'prga-sis-srx-bcp-01',
'prga-sis-srx-bma-01',
'prga-sis-srx-li-01',
'prga-sis-srx-kc-01',
'prga-sis-srx-kar-02',
'Compensating Controls Automated ',
'Concur Expense',
'prga-sis-srx-jpt-01',
'prga-sis-srx-jps-01',
'prga-sis-srx-inh-02',
'prga-sis-srx-icp-01',
'prga-sis-srx-bhi-02',
'prga-sis-srx-hug-01',
'prga-sis-srx-gge-01',
'Core Data Lake',
'Core Data Lake - Ingestion',
'prga-sis-srx-gbs-02',
'Core Data Lake - Shipments',
'Cost Accounting',
'prga-sis-srx-cnh-01',
'prga-sis-srx-chg-01',
'prga-sis-srx-br-01',
'prga-sis-srx-gsr-01',
'prctj-mesappbe',
'prctj-intra001',
'prctj-i009-b4f2r7',
'phishme-mw01',
'pgtaiwan.com.tw_44527',
'pgo-pbxaas001',
'pg.pgpaperlesstrial.com/Service/',
'pg.com.cn_4814',
'pema-mesapp001',
'pem-vgw002',
'DVR-I001-MDC-4',
'DVR-I016-IDF15-1',
'phlx.rtcis',
'DVR-I016-IDF15-2',
'DVRCE1GW',
'peg-vgw03',
'DVRSC2GW',
'DYMC-I004-TE01D',
'pantene.jp/ja-jp/_44717',
'pantene.es/es-es_33275',
'pantene.de/de-de_33274',
'DYMC-I017-TE04E-2',
'DYMC-I025-Serv1',
'DVR-I072-IDF19',
'DRD-I016-LINE',
'DRD-I007-B2',
'DRD-I006-B1',
'prctj-esx001',
'DILCE1GW',
'prcsg-quantum01',
'DIMA-M001-SW001',
'DITR-M001-SW002',
'prcsb-label001',
'DKCPHP01SWA001',
'DKCPHP01WLC001',
'prch-poputil001',
'DLMC-I009-TE02C',
'prch-mestrnbe',
'DLMC-M001-MDF',
'prccj-maple002',
'pom-anthea',
'DMT10',
'pillx.rtcis',
'DOne.Request (Prod)',
'phx-wfs001',
'phx-tapemm001',
'phm-intra001',
'DRD-I002-SRVR',
'prga-sis-srx-lon-01',
'prga-sis-srx-lon-03',
'prga-sis-srx-mec-03',
'prga-sis-srx-meq-01',
'CNTCCE1GW',
'rak-prod032',
'CNTNJO01SWC001',
'CNWHDC-A001-OFF',
'CNWHDCCE1GW',
'rak-prod031',
'COB-I002-B1F0R1',
'COB-I003-B1F0R1',
'COB-I012-B1F0R7',
'rak-wfs001',
'COB-WC01',
'qulx.rtcis',
'COBOGP01RTR001',
'qpcsa083-zw1',
'COBSC2GW',
'qpcsa045-zw1',
'qas-ladc501',
'CORIOCE1GW',
'CR-IDF-A3-3560G-1',
'CRA-I004-SRV60',
'r90p0dax-w10',
'ralx.rtcis',
'CNTC-I001-B1F2AD',
'rgm-aurora002',
'rneg-mestrnbr',
'rneg-mesappbr',
'riolx.rtcis',
'CNSB-CC01',
'CNSB-SRVR1',
'CNSB-WC01',
'CNSBSC1GW',
'CNSBSH01',
'CNSG-A015-5FOFF',
'CNSG-A017-5FOFF',
'CNSG-A018-5FOFF',
'CNSG-I051-B2F1R5',
'rgm-wfs001',
'rgm-trend001',
'CNSGSC1GW-2',
'CNSHCE1GW',
'CNSHO-I002-40ITRM-2',
'rgm-mesrptbe',
'rgm-mdadb001',
'rgm-d2dmm002',
'CNSHVSC1GW',
'CRA-I015-CPM253',
'BRIC-I005-5-A',
'CRA-I016-PERS79',
'CRA-I029-LINE21',
'prga-sis-srx-vbd-02',
'prga-sis-srx-val-01',
'prga-sis-srx-stl-02',
'CRM-Professional Oral Health EME',
'CRS APEX (PROD)',
'CRSJOP01RTR001',
'CS DevOps Digital Platform',
'prga-sis-srx-pom-01',
'prga-sis-srx-phc-01',
'CRGBSSC1GW',
'CSL',
'prga-sis-srx-nwb-02',
'CZRAKP01WAP001',
'CZXUYP01RT001',
'CZXUYP01RTR001',
'CZXUYP01RTR002',
'CZXUYP01WLC001',
'Capture Financial Data Productio',
'prga-sis-srx-nad-02',
'prga-sis-srx-mrp-02',
'CTrip Travel Agency Online Booki',
'prga-sis-srx-wor-01',
'CRGBS-WC01',
'CRGBS-I025-B1',
'CRA-I044-LINE46',
'CRA-I044-SWIFRM',
'CRA-I050-LAG141',
'CRA-I053-PLTRER',
'CRA-I057-HALLC1',
'CRA-I058-HALLC1',
'CRA-I059-GATEHS',
'psysp101',
'CRA-I069-SRV60',
'proficy',
'CRA-M006-LB14RM',
'CRACE2GW',
'CRALHN001',
'prgy-intra001',
'CRGBS-I004-A1',
'prga-sis-uac-nah-01',
'CRGBS-I008-B3',
'CRGBS-I011-C1',
'CRGBS-I012-C0',
'CRGBS-I013-C3',
'CRGBS-I014-C3',
'CRA-I025-LINE16',
'stk-intra001',
'BRGOCE2GW',
'BRGO-I007-FL27',
'APCH-ST-DHCP-04-F',
'vicks.co.uk/en-gb_33402',
'APCH1AAISE',
'APCH1GAWLC',
'APCH2GASA',
'APCHDV1GW',
'APCHEA2IPS',
'vgua-mesdatabc',
'vgo-safcl001',
'APCH-ST-DHCP-03-F',
'APCHMS-VMN1-1SV',
'vbq-vae001',
'API-A042',
'API-A070-HSE',
'vbq-meshisthhc',
'API-I003-LDL',
'valp-wfs001',
'valp-mapleliq01',
'valp-maplehst01',
'valp-esx004',
'APCHPI1GW',
'vEdge-DRCELL-03',
'APCH-ST-DHCP-02-F',
'vicks.it/it-it_33391',
'vpl-pbxaas001',
'vpl-intra001',
'AMIVSA004',
'AMSS (Prod)',
'ANC',
'ANDM-A001-FLR1',
'ANDM-I004-PBX-B',
'ANDM-I006-RD',
'ANDM-I014-WH1',
'APCH-ST-DHCP-01-F',
'vnbdpgwv',
'ANKCE1GW',
'vna-pbxerc01',
'vna-intra002',
'vmlx.rtcis',
'victoria50.fr_39014',
'AP-Singapore-SgIC-Biopolis-6F-6C',
'AP-South Korea-SEOUL GO-SI Tower',
'APCH-I001',
'APCH-I002-3',
'ANDMSC2GW',
'usqasb02sbc003',
'usqasb02rtr001',
'AVM-I012-B1F1R1',
'AVM-I061-B1F1R6',
'usalspgsa434',
'AVMCE1GW',
'usalspgsa425',
'usalspgsa407',
'usalspgsa262',
'AY-I151-MDF-A',
'usalspgsa208',
'AVM-I001-B1F0R01',
'AY-I170-IDF-23',
'AY-I177-IDF-42',
'AY-I207-IDF-63',
'usalspgsa206',
'AY-I210-IDF-66',
'AY-I211-IDF-7',
'usalspg25002',
'AY-I242-B45CF1',
'AY-I244-TE-WH2',
'AY-M003',
'AY-I171-IDF-29',
'AUWHSH01',
'AUSYDP01WLC001',
'AUSYDP01SWA002',
'AR view',
'usqasb01dnm001',
'ASN-I004-RM2-22',
'usqasb01dnf001',
'uslspgwa130-zw1',
'ushadlbpgco003',
'ATHCE2GW',
'ATHD-I009-CR1',
'ATHD-WC01',
'ATHSC1GW',
'ATSPIP01RTR001',
'ATSPIP01RTR002',
'ATSPIP01SWA023-3',
'uscvgp02dhc001',
'usbdclbpgco101',
'AUEP-I066-B2F0R6',
'AUGO-WC01',
'usbdcl3pgco101',
'AUMELP01SWA001',
'AUNRY-I001-B1F4R1',
'usalspgwa108',
'vzgo-intra004',
'AMI-M003-DCLAN',
'war-esx004',
'war-loftware',
'ABN-I041-SEVER2',
'xq-mesappbe',
'ABN-WC01',
'ABN-WEB002',
'wyn-sqstore001',
'wyn-scrd001',
'ADSBSC1GW',
'wyn-onekey001',
'wyn-nadc501',
'ABN-I039-LINE64',
'ADW4R',
'wyn-extdc400',
'wyn-ctx01dir01',
'AEDXBP01RTR001',
'AEDXBP01SWC001',
'wor-sqlagglo01',
'wor-esx001',
'AKA-LAP086-RBNWDK',
'AKA-WC01',
'wolx2',
'wyn-icsprd002',
'ABN-I037-LINE65',
'ABN-I034-HMI-B',
'ABN-I033-P3-A',
'xqlx4',
'275e6fa61b3f4810f24a42a6bc4bcbc9',
'3753P-SWS001',
'xqlx2',
'475e6fa61b3f4810f24a42a6bc4bcb0e',
'6c43eb4adb2b80d0072b24f4059619c9',
'7Zip',
'9293c1abdb3b40902b87c44305961921',
'A6A',
'A6C',
'xq-meshistbc',
'ABN-I010-SERVR1',
'ABN-I012-B',
'ABN-I013-F-A',
'ABN-I016-HMI-A',
'ABN-I017-P1-1',
'ABN-I019-P4-4',
'ABN-I020-P5-1',
'ABN-I024-LINE42',
'xq-mesdatabc',
'ALE-I018-B1F0R0',
'AYCE3GW',
'ALE-I031-B1F0R3',
'ALMCE2GW',
'ALX-I259-TE31',
'ALX-I264-TE26',
'ALX-LAP103-SCHOFF',
'wcmc-wfs001',
'war-vae001',
'AMI-CC01-PCKDC',
'AMI-CC04',
'AMI-I006-PACK1',
'AMI-I012-ADMINB',
'ALX-I253-BLDG2',
'war-reaupl001',
'war-readb001',
'AMI-I034-AHDL',
'AMI-I037-TWR2',
'AMI-I041-KOALA',
'AMI-I047-PACK2',
'AMI-I053-PACK5',
'AMI-I054-Z0',
'AMI-I058-AE40',
'war-mesrpt2bc',
'AMI-I019-DCLAN',
'ALX-I251-IDFF-3',
'ALX-I240-ORIEN',
'ALX-I234-DIST',
'wld-whvisu002',
'wld-vae001',
'ALT-I006-b1',
'ALT-I011-d1',
'wld-pbxaas001',
'ALT-I016-c1',
'wld-esx002',
'ALTLX902_MSA',
'wld-ais001',
'ALX-I068-OPSTN',
'ALX-I072-DRYPACK',
'ALX-I200-IDFA',
'ALX-I203-IDFB',
'ALX-I205-DRYEI',
'ALX-I208-LOGIST',
'wick.de/de-de_33382',
'welegacy-zw1',
'wdlg02',
'ALX-I223-ASRSN1',
'wdlg01',
'ALX-I230-SERVR2',
'ALECE1GW',
'pantene.com.br/pt-br_33267',
'AYL2TP1GW',
'Access Point Wifi PICKING',
'BLIN-I060-SFNET',
'tblx.rtcis',
'BLINCE1GW',
'tbd',
'BLISSCB107',
'BLISSEU132',
'BLISSHD181',
'BLO-I003-SB1',
'BLO-I014-SB10',
'BLIN-I054-SFNET',
'tampax.com/en-us_33352',
'BLOV-I005-SERVER',
'talx.das',
'BLOV-I016-MNRAIL',
'BLOV-I033-MEZZAN',
'taklx5',
'BLOV-I052-BOLT',
'takf-wfs002',
'takf-maple001',
'BLOV-M006-BOLT',
'BLOCE3GW',
'tak-wfs001',
'BLIN-I053-SFNET',
'tclx.rtcis',
'BIC-I058-M0SUPB',
'tilx2',
'BIC-I061-A3',
'BIC-M010-E2',
'BIC-M012-NB',
'tilx1',
'tide.com/en-us_33355',
'BIESC1GW',
'BKL-I013-B1F0R1',
'BLIN-I052-SFNET',
'BKL-I022-B1F0R2',
'BKL-I042-B1F2R4',
'thapbxaas001',
'BKL-I072-B1F2R7',
'BKLCE1GW',
'tha-pbxerc01',
'BKLSC2GW',
'telx.rtcis',
'BLIN-I007-GEDV2',
'BLIN-I019-GEDV4',
'BKL-I032-B1F1R3-1',
'BLOVCE2GW',
'tak-qw-hc',
'tak-mestrnhhc',
'swiffer.com/en-us_33344',
'swa-safcl001',
'BOR-I065-B5F2R6',
'swa-pact002',
'BORCE2GW',
'swa-adicom001',
'stl-wfs001',
'BOSGCE4GW',
'stl-pbxava001',
'syd-pbxaas001',
'BRBF-I013-BUILD6',
'stl-meskepio',
'BRDC-I100-TC-C',
'stl-esx004',
'stk-pbxaas001',
'BRDC-I110-MDF',
'BRDC-WC01',
'BRDCSC1GW',
'BRGO-I001-SERVER',
'BRGO-I004-FL24',
'BRBFCE1GW',
'BOOMI - Aravo (VMD & TPRM) - US ',
'BOISCE1GW',
'sylx.rtcis',
'tak-esx002',
'BMA-I016-ENGER8',
'BMA-I020-WARER9',
'BMA-I022-ENGR11',
'tai-pbxaas001',
'BMA-I038-BLM',
'BMACE3GW',
'BMASC2GW',
'BOBJ-BOP',
'BOGO-I010-FDOCK',
'BOGO-I012-2G',
'tablg2',
'BOGO-I016-7G',
'BOGO-I023-3A',
'BOGO-I033-4U_PBX',
'BOGO-I037-PWRHSE',
'BOGO-I042-ZX',
'BOGO-I044-M',
'szd-pbxaas001',
'BOGO-I063-J7',
'BOGO-I072-F5G',
'BIC-I055-J0',
'BIC-I047-G1',
'tilx4',
'BIC-I042-P1',
'ukbillbpgco004',
'Axway MFT',
'ukbillbpgco003',
'Axway MFT â€“ QA Instance',
'ukbillbpgco001',
'Azure Active Directory (AzureAD)',
'ukbildfpgco003',
'B2Bi',
'ukbildfpgco001',
'Avecto Defendpoint Client',
'tsp-tapemm001',
'B2G FIT',
'tsp-mpwprod',
'tsp-mesrpthhc',
'tsp-mesqadata1',
'BCFLEXRPT',
'tsp-meshisthhc',
'tsp-mesdatahhc',
'BDC-3PAR4162',
'BDC-3PAR4163',
'B2G Cygnet',
'Avecto - Defend Point',
'Avaya G450',
'url-localapp01',
'Account Manager',
'Account Service',
'usalspg22001',
'Adobe Illustrator',
'Adobe Reader',
'Affiliates',
'Agency Compensation Engine',
'AirWatch / Workspace ONE',
'Albany (ayh_das)',
'Albany (ayh_rtcis)',
'Amazon AWS',
'Anaplan TPM - Reporting - Prod U',
'usahadfpgco003',
'Application Management Quality M',
'Application Store',
'urlx1',
'url-wfs001',
'Aravo Prod',
'url-mestrnhc',
'url-meshisthc',
'url-mesdtahc',
'BDC-EVA1420',
'AZ-RG-AmazonOWEN-Prod-01',
'BDC-EVAB750',
'BDC-NAS',
'BELL-I092-B25MC-1',
'BELL-I097-B21S',
'ts-i070-200-7',
'ts-i062-200-3',
'BELSC2GW',
'BEOVRP01RTR001',
'ts-i061-200-2',
'BEOVRP01WLC001',
'ts-i057-300-4',
'tsp-enclw001',
'BGDSC1GW',
'BGSOFP01SWA001',
'BGSOFP01WLC001',
'BIC-I010-H0DC',
'BIC-I014-D0',
'tor-wfs001',
'BIC-I025-E2',
'BIC-I027-LB',
'BIC-I033-M0SUPA',
'tor-d2dmm001',
'tr.braun.com/tr-tr_32878',
'BEL-WC01',
'tsp-esx003',
'BEL-I049-FAM143',
'tsp-mesdata4',
'BDCEA1GW',
'BDCEX1FW',
'BDCFWGW',
'BDCOREGW',
'BDLG3349',
'BDLN7665',
'BDP-I004-DBAY',
'BDP-I013-FFPUA',
'tsp-mesconfig',
'tsp-iqagent101',
'BDP-WC01',
'BDPSC1GW',
'BEARCE01GW',
'BEARSC1GW',
'BEL-I004-NWO40',
'BEL-I007-EITRN',
'BEL-I022-SEO100',
'BEL-I023-OLAY2',
'BEL-I044-MDF',
'BEL-I045-SEWP150',
'BDC-LCCS600\INETP201',
'DYMC-LAP144-K',
'adln9369',
'pantene.com.ar/es-ar_33265',
'man-esx002',
'man-esx001',
'HCRC-I101-CFB-814',
'HCRC-I102-CF1-8211',
'HCRC-I102-CF1-8211-1',
'HCRC-I108-IVI-703',
'mad-pbxaas001',
'HCRC-I111-IV2-703',
'm.sk-ii.com.tw/tc-TW_24045',
'HCRC-I081-K2PT3',
'HCRC-WC01',
'luo-mestrnbc',
'HHPSC1GW',
'luo-meslocbc',
'luo-meshstbc',
'HKHKGP01WLC001',
'HKLSC1GW',
'luo-esx001',
'lulx6',
'lulx.rtcis',
'lxcc_f6p_db',
'HRZAGP01SWA001',
'man-mesappbc',
'HCRC-I074-DS1D-2',
'HCRC-I026-DS2C-2',
'HCRC-I028-DS3A',
'HCRC-I029-DS3A-2',
'HCRC-I035-DV1A-2',
'maralicssw002-2',
'mar-act-esxi01',
'HCRC-I038-DV2A',
'HCRC-I038-DV2A-2',
'HCRC-I040-DV2B-3',
'HCRC-I075-SR2',
'HCRC-I042-DV2C',
'man-vae001',
'HCRC-I055-SB3A',
'HCRC-I057-SB4A',
'man-onekey001',
'HCRC-I059-SB4A-2',
'HCRC-I061-SB4B-2',
'HCRC-I062-CF2B-2',
'HCRC-I071-DS1A-2',
'HCRC-I073-DS1B-2',
'man-wfs001',
'lonlgrtcis',
'HUB-A001',
'HUB-A002',
'lolx.rtcis',
'HYG-I060',
'HYG-I060-PATCH1',
'HYG-M001-B1F01',
'lmhm-maple004',
'lmhm-lpdspc01',
'lmdc-esx001',
'HYP',
'lmd-pbxava01',
'lon-esx003',
'lm01a1c',
'lm-vcenter001',
'IBA (Prod) v2.0',
'IBA-I004-FHC',
'lm-sitepdp_svr',
'lm-mestrnfhc',
'lm-i000-iscsi-20',
'IBM Guardium Prod',
'lm-ffmesdb01',
'lm-esx010',
'Hyderabad (hydlx_rtcis)',
'HYG-I032-B1TA30',
'HYG-I015-B1AE02',
'HYG-I012-B1AE01',
'HUB-I011-B1F1R1',
'HUB-I071-B7F1R7',
'HUBCE5GW',
'lonalicssw001_002',
'HUBUDP01RTR002',
'HUBUDP01WLC001',
'HUGP-I004-SERVER2',
'HUGP-I006-TC6',
'HUGP-I011-SR1-3',
'HUGP-I013-ASB1',
'HUGP-I019-RM1',
'HUGP-I024-SERV',
'HUGP-WC01',
'HUGPCE1GW',
'lon-wfs001',
'lon-tapemm001',
'lon-ortec001',
'HYD',
'lon-mes020',
'HYG-I002-B1F1R1',
'HYG-I007-B1F1R2',
'HCRC-I025-DS2C',
'marp-esx004',
'HCRC-I022-DS2A-2',
'HCRC-I020-DS1D',
'meq-poputil002',
'GSAW2-I181-H',
'GSAW2-I182-J',
'GSAW2-I183-K',
'GSAW2CE3GW',
'GSAW2SC1GW',
'GSAW2SC2GW',
'meq-mestrnbc',
'meq-mesdatabc',
'GRP SQL-DB WLD',
'meq-fsrv101',
'meq-esx001',
'GSDC-XP94073',
'meq-agvs102',
'mel-pbxerc01',
'GSR-I202-IDFD',
'GSR-I203-IDFE',
'GSR-I203-IDFE-1',
'GSR-I214-IDFB',
'GSR-I218-MDFB',
'meq-esx004',
'GRMI-WC01',
'meq-sqlt102',
'merlx.rtcis',
'GO-I044-CRF01B-4',
'GO-I051-CTF04A-3',
'GO-I060-PAV124-1',
'GO-I062-PAV124',
'mhf-mesrptphc',
'mhf-fdhistorian',
'mhf-esx004',
'GO-I085-TER03',
'GO-I088-TEF09H',
'GO-I147-CTF07A-1',
'mhf-esx002',
'GO-I170-TN1H',
'GO-I171-SERVER',
'GO-I180-SERVER',
'GO-M001-TNVSS',
'metamucil.com/en-us_43317',
'GOCC1GW',
'GOCOREGW',
'GORDB: Global Organization Datab',
'metamucil.com/en-us._33125',
'merlx6',
'GSRCE01GW',
'lm-esx001',
'mdp-meshistbc',
'mdp-mesappbc2',
'mb-qs-vp-dbo01',
'Golden Hand Instore Execution (C',
'mb-ifs-ipam',
'mb-db-rapid',
'mb-app-ispeed',
'matlx2',
'matlx1',
'mat-pbxaas001',
'HCRC-I005-CF1D-2',
'mb-web-i2m',
'HCRC-I008-CF2B',
'HCRC-I010-CF2D',
'HCRC-I012-CF3A',
'HCRC-I013-CF3A-2',
'HCRC-I014-CF3C',
'marp-poputil001',
'HCRC-I015-CF3D-3',
'marp-it002',
'HCRC-I018-DS1B',
'marp-image001',
'HCRC-I009-CF2C-2',
'DYMC-M001-MDF',
'mbdbora-zl1',
'mbi-pbxaas001',
'GVD',
'GXP',
'GZCE2GW',
'GZCE3GW',
'GZGO-GAWC01',
'GZGO-I002-L09H02_1',
'GZGO-I003-L08H01',
'GZGO-I013-L15H01',
'mdp-esx001',
'GZGO-LAP091-L1304',
'mcgo-intra001',
'mbraphost7-zw1',
'mbrap2gwv',
'GZGOPI1GW',
'GZGOSC2GW',
'mbrap-mestrnhc',
'mbrap-meshisthc',
'mbrap-kronos11',
'Geovisualization',
'mbrap-intra101',
'Global Customer Workflow',
'GTOFRA',
'IC-I013-16-1',
'IC-LAP037-B13',
'IC-WC01',
'jed-meshistbc',
'Identity Management',
'jed-esx002',
'Imperva-SecureSphere-MX',
'Imperva-SecureSphere-SOM',
'ingo-vms-01a',
'inbh-intra001',
'ina-pbxaas001',
'imp-intra001',
'Identity Central',
'igoa-meshstbc',
'igoa-intra001',
'igoa-esx001',
'igoa-ddsp001',
'icpoc-poputil01',
'Itatiaia (italx_das)',
'icpoc-esx002',
'J1P (bdln2515)',
'icp-pbxava001',
'iciaalicssw01',
'Integration Platforms for Cloud',
'IUCLID',
'ITROMP01WLC001',
'jed-vae001',
'ITC-I145-HF0S38',
'jij-service101',
'ITC-I147-MS1E11-8',
'jij-pcenter101',
'jij-mestrnbc',
'jij-meshstbc',
'jij-mesdtabc',
'jij-esx005',
'ITC-I167-HF0N32',
'ITC-I184-GPDFFR',
'ITC-I191-HF1S42',
'ITC-I198-M0C1',
'ITC-I213-TSDC',
'ITC-I215-TSDC',
'ITC-I216-TSDC-1',
'jhq-rcdb002',
'ITC-M002',
'ITRM-A002',
'ITRMCE1GW',
'jgo-pbxaas001',
'ITROMP01RTR002',
'JEDGOPIGW',
'ITC-I139-HF2C36',
'JIJ-CC03',
'JIJ-I004-BABYCARE',
'iba-mestrnhhc',
'iba-mesapphhc',
'JPYAUP02SWA008-2',
'iZoom RSi Retailer Connect - Pro',
'JPYAUP02WAP001',
'iAccess_CA',
'hylx4',
'hyg-wfs002',
'hyg-tampaxtsg',
'ibh-esx001',
'hyg-pbxaas001',
'K8Q',
'hyg-meshistbc',
'K9R',
'hyg-lbp001',
'hyg-i055-bivf0n',
'hyg-esystems001',
'hyg-esx003',
'KBC-WC01',
'hyg-cps002',
'hyg-mestrnbc',
'ibh-intra002',
'ibh-mesdatabr',
'JPTAKF-I004-FHCSTR',
'JIJ-I006-BABYCARE',
'ic-mestrnbe',
'JIJ-I022-DCENTER',
'ic-mesdatabe',
'JIJCE1GW',
'ic-esx002',
'ibp-wfs001',
'JPGO2-I003-L06H01',
'JPGO2-I004-L07H01',
'ibp-meshisthhc',
'JPGO2-I009-L12H01',
'ibmguardium-zl2',
'JPGO2CE1GW',
'ibh-poputil001',
'JPMICE1GW',
'JPNGOP01RTR001',
'JPTACE1VPNE',
'JPTAKF-A001-MACRM',
'JPTAKF-A032-FHCSTR',
'JPTAKF-I001-SERVER',
'JPTAKF-I003-PACARE',
'icia-esx003',
'GO-I029-TEF04H',
'jij-tempo102',
'jijalicssw001-1',
'IDJKTSC1GW',
'IDJPUP01SWA001-1',
'lbn-pbxaas002',
'IEDUBP01RTR001',
'IEDUBP01SWA001',
'IGM-I041-B1F0R4',
'IGM-I116-B1F1R1',
'IGMCE2GW',
'IMP-A074-MPR',
'IDJKRSC1GW',
'latam.oralb.com/es_42019',
'IMP-I023-B1F0I2',
'IMP-I026-B1F0I5',
'kukident.es/es-es_40808',
'IMP-I029-F1R9FC',
'IMP-I030-NSTGF',
'IMP-I031-F1R9FC',
'krgogwv',
'IMP-I048-F1JOG0',
'krgo-intra001',
'lap-pbxaas001',
'IDJKRCE1GW',
'IDJKR-SRVR2',
'ldz-logicprint1',
'lm-d2dmm013',
'lm-acagent06',
'ICIA-I076-IDFC3',
'ICIA-I079-IDFE1',
'ICIA-I080-SERVR2',
'ICIA-I084-IDFB1',
'ICIA-I092-FOA1SR',
'ICIA-LAP008-FO1STR',
'limlg4',
'ICSC1GW',
'lenor.de/de-de_41386',
'ldz-toolworx',
'ldz-meshistbr3',
'ldz-meshistbr2',
'IDJKR-C002',
'IDJKR-I001-HC-GF',
'IDJKR-I013-BDSER4',
'IDJKR-I024-GUARD',
'IDJKR-IDF-MSRV-SW1',
'IDJKR-IDF-RMS2-SW1',
'IDJKR-IDF-RMS3-SW1',
'IMPCE3GW',
'jij-vae001',
'koz-sql003',
'koz-bpm001',
'INHYD-I023-BCGNDIDF4',
'INHYD-I037-DCITRM',
'kc-mesio01',
'INHYDCE2GW',
'kc-mesdb101',
'kc-autocdo1',
'kalx_das',
'IPRD (Integrated Panelist Recrui',
'jpgo-sbc001',
'INHYD-CC02',
'IPaas-Boomi',
'joh-d2dmm001',
'jkt-pdpp001',
'jkt-meshstbc',
'ISOP Tax Forms',
'ISP (In Store Performance)',
'jkt-mesappbc',
'IST-I003-IDF1',
'jklx.rtcis',
'IT&OT at Plants',
'jop-pbxaas001',
'kc-mesio101',
'INGOCE4GW',
'kc-spcrpt01',
'kolx.das',
'kdhlx2',
'kdhlx1',
'kdh-vaecms001',
'INBAD-I017-FHC',
'INBAD-WC01',
'INBADCE1GW',
'kdh-linutil003',
'kdh-eudc500',
'INBADSC1GW-1',
'INBHI-I012-B1F1R1',
'kcp-pbxava001',
'kcp-avapbx001',
'INBOMP01SWA001',
'INDACCCE1GWE',
'INDFRLCE1GWE',
'INDLNTCE1GWE',
'INGO-I003-3FDC',
'INGO-I004-2FHR',
'INGO-I010-3FDC',
'INGO-WC01',
'koz-intra001',
'mhf-pbxaas003',
'mbappgrdm-zl1',
'GO-I018-TNF11',
'FVARCE1GW',
'ESMTOP01WLC001',
'mtep-mestrnbc',
'ESMTOP01RTR001',
'mtep-mesappbc',
'FastMart Prod',
'mtep-tapemm001',
'ESMADP02WAP001',
'msmo-sqlp002',
'mrp-vgw001',
'mrclean.com/en-us_33128',
'Firefox',
'mpc-pbxaas001',
'ESMADP02SWC001',
'Financial Management Center (FMC',
'mp_label3_b14',
'mum-safcl001',
'mum-vmlerc02',
'FIHELP01WLC001',
'oct-vms001',
'FLEXLabDbP-zw1',
'FMOT-LAP001',
'odaw16001-zw1',
'FNMS (Prod) 2',
'FRDIJP01SWA001',
'FOE (Fast Order Entry) v0.0- Pro',
'mvlg5',
'mvlg4',
'mvcrnesx2',
'mvcrnesx1',
'ESS Timesheet - CR',
'FRBLOP01RTR001',
'ogge-wfs001',
'FIHELP01RTR001',
'ogsr-meshisthhc',
'mp01a1c',
'olmdm-mesdb01',
'GAT-I036-PLC2',
'GATSC1GW',
'GATTCE1GW',
'onwb-wfs001',
'ENABLE Prod',
'olay.com/en-us_33149',
'EGSC1GW',
'oprch-mesdtabc',
'GB-I028-B48PAL',
'GB-I049-B71BDF',
'GB-I055-B79CGT',
'GB-I119-SERVER-2',
'mp-mestrnfc02',
'oprch-mesdatabe',
'Forecast One - F1 ControlTest',
'GAT-I009-IDF5',
'GAT-A034',
'mp-wfs006',
'GADC-3PAR3021',
'GADC-3PAR4100',
'mp-supermrkt',
'GADC-ALOHA001',
'EUS-I035-WAREN3',
'GAT-A070',
'GADC-XP66138',
'GADC-XP94070',
'olay.ca/en-ca_33135',
'GADCCE1GW',
'GAGSCE1GW',
'mp-monitors',
'GAT-A031',
'ESMADP01WLC001',
'EGCE1GW',
'FFMCE3GW',
'FERI (Front-End Reporting Interf',
'EUS-LAP145-WH7',
'EUS-M012-LAGERH',
'EUS-I003-HAUPT',
'EUS-I001-HAUPT',
'nov-meswbbc',
'nov-i049-b4f1an',
'EUS-I154-HALLE7',
'EUSLHN004',
'nov-esx001',
'EUR-UK-EGHAM GO-IC Branson B10 G',
'nwb-loftware001',
'Email Integration',
'Email messaging',
'nwb-mesdatahc',
'nov-esx007',
'EUCHEX1GW',
'EUS-I152-HALLE9',
'EUS-I070-9NEWC1',
'nov-vae001',
'nov-srtest002',
'EUS-I047-HALLE7',
'nov-wfs001',
'EUS-I024-CSCONT',
'novprimeesx3',
'nov-pbxaas001',
'EUS-I017-KLIMA',
'nov-srprod001',
'EUS-I054-9ENDE',
'EUS-I010-LAGERH',
'nov-poputil001',
'EUS-I062-CW01',
'EUS-I006-HAUPT',
'EUS-I013-EERAUM-1',
'oct-mesrptbc',
'nov-apalprod01',
'ngbay-proficy02',
'nbdc-eassqldev',
'nay-meshistfc',
'EUCH-ST-DHCP-05-F',
'EzP2 APIs (Back End) for Price U',
'F5 Big-IP Virtual',
'naup-meshisthc',
'obrk-maple005',
'nalx.rtcis',
'nach-st-dns-0-2',
'FAMICE1GW',
'FASTMART Platform',
'mxo-safcl001',
'oct-mesdatabc',
'mvlg6',
'oct-esx002',
'nwb-meshisthc',
'obosg-meshistbr',
'nbp-pbxaas001',
'Encase',
'ngbay-meshistfc',
'nwb-poputil001',
'neus-adicom001',
'nemc-wfs001',
'EUCHDV1GW',
'nbell-agv001',
'nemc-agvprod001',
'EUCH4GAWLC',
'EUCH3GAWLC',
'obell-int04',
'EUCH-ST-DHCP-10-F',
'ndvr-mesdatabc2',
'ncp-pbxava01',
'nem-apaltest02',
'EG-LAP080',
'GADC-NAS',
'GEN-I010-B2CR32',
'GDK-I002',
'ox-net001',
'pabc01agwv',
'mnrtcisesx1',
'mil-poputil002',
'pampers.be/fr-be_33206',
'GERMANY',
'mil-esx006',
'GCGOCE1GW',
'Domain Name System (DNS)',
'mos-esx001',
'GENCE3GW',
'GGE-I061-B1F3R6',
'GGE-I081-B3F0R8',
'Data Genie',
'GGE-I121-B6F112',
'mos-pbxaas002',
'orlx4',
'GBVEN-WC01',
'GBTUWP01SWC001',
'GBSSC1GW',
'GBSCE02GW',
'oralb.no/nb-no_41213',
'oralb.es/es-es_41008',
'GGE-I072-SERV',
'mnlg2',
'GEN-WC01',
'GEB-I002-MAINB',
'mmi-esx001',
'GEN-I037-TWRE23',
'orderyourdosingdevice.com_1674',
'ovalp-mesrptfhc',
'GEN-I032-TWRE18',
'GEN-I030-TWRC16',
'ord-mesdtahc',
'ord-mesdata01',
'GEN-I029-TWRB15',
'GEN-I028-TWRE14',
'min-pbxaas001',
'GEN-I027-TWRD13',
'GEN-I026-TWRC12',
'GEN-I023-TWRE09',
'mil-web101',
'mnl-pbxava01',
'mp-mesrptfc',
'mnl-vmlava01',
'ox-esx001',
'GEBSC1GW',
'GEBCE3GW',
'GEB-I017-LAUND',
'oralb.se/sv-se_41299',
'GEB-I016-LAUND-2',
'GEB-I006-ORKID',
'GBS-I125-PARK',
'ED01A1C',
'GGE-I182-BCF018',
'mmi-locweb',
'GBS-I002-MDF01-5',
'mil-esx004',
'EDCHUB1GW',
'mp-3par73306_DC14',
'mp-mesdatabc',
'micc-payroll002',
'mp-esx004',
'GO-A633-CT0709',
'mhf-sql001',
'GMIP (Global Manufacturing Intel',
'oralb.ca/en-ca_33172',
'GMDB: Material DB (R&D)',
'moslg005',
'mhf-v3vm002',
'DYMCSC1GW',
'GBHRTP01SWA001',
'DYMCCE3GW',
'GBHRTP01RTR002',
'EDI Market Services - GREATER CH',
'GBS-I008-IDFC01',
'GGE-LAP074',
'GGECE2GW',
'GBHRTP01RTR001',
'GO-I009-TNF0-2',
'pantene.co.id/id-id_33281',
'mp-mesdtafc02',
'moslg012',
'pantene.co.uk/en-gb_33300',
'GGE-I202-B5F110',
'GGE-I214-BEF120',
'pampers.de_33218',
'moslg019',
'GBS-I016-IDFJ01',
'EG-I052-BRANS5',
'GO-I016-TNF09H-1',
'pamperspakistan.com_41579',
'prga-sis-srx-cc-02',
'iNet Wiki',
'prga-sis-srx-bor-01',
'dentalcare.com/en-us_41001',
'pema-dpmm001',
'vicks.com/en-us_33403',
'kdh-nadc500',
'usbdclbpgco003',
'crgo1gwv',
'uscvgp01rtr006',
'hyg-esx001',
'dentalcare-aus.com.au/en-au_4209',
'usbdclbpgco004',
'iPlanning Visualization',
'novlx3',
'ox-agv102',
'cpu1-inpg-cnhap-1',
'ddsidb-zw1',
'gillette.nl/nl-nl_33015',
'jplx4',
'amw-actsvcprd01',
'xq-mestrnbc',
'usqasb02sbc001',
'amplg7',
'gillette.pl/pl-pl_33016',
'blin-mesdatabr2',
'gillette.ru/ru-ru_33017',
'prga-sis-srx-hyg-01',
'dvr-esx001',
'andm-esx003',
'gillette.fr/fr-fr_33007',
'peg-vgw02',
'andm-prime01',
'blo-esx001',
'prga-sis-srx-eus-01',
'blo-pbxaas001',
'adln9379',
'prga-sis-srx-dvr-02',
'hyg-fpdrfid',
'prga-sis-srx-inm-01',
'adln9391',
'vgo-pbxaas001',
'ox-mestrnfc',
'cps-pbxaas001',
'kalx_rtcis',
'nwb-vae001',
'nwb-esx001',
'dvr-pbxava001',
'wld-grpdb002',
'vicks.ua/ru_41167',
'jed-mesdatabc2',
'aeclx2',
'cape-esx001',
'oralb.ca/fr-ca_33173',
'phm-intra008',
'wcmc-vms101',
'wbe-vgw001',
'cape-web203',
'headandshoulders.co.uk/en-gb_330',
'ale-vae001',
'dallg6',
'brio-web001',
'jed-pbxaas001',
'dayplg5',
'prga-sis-ltm-aph-01',
'prga-sis-ltm-euh-01',
'dayplg7',
'phlx4',
'oralb.co.za/en-za_41639',
'altlx901',
'brklx2',
'oldspice.com/en_31505',
'cabrnp01wlc001',
'pom-wfs001',
'pom-hdl004',
'cab-maplerpt006',
'dam-esx001',
'calx4',
'ca.braun.com/en-ca_32854',
'oplx4',
'olay.co.th/th-th_33146',
'oral-b.co.in_43319',
'igoa-mesappbc',
'aeprimeesx1',
'daycrnesx2',
'bru-v4esx100',
'gsr-vgw001',
'ale-esx001',
'wdc-vgw001',
'wolx.rtcis',
'aka-mestrnbc2',
'braun.pl/pl-pl_32871',
'gsdc-siebel011',
'altlx902',
'jij-fsrv101n',
'prga-sis-srx-GEB-01',
'alx-wfs001',
'gsdc-esxgu001',
'oct-mestrnbc',
'wyn-wfs001',
'pgschoolprograms.com_7076',
'bosg-esx001',
'prga-sis-srx-GBY-01',
'ami-esx004',
'bosg-ems001',
'wynlx1',
'jij-sqlt102',
'wynlx2',
'borlx4',
'bor-wfs001',
'prga-sis-srx-NAL-03',
'oct-esx001',
'ibh-mestrnbr',
'wyn-smtapp001',
'gsdc-intra007',
'jiclx4',
'war-pbxaas001',
'jhq-bpm001',
'war-mestrnbc',
'adln9407',
'wyn-limsprod01',
'always.de/de-de_41017',
'wyn-limsql001',
'oralb.pt/pt-pt_41175',
'braun.be/fr-be_38129',
'cdlx6',
'adln9406',
'prga-sis-srx-APH-03',
'wyn-onekey002',
'war-mesdata2bc',
'celx4',
'adln9400',
'ceprimeesx1',
'adln9398',
'prga-sis-srx-DRD-01',
'jklx4',
'prga-sis-srx-meq-02',
'beu-esx002',
'ggo-pbxaas003',
'gadc-sqlp011',
'bdc-ovoc001',
'tablg4',
'bdc-poh001',
'bdc-pssdashbd01',
'mp-mesdatacpn2',
'fra-nadc500',
'marlx2',
'fva-pbxava01',
'marlx4',
'bdc-ntsupp001v',
'gadc-sqlp002',
'sylx2',
'bdc-rtcedge01',
'bdc-rtcedge03',
'mosln001',
'bdlg3496',
'moslg020',
'bdlg3477',
'swa-pbxaas001',
'bdlg3436',
'stlsc1gw',
'gadc-aclg001',
'tai-pbxaas002',
'bdc-nadc401',
'gadc-sqlp012',
'lvlx4',
'tblx4',
'bdln5597',
'mad-pbxaas003',
'bdc-eudc401',
'bdc-extra153',
'bdc-iamsql01',
'sdc-rtcedge01',
'gadc-sqspool006',
'talx.rtcis',
'bdln2738',
'man-mestrnbc',
'bdln2737',
'bdln2728',
'bdc-iptsme003cn',
'febreze.com/en-us_32989',
'takf-esx001',
'bdln2644',
'man-pbxaas001',
'bdc-ldapprd009',
'bdc-ldapprd011',
'sdc-var001',
'mp-meswebbc',
'gadc-plmgp004',
'bdc-safcl003',
'mos-sqlp003',
'gadc-payroll01',
'gadc-kgsfs02',
'mil-web002',
'gadc-elnd001',
'sg-onekey003',
'sjg-pbxava01',
'sg-swinds001',
'siln8115',
'shlg7',
'mil-vgw001',
'mil-mesdatabr',
'shilx2',
'merlx4',
'shcrnesx2',
'sgic-intra001',
'sglx.rtcis',
'sglx2',
'gadc-fnmp005',
'gadc-eptm001',
'mhf-tapemm001',
'sgo-pbxaas007',
'shalx.rtcis',
'bdc3gw',
'mhf-pbxaas001',
'bdc-sqlp045',
'bdc-elnm001',
'skelg3',
'bdhp5250',
'gadc-ompvfs02',
'mbc-vgw001',
'bdlg3399',
'gadc-cfm007',
'sdhn6641',
'gadc-omp004',
'gadc-cmadvp001',
'mnlg6',
'gadc-odessey003',
'gadc-cmdvp001',
'gadc-nadc500',
'sdln5718',
'gadc-mpsgdbp01',
'gadc-mpsdb',
'se.braun.com/en_32875',
'secret.com/en-us_33329',
'mdp-esx005',
'med-pbxaas001',
'med-vae001',
'solac-qa-zl01',
'sg-asiabidb01',
'gadc-labvntgd06',
'skelg6',
'prga-sis-srx-mhf-02',
'tep-vgw001',
'riolx4',
'axlg2',
'usahadfpgco005',
'ay-esx003',
'ldz-esx005',
'gen-pbxaas001',
'ay-mestrnfc',
'nov-directum001',
'geb-vae001',
'egy-companyshop',
'geb-poputil001',
'nov-mestrnbc',
'azl-adln9390',
'ldz-mesdatabr2',
'newlx.rtcis',
'url-esx001',
'nemc-meshistmx1',
'nemc-alpsmain',
'limlx9',
'gbs-mestrnhc',
'lis-pbxaas001',
'uk.braun.com/en-gb_32881',
'gbs-asvr001',
'beu-wfs001',
'prga-sis-srx-spa-01',
'usahal3pgco201',
'usalspg21001',
'kolx.rtcis',
'kolx4',
'gglx3',
'prga-sis-srx-mmi-01',
'prga-sis-srx-nah-01',
'atllg4',
'usalspgsa410',
'gglx2',
'usalspgsa284',
'ePADEx',
'prga-sis-srx-new-rgm-01',
'usalspgsa257',
'krgoagwv',
'eQMS',
'bidlx2',
'edc-cccvgw001',
'kutatasi-kozpont.hu/hu-hu_41178',
'lag-pbxaas001',
'avm-esx001',
'lbn-pbxaas001',
'usalspg25001',
'prga-sis-srx-phx-01',
'gge-esx001',
'gbrdnp01dhc001',
'tsp-stewcs02',
'tsp-stebms001',
'gbp-vgw001',
'azw-shrsqlps01',
'azw-wmdvsqlp01',
'lon-iismaple',
'lon-mes010',
'badlx4',
'bdln9256',
'bajlx4',
'balx6',
'tor-safcl001',
'gadc-udwevt01',
'bdln9000',
'bdln7723',
'msmo-vms001',
'bclx2',
'lonlg3',
'bcru-app001',
'eus-pfm001',
'mplx4',
'bdc-222-sw01 irf',
'mplx.rtcis',
'rgo-pbxaas001',
'thp-pbxaas001',
'luo-mesappbc',
'azw-shrsqlds01',
'mp-web003-app',
'tsp-appserver',
'azw-gp20adosprd',
'mhf-poputil001',
'lm-3par72135_BCKP',
'tsp-mesqahist1',
'nem-apalprod01',
'gbay-esx005',
'nbdc-tarchfadev',
'bell-traksys001',
'gat-maple002',
'azl-enoh003',
'tsp-mesdata3',
'bell-mhdas01n',
'tsp-mesdata1',
'gadc-wfshrd001',
'pt.braun.com/pt-pt_41298',
'azl-shrtomp01',
'bell-esx101',
'mxmil1gwv',
'etln1132',
'tsp-esx005',
'etln1134',
'gadc-viasqlp',
'lmlx2',
'tsp-esx001',
'euch-st-dhcp-09-f',
'bor-tapemm001',
'-',
'LM-I002-PHROOM',
'NACH-ST-DHCP-01-F',
'NACH-I006',
'NACH-I005',
'NACH-I001',
'BRBFSC1GW',
'Microsoft SharePoint Online - PR',
'BRDC-I109-TC-M',
'BRIC-I002-4-MDF',
'BROPCE1GW',
'Media Data Warehouse - Productio',
'Media Data Warehouse',
'MXMIL-I017',
'MXMIL-I008',
'MXMIL-C012',
'MXHXCP01WLC001',
'MXHXCP01SWA006',
'MXHXCP01SWA004',
'MXHXCP01SWA002',
'MSMOCE1GW',
'MP-I135-B52-3',
'MP-I093-24-2',
'BRTC-I137-CP-C',
'MMSD-I001-SITE',
'NACH-ST-DHCP-02-F',
'NACH-ST-DHCP-05-F',
'NACH-ST-DHCP-06-F',
'NACH-ST-DHCP-07-F',
'NWB-I007-B1F1A2',
'NWB-I006-B1F1R1',
'NWB-I001-B1F1R1',
'BOR-I011-B1F3R1',
'NOV-I047-B4F1AU',
'NOV-I026-B73F1R',
'NOV-I023-B4PAMP',
'BOR-I015-B5F2R6',
'NOV-I015-B73F3P',
'NOV-I013-B4F1AM',
'MMICE02GW',
'NGSO2CE1GW',
'NEMC-I016-TE05B',
'NAUPSC1GW',
'NAUP-I118-GALERIA',
'NACL1AAISE',
'BOR-I041-B3F1R4',
'NACHCE1GW',
'NACH1GAWLC',
'NACH10AAISE',
'NACH-ST-DHCP-09-F',
'NACH-ST-DHCP-08-F',
'BORCE1GW',
'NEMC-I025-TEWTO',
'Normative Forecaster',
'BRTC-I149-CE-C',
'MICD-I011-HCMTG',
'LM-I101-LFEPRC',
'adln9364',
'LDZ-I046-LMCBOF',
'LDZ-I043-LMCBOL',
'LDZ-CC01-LMC01',
'LDZ-A001',
'LBNSC1GW',
'LBNCE2GW',
'LBN-I012-B1F0R1',
'BW COPA (Controlling Profitabili',
'BW COST (Cost Accounting)',
'KRSELP01SWC001',
'KROSC1GW',
'KRO-I062-AA',
'KRGO-WC01',
'KP-I020-B10R23',
'KP-I015-B10R19',
'KIEV-WC01',
'KCTAPE001',
'BW PMTS (Payment Services)',
'KBCCE4GW',
'KBC-I009-ITROOM-1',
'KBC-I005-ITROOM-3',
'LM-I172-STORRM',
'LM-I182-BLDG49',
'LM-I191-PFOFC',
'LM-i041-DOCK2',
'MICD-I001-DTCTR',
'BRTC-I154-CE-F',
'MHFSC2GW',
'MHFSC1GW',
'MHF-I037-IDF4',
'MHF-I027-B1F1RD',
'MHF-I021-B1F2RA',
'MHF-I009-B1F0R3',
'MHF-CC02',
'MEC-I043-7F5C9',
'MEC-CC03',
'MIND (Production)',
'MARP-I002-SERVR1',
'Linux',
'BTC-I005-RDSFLL',
'LONCE5GW',
'LON-I046-HUB3',
'LON-I044-H23C1',
'LON-I043-H10C2',
'LON-I042-H22C1',
'LMDCCE2GW',
'LMCON-M001-MCS',
'BTCSC1GW',
'LMCON-I025-SUD26',
'MANCE3GW',
'OCT6B-I005-40TC5',
'OCT6B-I007-43TC7',
'OCT6CE4GW',
'SAP-HR-PAYROLL-NZ',
'Aravo (VMD & TPRM) - US',
'Aravo (VMD & TPRM) - US PROD',
'Argus R 8.1 Production',
'AspireHR_Ceridian',
'Azure Information Protection',
'B2G - SAP eDocuments',
'BACKUP',
'BDCEA2GW',
'BDP-I019-GFWARH',
'BEL-I009-TRKSHP',
'BEL-I056-DPUB',
'BELL-I096-B25NW',
'SAP-AR - L6P',
'SAP-AR - A6P',
'BEOVRP01SWC001',
'BESOVP01SWA001',
'BGSOFP01RTR001',
'SAP Payroll Calendar',
'BIC-I034-NB',
'BIC-I045-U0',
'BIC-WC01',
'BKL-I052-B1F0R5',
'AYSC1GW',
'AY-I163-IDF-8',
'SAP-IM AAI/GC SC (A6P)',
'AUMELP01RTR001',
'SPARSC1GW',
'SPARCE3GW',
'SNKDCE1GW',
'SMTP Backbone',
'SKECE1GW',
'SKBTSP01RTR001',
'API-I002-FHC',
'SHICE2GW',
'SHI-I006-OFFICE',
'SHI-I003-SERVRM',
'APILCE1GW',
'BKLSC1GW',
'SGTU-I011-B2F1C2',
'SER (Store Execution Reporting)',
'SEKCE3GW',
'APISC1GW',
'SAP-SM Change Request Management',
'APRO (AssignmentPro) Expatriate ',
'SAP-SD (Transportation) instance',
'APRO - EDE (Decommissioned)',
'ATH-I008-F2CR7',
'ATH-WC01',
'ATSPIP01SWS001',
'ATVIEP01RTR001',
'SGTU-I005-B2F1C2',
'BLIN-CC01',
'BLIN-I003-GEDV2',
'SAP Ariba - Production',
'PRCXQ-I306-B1F2R3',
'PRCXQ-I032-B3F210',
'PRCXQ-I019-B4F120-1',
'PRCTJCE3GW',
'POMSC1GW',
'POM-I055-HDLEGF',
'PLLODP01SWS001',
'PLLODP01SWA005',
'PLAWLO01SWC001',
'PKKARCE2GW',
'PHXCE02GW',
'PRCXQCE3GW',
'PHGOCE2GW',
'PHCCE3GW',
'PHC-WC01',
'PHC-I023-CADC',
'PHC-I007-SB2F',
'PEMASC1GW-1',
'PEGA E2E MD Platform',
'PABCCE4GW',
'BMASC1GW',
'BOGO-I015-6G',
'BOGO-I071-5ABK',
'ORDSC1GW',
'PHGOCE1GW',
'KBC-I001-ITROOM-1',
'PROSYS on the Cloud',
'BLOVCE1GW',
'SAC-I012-D401FE',
'Revenue Accounting',
'RUNMKP01SWA002',
'BLIN-M001-GEDV1',
'ROTCE1GW',
'RONASC1GW',
'RONA1GW',
'RONA-I001-IDFA',
'ROBUHP01WLC001',
'ROBUHP01SWA005-3',
'ROBUHP01RTR002',
'PRSJUP01RTR002',
'ROBUHP01RTR001',
'RGM-I014-B5F1RC',
'BLOV-I011-BCARE',
'RAKCE1GW',
'BLOV-I014-BLUE',
'Proficy Plant Application Servic',
'BLOV-I038-VLC',
'Platform Security',
'PingID',
'BLOV-I058-LAIC2',
'PUR-Easy Pricing',
'PTLISP01RTR001',
'RGM-I016-B5F0RE',
'K8A',
'BW SRCG (Sourcing)',
'JPYAUP02WLC001',
'FPSS-External Reporting Service',
'FASTMART Platform (Non-PROD)',
'CHPA-I016-B5F1R1',
'CHPASC1GW',
'CINSC3GW',
'CMED-I009-COM01',
'CMEDCE1GW',
'CNC-I111-B1F2R1',
'CNHAP-I037-SRVR2',
'EUSCE4GW',
'EUS-I076-ANLAGE',
'EUS-I050-8GCLC',
'EUS-I033-GITTER',
'EUS-I031-CSHOP',
'CNHAP-SRVR1',
'EUS-I023-MODUL1',
'EUR-Kazakhstan-ALMATY GO-4F-Alma',
'EUCHEC1SV',
'EUCHCE1GW',
'EUCH1GAWLC',
'EUCH-ST-DHCP-08-F',
'EUCH-ST-DHCP-07-F',
'EUCH-ST-DHCP-06-F',
'CHIGCE3GW',
'CFTI (Consumption Forecast & Tra',
'FRDIJP01RTR001',
'FRDIJP01SWC001',
'GKROCE1GW',
'GGELHN001',
'GGECE1GW',
'GGE-I021-B1F1R2',
'GEPDB: Global Equipment and Part',
'GENSC1GW',
'GEN-I060-R3Zon3',
'GEN-I040-TWRC25',
'GEN-I039-TWRC25',
'GEN-I015-TWRC03',
'CBOGCE3GW',
'EUCH-ST-DHCP-04-F',
'GBVENCE1GW',
'GBS-I028-APDO',
'GBHRTP01WLC001',
'GBCE2GW',
'GBCE1GW',
'GB-I120-SERVER-3',
'GADC-3PAR70435',
'G9P',
'CCURE9000',
'FireEye as a Service (FaaS)',
'Fiori',
'CFS - Customer Financials System',
'GBS-I111-IDFZ1',
'EUCH-ST-DHCP-02-F',
'EUCH-ST-DHCP-01-F',
'EUCH-I006-1',
'DIL-I006',
'DIL-I001-AE2',
'DIJE-M001-SW001',
'DEFRAP01RTR001',
'DEFAULT',
'DEDARP01SWA001',
'DEDARP01RTR001',
'CNSHVCE1GW',
'DBICE2GW',
'DAYLGVSA3',
'Credit Management Portal',
'DIL-I008-AE2 ',
'CNTC-I006-B1F2AD',
'CNTCSC1GW',
'CNWHDCSC1GW',
'COBCE4GW',
'COMPASS Production',
'Cloud Provisioning Automation Pr',
'CRA-I070-SRV253',
'CRGBS-I005-A1',
'CSDCSC1GW',
'CSD - C B2B eCommerce',
'CRS (Prod)',
'CRGOCE1GW',
'CNTC-I016-B3F2RDC',
'GO-I023-TEF01H',
'CNSHOSC1GW',
'DKCPHP01RTR001',
'EUCH-I002',
'ESMADP01RTR001',
'EDWM (EDW Mapping Tool)',
'CNPDGB01FTD001',
'Direct Shipment Data(B2B) SH Dir',
'Data Validation Module',
'Data Transformation Systems',
'Data Hubs',
'Data Adjustment',
'DYMC-WC01',
'DYMC-I026-Serv2',
'DILSC1GW',
'DYMC-I017-TE04E',
'DYMC-I009-TE03A',
'DVRSC1GW',
'DTCS Development',
'DST',
'DRDSC1GW',
'CNPDGB01SWB001',
'CNSBCE3GW',
'DNSServer',
'DLMCCE1GW',
'CNSHOCE1GW',
'DLMC-I010-SERV2',
'DYMC-I012-TCCS',
'SRAP Accounting',
'GO-I027-TEF03H',
'GO-I150-CTF01B',
'ITC-I142-HF2N32',
'ITC-I138-HF3N32',
'ISTCE2GW',
'ISOP',
'IRRT (Initiative Risk & Readines',
'Boomi- Retail Connect Walmart',
'IOPT GLOBAL (Prod)',
'IOPT GLOBAL (Dev)',
'Boomi-LAStore-SalesFactData',
'INHYDSC2GW',
'INHYDSC1GW',
'INGOIP01RTR001',
'INBOMP01RTR001',
'INBHI-WC01',
'INBADGW',
'INBAD-I010-B1F2RA',
'INAMDP01SWC001',
'INAMDP01RTR002 ',
'IMPSC1GW',
'IMP-I042-B1F0R1',
'IMP-I018-B1F1R8',
'IMP-I017-B1F1R7',
'IMP-I006-B1F0R2',
'ITC-I153-MN2F12',
'ITC-I154-MN3F12',
'ITC-I154-MN3F12-5',
'ITC-I158-MPRL2S',
'JPYAUP02SWS002',
'JPYAUP02SWA007',
'JPYAUP02SWA002',
'JPGO2SC1GW',
'JPGO2-WC01',
'JPGO2-I006-L09H01',
'JPGO2-I001-L08S01',
'JIJ-I012-DCENTER',
'JIJ-I002-Server',
'JEDGOCE3GW',
'Big Data Platform',
'IMP-I003-B1F0R2',
'Internet Explorer 11 - Productio',
'Innovation Record Management (fo',
'Infoblox DDI',
'Binder (aka iBinder 2)',
'Imperva-SecureSphere-GW-01',
'Imperva SecureSphere',
'Identity Digital Certificate Man',
'ITROMP01SWA006-7',
'ITROMP01RTR001',
'ITC-M001',
'ITC-I185-TSDC',
'ITC-I166-HF3N32',
'Integration Platforms for SAP',
'Boomi-MDM Chatbot',
'IDJKT-I002-B1F14',
'IDJKR-SRVR1',
'HCRC-I049-PL1B',
'HCRC-I048-PL1A',
'HCRC-I044-DV3A-2',
'HCRC-I037-DV1C',
'HCRC-I024-DS2B-2',
'HCRC-I023-DS2B',
'HCRC-I019-DS1C',
'HCRC-I004-CF1D',
'HCRC-I003-CF1C',
'HBP',
'Global PEA (Post Event Analytics',
'HCRC-I072-DS1C-2',
'Gigamon',
'GZGO-I016-L41H01',
'CAPE-WC01',
'CAS Data Cubes (Datamart) Produc',
'GTE',
'GTD',
'GSR-I217-SERVER',
'GSR-I197-MDF',
'GSDC-XP49073',
'GSDC-PURE0338',
'GSDB: Global Supplier Database (',
'GRDLIMS R2 Prod',
'CAPE-I093-I21DC',
'GO-I069-CTF08A',
'HCRC-I103-CF1-8211',
'Boomi-VMI IF Product Family Inte',
'IDF-ADE Prod',
'IDF',
'ICPOCCE1GW',
'ICPOC-I003-DC1',
'ICIASC1GW',
'ICIA-I082-WHSE',
'ICCE2GW',
'ICCE1GW',
'IC-I011-13-1',
'IBACE3GW',
'Hermes (MADS)',
'HCRC-I109-IVI-703',
'HYG-WC01',
'HYG-I037-B1AE07',
'HYG-I004-B1F1R2',
'HYG-CC02',
'HUBUDP01RTR001',
'HUBCE2VPN',
'HRZAGP01WLC001',
'HRSS SAP Platform Operations Too',
'HKZTWB01RTR002Â ',
'HKZTWB01RTR002',
'HKGSKCE1GW',
'Boomi-TFM MDM subscriber Prosys',
'APCHEACE1GW',
'NOV-I017-B76F2F',
'CRM-Pampers Pro (US)',
'VCR-PRVT-EUR-UK-COBALT PARK GO-3',
'AMI-I066-SERVER',
'VCR-PRVT-EUR-SUI-GENEVA-F4-E-Dav',
'VCR-PRVT-EUR-SUI-GENEVA-F2-W-Mor',
'T&W BI FP Ground NA Prod',
'VCR-PRVT-EUR-SUI-GENEVA GBC-Mobi',
'VCR-PRVT-EUR-SUI-GENEVA GBC-F-1-',
'VCR-PRVT-EUR-Poland-WARSAW PSC-4',
'VCR-PRVT-EUR-Germany-SCHWALBACH-',
'VCR-PRVT-EUR-France-PARIS GO-2F-',
'VCR-PRVT-APAC-Japan-TOKYO OFFICE',
'VCR-PRVT-APAC-Japan-KOBE GO IC-7',
'VCR-NA-USA-WHBC-B6280-3F-C362-Ca',
'TAK-I012-LIQABG',
'AMI-I068-KHEOPS',
'VCR-NA-USA-Mehoopany-1F-B32-Fami',
'VCR-NA-Puerto Rico-SAN JUAN GO-6',
'VCR-GC-Taiwan-TAIWAN GO-7F-A01 T',
'VCR-GC-Hong Kong-HKGO-6F-Harbour',
'TAK-I028-SRVR02',
'VCR-GC-China-SHANGHAI SO-40F-Col',
'VCR-GC-China-GUANGZHOU-GT4-PSC-9',
'AMI-I061-S4F0',
'VCR-GC-China-GUANGZHOU-GT4-16F-1',
'VCR-EXEC-AMA-Singapore-SGO-18F-M',
'VCR-EUR-Ukraine-KIEV GO-3F-Board',
'ALX-I211-IDFH',
'AMI-I040-UNIDOS-1',
'TDCCE2GW',
'VCR-EUR-UK-READING PLANT IC-GF-G',
'VCR-NA-USA-MINNEAPOLIS SO CBC-40',
'VCR-PRVT-NA-USA-MASON BC-CF-3F-6',
'VGUACE2GW',
'VZGO-I012-FLOOR6',
'ADW7T',
'AKA-I012-PRJHSE',
'WebCenter - Freeflow',
'AMICE4GW',
'AKA-I017-MEETRM',
'AKACE1GW',
'SiteMinder',
'WLDSC2GW',
'WLD-WC01',
'Sitescope',
'ALOHA',
'WLD-I035-DRK',
'WLD-I020-F2',
'Solarwinds (DXC) PROD',
'WH-I077-BB3N5D',
'WH-I072-BB4S2A',
'WH-I060-FW3N31',
'Visualization Solution',
'ALT-WC01',
'ALT-I014-h1',
'WAR-I001-MOB',
'USCUEP01RTR001',
'WAR-I010-MOB',
'VCR-EUR-UK-READING PLANT IC-1F-1',
'WCMC-I001-TE01E',
'WDCSC1GW',
'WH-I011-FE2E19',
'WH-I016-BAN216',
'WH-I031-PDFEQP',
'WH-I033-FC1C14',
'WH-I054-FW4C17',
'WDCCE4GW',
'VCR-EUR-UK-NEWCASTLE IC-1F-Irthi',
'VCR-EUR-UK-COBALT PARK GO-GF-Pao',
'VCR-EUR-Turkey-ISTANBUL GO-MF-Pa',
'VCR-EUR-Hungary-BUDAPEST GO-6F-D',
'VCR-EUR-Hungary-BUDAPEST GO-6F-B',
'VCR-EUR-Greece-ATHENS GO-2F-Cap-',
'VCR-EUR-Germany-EUSKIRCHEN-EngrB',
'VCR-EUR-France-PARIS GO-3F-C03-L',
'VCR-EUR-France-AMIENS Plant-Admi',
'VCR-EUR-Finland-ESPOO GO-3F-Inar',
'VCR-EUR-Croatia-ZAGREB GO-GF-Big',
'VCR-EUR-Belgium-BRUSSELS BIC-GF-',
'VCR-EUR-Azerbaijan-BAKU SO-4F-CR',
'VCR-APAC-Japan-KOBE GO IC-9F-Tsu',
'VCR-APAC-Japan-KOBE GO IC-6F-N03',
'VCR-APAC-Japan-KOBE GO IC-10F-N0',
'Transportation Forecasting',
'VCR-AMA-India-MUMBAI GO-3F-Board',
'VCR-AMA-India-MUMBAI GO-2F-Cap-1',
'Unemployment - Employment Verifi',
'USEDPP01RTR001',
'USBOIP01RTR001',
'USBNTP01WLC001',
'USBNTP01RTR001',
'USFAYP01SWA005',
'USGRRP01RTR001',
'VCR-EUR-Israel-TEL AVIV GO-2F-To',
'USSEAP01RTR001',
'UTBE-I015-TE72-1',
'ALX-I213-FRCON1-1',
'UTBE-I040-B41F1',
'ALX-I224-ASRSNW',
'UTBE-I043-B74F1',
'USXEZP01SWS001',
'Webhosting',
'TS-I053-SERVER',
'VCR-EUR-Italy-ROME GO-3F-M3W01-C',
'VCR-EUR-Sweden-STOCKHOLM GO-3F-T',
'TF Prod',
'VCR-EUR-Spain-MADRID GO-3F-Valen',
'VCR-EUR-Spain-MADRID GO-2F-Porto',
'VCR-EUR-Slovakia-BRATISLAVA SO-5',
'VCR-EUR-Serbia-BELGRADE GO-1F-53',
'VCR-EUR-SUI-GENEVA GBC-F4-C-Base',
'AMI-I030-PAC2E2-2',
'VCR-EUR-SUI-GENEVA GBC-F3-W-Morg',
'VCR-EUR-SUI-GENEVA GBC-F3-E-St G',
'VCR-EUR-SUI-GENEVA GBC-F1-C-Base',
'VCR-EUR-SUI-GENEVA GBC-F0-W-Bern',
'VCR-EUR-SUI-GENEVA GBC-F-1 2 Col',
'VCR-EUR-SUI-GENEVA GBC-F-1 18 Ma',
'VCR-EUR-SUI-GENEVA GBC-F-1 16 Ma',
'VCR-EUR-SUI-GENEVA GBC-F-1 15 Ma',
'AMI-I014-DCSYS',
'VCR-EUR-Italy-ROME GO-4F-M4W01-C',
'TS-I004-100-3',
'VCR-EUR-Poland-WARSAW GO CUBE-GF',
'TS-I002-SERVER',
'VCR-EUR-Poland-WARSAW GO-1F-BUSI',
'VCR-EUR-Poland-WARSAW PSC-5F-Pol',
'TS-I044-700-12',
'AMDB',
'AMI-A179',
'VCR-EUR-Russian Fed-MOSCOW GO-2F',
'VCR-EUR-Russian Fed-MOSCOW GO-5F',
'VCR-EUR-SUI-GENEVA GBC-F-1 12 Ma',
'VCR-EUR-SUI-GENEVA GBC-F-1 13 Ma',
'VCR-EUR-SUI-GENEVA GBC-F-1 14 Ma',
'VCR-EUR-Portugal-LISBON GO-3F-Fo',
'ADW4P',
'USCHIB01RTR001',
'Security',
'adlg3827',
'SWA-I012-TEC1L4',
'adlg3825',
'adln5756',
'adlg3824',
'SWA-I019-STCE01',
'SWA-I009-TEC1L1',
'adlg3610',
'adlg3841',
'adlg3926',
'ABN-I031-LINE61',
'adln2621',
'SWA-I021-STCE03',
'SWA-I028-STCE04',
'adlg3916',
'adlg3828',
'adln5439',
'adlg3857',
'adln5732',
'adlg3840',
'adlg3843',
'adln5737',
'adlg3846-zl1',
'Segmentation Translation Engine',
'adlg3847',
'adln5690',
'adlg3848',
'adlg3850',
'adlg3853',
'adln5741',
'adlg3839',
'adln5744',
'adlg3838',
'STL-I016-TE61-1',
'adlg3600',
'adlg3923',
'STL-I013-TE82-5',
'Schedulin on Exalytics (PROD)',
'adlg3968',
'adln9290',
'ZAGGCE1GW',
'APCH-I002',
'APCH-I006-1',
'abn-esx004',
'adlg8204',
'adln9241',
'ABN-I050-PEARL',
'adlg3957',
'AP-Singapore-SGO-Metropolis-18F-',
'adlg8203',
'adln9306',
'AP-Indonesia-JAKARTA GO-Jakarta ',
'ACA',
'adlg8269',
'adln9240',
'adhn5641',
'gillette.hu/hu-hu_33009',
'aka-vgw001',
'LAGNCE1GW',
'pqlx4',
'DLMC-WC01',
'BW EC (Expense Control)',
'herbalessences.com/en-us_33086',
'DLMCSC1GW',
'Datalliance VMI (Vendor Managed ',
'gillette.es/es-es_33006',
'Digital Signals',
'adln5665',
'bdc-intra1240',
'golx1',
'pllx4',
'gsdc-siebel013',
'adln2400',
'LDZ-I011-LMCBX',
'CNPDGB01RTR005',
'DTC eStore - Consumer Shop',
'adlg8243',
'adln2753',
'LM-I192-PFMIXRM',
'DRDCE1GW',
'Data Direct Solution',
'LMCON-I192-PFMIXRM',
'skertcisesx2',
'VCR-EUR-SUI-GENEVA GBC-F0-E-Sion',
'VCR-EUR-Poland-WARSAW GO-1F-Agry',
'LON-I013-H2C2',
'pillx4',
'adln2612',
'VCR-EUR-SUI-GENEVA GBC-F2-W-St G',
'LON-I035-H15C1',
'CNSGSC1GW',
'gillette.co.in/en-in_33010',
'mil-quantum001',
'ggo-safcl001',
'Mac laptop - Instance',
'gadc-siebel111',
'Material Costs Analysis (TDC)',
'BRSERSC1GW',
'adln6740',
'BRSER-I012-CONST',
'BRICSC1GW',
'Microsoft Project',
'UTBESC1GW',
'BOSGCE3GW',
'BOSG-I055-SERVR3',
'bdc-rtcedge04',
'prga-sis-srx-euh-04',
'NACH-I004',
'adln9261',
'Consumer 360 Insights',
'bdc-rtcpocse1',
'USZDCP01RTR001',
'CORIO-WC01',
'USWASP01RTR001',
'Cloud Launchpad',
'CRA-I015-CPM253-3',
'adln9300',
'CVT (Chemical Volume Tracking) /',
'NACHBE-TMSXE1-4',
'USFAYP01RTR001',
'NACHEC1SV',
'xqlx3',
'gadc-intra664',
'MYPGS - Compensation & Benefits',
'CNSNYP01RTR001',
'MXMILSC1GW',
'gadc-sqlp013',
'ggo-pbxaas001',
'MANSC1GW',
'DIL-I005-AE2',
'MEC-I047-BRLIN45',
'MEP (Market Estimates and Projec',
'VCR-EUR-Germany-SCHWALBACH-S02-F',
'wee-pbxaas001',
'gbs-esx001',
'KRO-M001-U',
'VCR-EUR-Germany-SCHWALBACH-S01-A',
'gblx.rtcis1',
'MHF-I042-B1F1RD',
'MHF-I044-B1F0RJ',
'spb-esx003',
'MAN-WC01',
'gadc-winautop01',
'DEDARP01SWC001',
'MICDSC1GW',
'bdc-lccs600',
'VCR-EUR-Denmark-COPENHAGEN GO GF',
'adln5747',
'MOSC1GW',
'adln5755',
'MSE Corporate Reporting',
'MXHXCP01RTR001',
'MXHXCP01SWA001',
'adln6719',
'gadc-sqman001',
'adln6720',
'webforge-zl1',
'prga-sis-ltm-nah-01',
'MHF-I026-B1F1RC',
'hyg-mesdatabc',
'Direct Shipment Data (B2B)',
'sdlg3862',
'HCRC-I058-SB4B',
'HCRC-I086-DV1B',
'mailprov',
'ALT-I001-a2',
'HCRCSC1GW',
'Boomi-TFM MDM subscriber-Echelon',
'mtep-esx001',
'lvlx.rtcis',
'FSS Invoice Integration',
'lulx5',
'lulx4',
'WH-I059-FW3N31',
'WLD-I022-H1B',
'HUGPCE2GW',
'FCP',
'Boomi-Solvoyo Cloud-DPI',
'IBA-I019-IDF',
'IBASC1GW',
'Boomi-PLOG',
'adlg3837',
'naclsc1gw',
'WDC-I044-SERV3',
'WCMC-I023-Serv2',
'limlg99',
'Executive Insights Daily NOS Pro',
'ldz-serena',
'HYG-CC01',
'Evaluate',
'sg-wfs001',
'WLD-I036-U1',
'ADW Platform',
'Wireless Local Area Network (WLA',
'mil-esx001',
'GIST',
'CBI (Customization BI)',
'mklg1',
'GO-I028-TEF03H',
'GO-WC01',
'GOSC1GW',
'GSAW2-I180-G',
'anp-pbxava001',
'GSDC-3PAR3018',
'mnlg9',
'manlx2',
'sdln9215',
'Wazuh Endpoint Agent',
'meclx2',
'GBSC1GW',
'sdln6689',
'mdclx6',
'GZGO-WC01',
'mcbc2gwv',
'GZGOCE2GW',
'GBADSC1GW',
'HCRC-I002-CF1A',
'HCRC-I015-CF3D-2',
'HCRC-I017-DS1A',
'adlg2999',
'WebCast',
'CMED-I014-PROD',
'sgo-safcl001',
'sdciptcmpub001',
'always.com/en-us_32800',
'Internal Management Reporting',
'adlg3896',
'igm-pbxaas001',
'shi-vgw001',
'EUCH-ST-DHCP-03-F',
'VCR-GC-China-BEIJING IC-2F-2.190',
'JIJ-WC01',
'VCR-GC-China-BEIJING GO-6F-BJCBD',
'VCR-EXEC-EUR-SUI-GENEVA-F2-W-24-',
'bcru-esx001',
'JPTAKF-I008-MACRM',
'VCR-EXEC-AMA-Singapore-SGO-21F-C',
'balx8',
'EUCH-I005',
'ESMADP02RTR001',
'GEN-I042-TWRD26',
'sblx4',
'CNLGCE1GW',
'KBC-I004-ITROOM-4',
'wee-vae001',
'sac-vgw001',
'EDCI1FW',
'rot-pbxaas001',
'adlg3991',
'hyd-esx004',
'KP-I010-B7R11',
'EC2AMAZ-CKI1M9M',
'welegadbqa-zw01',
'ALX-I209-AMB1',
'nwb-mestrnhc',
'iolx2',
'azl-enop06',
'Enterprise Directory  - QA',
'nemc-esx001',
'kro-wfs001',
'kro-pbxaas001',
'Enterprise Data Dictionary',
'INBAD-I002-B1F0R1',
'INBAD-I016-B1F111',
'VPL-I051-B1F0R5',
'VPL-I021-B1F0R2',
'INGOCE3GW',
'INHYDCE1GW',
'kc-esx004',
'CNHAP-I001-MAIN',
'newlx3',
'Employee Data Extract Request',
'Echelon (PROD)',
'VCR-PRVT-EUR-SUI-GENEVA-F0-E-Vev',
'EUS-I057-LEHRWE',
'ITC-I146-HMSLF9',
'ITC-I149-MS2E10',
'novlg2',
'VCR-PRVT-AMA-Philippines-MANILA-',
'CNHAPCE3GW',
'Boomi Veeva CRM EU SAP Interface',
'EUS-I028-HALLE1',
'adlg3861',
'Boomi - CRM POH EMEA integration',
'Boomi - BrandStore Integrations',
'KRO-I046-HC',
'WAR-I008-MOB',
'APCHEC1SV',
'PRCXQSC1GW',
'gadc-bnkgsmrt01',
'T&W BI FP Ground ASIA',
'ORCA',
'Personal computer',
'bdc-vgw012',
'OX-I002-SERVER',
'eulg1',
'AVM-WC01',
'BMA-I004-DC1CR1',
'eus-adicom001',
'ALXSC1GW',
'bdln2826',
'TPM-Iberia/UK',
'RGMSC1GW',
'TAI-I031-B1F7R3',
'Onapsis Security Platform',
'PLC-Product Life Cycle Automatio',
'SUA',
'BLIN-I051-SFNET',
'BKL-I032-B1F1R3',
'Time & Attendance',
'AY-I222-DL-2',
'takalicssw001-1',
'bhlx4',
'bdlg3396',
'BLOV-WC01',
'BLINSC1GW',
'SAP Master Data',
'SHICE1GW',
'BIC-I019-B1',
'SalesFactData',
'bdlg2533',
'tsp-stewcs03',
'AY-I209-IDF-65',
'Onapsis-Console',
'Skybox - Ashburn',
'SGCLEB01RTR001',
'TS-I019-400-9',
'cdlx2',
'PG Tube',
'TAK-I027-SRVR01',
'SAP-ERP (Treasury Banking)',
'TAK-I014-BWARE',
'SGGO-I006-L20S02',
'Oracle BI on Exalytics (UAT BDL2',
'BMA-I037-Molding',
'BMA-I013-SENSR7',
'dentureliving.com/en-us_32994',
'Active Control (Transport Expres',
'tsp-mesapphhc',
'AXON ADW6P NON-CBP',
'vbq-tapemm001',
'fnmp005-zw2',
'eus-pbxaas001',
'talx4',
'One Health TrackWise GSH (GTrack',
'BDC-3PAR4105',
'TS-I001-USER',
'Ping Access',
'BDC-XP53270',
'daylg7',
'PHCSC1GW',
'TAK-I011-LIQABG',
'usalspgra011',
'RGM-I005-B7F0R3',
'bell-famsql01n',
'TAKSSC1GW',
'BDCC1GW',
'AOV-Advanced Order Visibility',
'cgo-pbxava101pr',
'beu-esx001',
'SHI-I002-SERVRM',
'Network Management Operations',
'bdc-sqlpfp002',
'cnt-pbxaas001',
'BMA-I002-SERVCR2',
'prga-sis-srx-tak-01',
'PQASC1GW',
'UDW (Unstructured Data Warehouse',
'PRCXQ-I001-B1F2R1',
'Trigger NG (Prod)',
'NOV-I072-B75F3B',
'SAC-I002-B40-D',
'bdu01a2c',
'NOV-WC01',
'NOVCE3GW',
'usahadspgco200',
'BLIN-I050-SFNET',
'tclx4',
'bdhp4176',
'blov-sql004',
'gadc-inetdbq01',
'gadc-iamsql01',
'gadc-glbtp001',
'NAUPCE3GW',
'SAP Core Purchasing SAP-MM-PUR -',
'THPSC1GW',
'telx4',
'eQMS Cloud',
'NEMC-M001-MDF',
'TIBCO BW PROD Instance',
'bdlg3443',
'brdlx2',
'NGLG-I006-SERVER',
'brg-safcl001',
'bdln9257',
'usahadspgco300',
'NOVLHN001',
'SAP-AR - F6P',
'cxc1-ldapprd002',
'gadc-easwgp01',
'tak-rtt002',
'BLOVSC1GW',
'SH - Chemicals Shipments Reporti',
'blov-mesdtabc',
'ALX-I232-DIST',
'SH - MDO Shipments Reporting',
'bru-rtcedge01',
'gadc-easfa01',
'PMAT',
'PLOG US&UK',
'cape-mesdatafc',
'gadc-dmsprod',
'Shipment Planning',
'bdw01a2e02',
'Requirements Management (MBD)',
'BDP-I022-IDF01',
'gadc-easwgp02',
'eMail',
'Security Information Event Manag',
'ATVIEP01SWA001',
'SWA-I011-TEC1L3',
'RetailX Smart Selling APAC-IMEA',
'BELLCE1GW',
'SAP-IM EMEA SC (F6P)',
'KHP',
'polx3',
'Price Workflow',
'GZP',
'shlg2',
'GSDB: Global Supplier Database',
'phm-pbxaas001',
'DLMC-I001-SERV1',
'BLOV-I057-LAIC1',
'JIJSC1GW',
'Perfume Initiative Execution (PI',
'SGTUCE1GW',
'DMT--HL',
'eCARM â€“ TRIM',
'KHP 2',
'ABN-I044-G2',
'agizbakimuzmani.com/tr-tr_41166',
'iclx2',
'KDP',
'SAP-PI-Customer EDI (Dev)',
'PSSS & TO - Order Management IT',
'CAPE-I040-I41B1',
'CNSGCE3GW',
'ServiceNow - ITSolutions',
'ALTSC1GW',
'DS Agent Prod',
'Resource Scheduler',
'lvlx3',
'HGD',
'IMP-I027-B1F1I1',
'bdlg3415',
'krln1001',
'crest.com/en-us_32912',
'ESD3SWS [Prod]',
'VPLCE3GW',
'IMS (Innovation Management Syste',
'thlx2',
'WLD-I003-SERV2',
'Boomi-LIMS',
'AUGOCE1GW',
'IMP-M001-B1F1R7',
'Supplier Portal - Base and Admin',
'CNPDGB01GWC001',
'Boomi-Order Acquisition POH (Pro',
'AMICE3GW',
'circuit--hl',
'lonlg1',
'SAP BW - Shared Master Data',
'lonlg9',
'WH-I066-FE1C19',
'IBP Integrated Business Planning',
'Storage Optimization: eCARM HA',
'WERCS',
'oralb.nl/nl-nl_33187',
'avm-poputil001',
'HKGOCE1GW',
'WCMC-I008-TE05E',
'Boomi-TFM MDM subscriber Optima ',
'S4 (Prod)',
'HCRC-I080-K1PT1',
'ahmlx6',
'WLD-I009-A1A',
'AUNRYSC1GW',
'badlx1',
'daylg6',
'adln2620',
'ITCSC1GW',
'jelx4',
'SAP IT Security Services',
'THACE3GW',
'AVMCE2GW',
'DXC Operational Analytics',
'Boomi - MEGA to RITA Integration',
'SG-3PAR3186',
'DTCS Operations',
'TAK-I026-SVRRM',
'AVMSC1GW',
'dbi-pbxaas001',
'TAICE3GW',
'daycrnesx1',
'BIC-I059-Q1',
'VPL-I002-BL02F1',
'CNPDGB01RTR003',
'Supplier Portal - Material Plann',
'BLO-I022-SB11',
'azw-cnfg-vm02',
'VCR-PRVT-GC-China-GUANGZHOU-GT4-',
'Boomi-Capture and Validation',
'SAP Freight Cost Documents - Pro',
'SZDC-I003-CR1',
'IRA/IPP Administration',
'rneg-esx001',
'HCRC-I027-DS2D',
'AMI-I065-SERVER',
'IST (Integrated Security Tool)',
'shalx1',
'adlg3954',
'alp-pbxava001',
'DERWSP01SWA001',
'bdc-iptsmpub001',
'CCDQ (Customer Centric Data Qual',
'MOS-WC01',
'gadc-cfm004',
'MOSCE1GW',
'MOSCE2GW',
'OMP+',
'VCR-EUR-Belgium-BRUSSELS BIC-1F-',
'MPSC1GW',
'bel-pbxava001',
'OCT6SC1GW',
'Tibco-BW',
'gadc-swinds001',
'bdc-vaesys001',
'Numerify Cloud Analytics',
'ABN-I046-SERVR3',
'adln9275',
'adlg3846',
'MMISC1GW',
'MMICE01GW',
'GBRDNP01RTR001',
'MHF-I034-IDF1',
'BRTC-WC01',
'MHF-I035-IDF2',
'adhn4801',
'mp-mesdtafc',
'PRCXQCE4GW',
'B2G Cygnet (Decommissioned)',
'gadcdistgw',
'GBADCE1GW',
'ami-pbxaas001',
'gadc-wmdgsqlp01',
'ORDER',
'GB-I018-MDF',
'COBSC1GW',
'VCR-EUR-Czech Rep-PRAGUE GO-4F-C',
'Nexus LIMS',
'VCR-AMA-Thailand-BANGKOK GO-20F-',
'NACH-I002',
'NOV-I016-B1F2I',
'sdhn5389',
'us.braun.com/en-us_32882',
'NACH-ST-DHCP-03-F',
'NACH-ST-DHCP-04-F',
'bdln2519',
'nalx3',
'adln9307',
'NACHBE-TMS1-3SV',
'CMED-I012-ADM01',
'NEMC-I010-TE03D',
'BOR-I071-B5F1R7',
'Expat Tax Email Reminder (ETER)',
'NACLEACE1GW',
'braun.ru/ru-ru_32874',
'BORSC1GW',
'ami-alps001',
'BRDC-I104-TC-G',
'MXMIL-C015',
'bdc-pbxava011',
'bdln9114',
'bdc-v6esx511',
'Maple Application',
'Cloud Active Directory Prod',
'BRTC-I131-CP-A',
'MHF-I025-B1F1RC',
'braun.be/nl-be_32852',
'B2G Acepta',
'bdln2517',
'Travel Management',
'CRA-I066-L41',
'BRK-I024-SwWet',
'gadc-oorchpdb01',
'CRGBSCE1GW',
'McAfee AV',
'gbs-pbxava01',
'WH-I040-BB2S83',
'cailx5',
'ACP',
'PLM PickList Manager',
'L7P',
'LON-I050-HUB24',
'WorkFusion Automation - TCO',
'bdc-intra112',
'VCR-EUR-Netherlands-ROTTERDAM GO',
'TIBCO-BWAS',
'BEL-I058-B21S',
'eus-esx001',
'eulg3',
'cai-esx001',
'etlx1999',
'LM-I061-OFFICE',
'DBI-I011-B1F1R1',
'ADW6T',
'bdln2726',
'MHF-I006-B1G1R2',
'novlx2',
'GO-I080-CTF11C',
'PLLODP01SWA007',
'BUDGOCE1GW',
'prga-sis-srx-AMI-01',
'DEFRAB01RTR001',
'SUA Production - Instance',
'bdln2399',
'GO-I077-CTF10C',
'headandshoulders.de/de-de_33032',
'PPM (ProductNet->PLM Interface)',
'headandshoulders.com/en-us_33061',
'MEC-WC01',
'tablg3',
'MHF-CC01',
'MEQSC1GW',
'hugp-esx001',
'gelx4',
'anlx6',
'MEQ-I011-SERVER',
'ami-sql003',
'KRGOCE3GW',
'MEC-I048-SERVER',
'TSSC1GW',
'BW GL (General Ledger)',
'VCR-EUR-Germany-SCHWALBACH-S03-F',
'bdhm',
'ServiceNow',
'MEC-I024-7F2C14',
'mkh2',
'GDC Global Data Client (G11)',
'STLCE3GW',
'Customer Dashboard Pharma',
'merlx2',
'usalspg17001',
'merlx3',
'gillette.ca/fr-ca_33002',
'CASTORO',
'chdlx1',
'EGFE-I004-FLR4',
'FVP',
'HXP',
'melx2',
'bdln2518',
'urlx4',
'cailx8',
'ENOVIA Exalead',
'CATIA Client',
'SAP-PI',
'Adobe Creative Suite',
'SAP-SCM-gATP - GVP',
'ablx3',
'usalspg11001',
'Global Payroll',
'SAP Freight Cost Documents',
'bos-pbxava001',
'mkh1',
'mnlg1',
'sdln9220',
'Social Security Tax',
'C&F Reporting Tool',
'WLD-I037-V1',
'ade12-exadata',
'wmgxsqlp01-zw1',
'BDC-3PAR3437',
'WLD-I044-WF1',
'EUS-WC01',
'matlx6',
'BIC-I016-A0',
'EUSCE3GW',
'BICSC3GW',
'Employee Data Management',
'WWMD (PROD)',
'lvlx2',
'adlg3893',
'cgp-pbxava001',
'atlcrnesx1',
'GEP',
'mpp-pbxava001',
'cailx6',
'EUSSC1GW',
'WHGW',
'caslx1',
'Forecast Mix',
'AY-I169-IDF-14',
'olay.co.uk/en-gb_33148',
'ServiceNow - HR Payroll Manageme',
'Excel & Uploads',
'lolx1',
'gillette.jp/ja-jp_33012',
'eus-mesdata1',
'relx4',
'PLLODP01SWA004',
'gsdcdistgw',
'belx4',
'aeclx1',
'entsr-zw011',
'A7P',
'skelg1',
'aelg2',
'EGFE-I003-FLR3',
'THPD-M030-SRVR',
'sk-ii.com.au/en/index.aspx_3152',
'KNIME Server on Azure NAS',
'prch-esx001',
'eManufacturing-Newton',
'KBCCE1GW',
'sjc-safcl001',
'PUR-Atlas',
'bhlx1',
'JPTOCE1GW',
'Performance Management',
'SGTU-I001-B1F2C1',
'Pool Tool',
'taklx4',
'DRDCE2GW',
'PHC-I038-LQD',
'LONSC1GW',
'BTC-WC01',
'TS-WC01',
'NEMC-I011-SERV1',
'adln9316',
'USORLP01RTR001',
'CSBGOCE1GW',
'gadc-esq002',
'BOSGSC1GW',
'Microsoft Office',
'API Management Platform PROD',
'VCR-AMA-Malaysia-KUALA LUMPUR GO',
'Claims Manager',
'gadc-eassql01',
'Managed Print',
'Mac laptop',
'Inventory Insights',
'MXMIL-I011',
'MP-I060-75-1',
'VCR-EUR-Belgium-BRUSSELS IC GF M',
'OXSC1GW',
'gadc-wpi001',
'COBCE3GW',
'BOGO-I049-2L',
'VCR-EUR-Germany-KRONBERG PLANT I',
'Core Data Hub - NA',
'Optima Promo Planning tool (PPT)',
'tablg1',
'adln9254',
'ralx4',
'CyberArk',
'MPI - My Personal Information (E',
'defraiptsmsub001',
'helpdesk',
'daylg1',
'SAP - BW CheckMate [GRP] DB',
'lma-pbxava01',
'dalcrnesx1',
'Reform',
'crulx3',
'Boomi â€“ DTC Outbound Catalog and',
'oxp-pbxava001',
'bkl-pbxaas001',
'ATSPIP01SWC001',
'dallg1',
'ASNCE2GW',
'SAP-SD (Shipping) - A6P',
'Symposia City',
'pampers.com/en-us_33259',
'Boomi â€“ DTC Outbound Email',
'EDC-3PAR8077',
'dallg3',
'HYG-I042-B2SRV',
'infoPaGe Direct Shipment Reporti',
'RBW Project Dashboard',
'HYGCE3GW',
'aka-esx001',
'aylx4',
'VPL-I116-B1F0R1',
'shalx5',
'Pulse Secure (Prod)',
'imp-pbxaas001',
'Database Services',
'daylg4',
'APSA - Annual Plant Standard Aut',
'OMP+ APS FHC5-PROD',
'tablg6',
'bllx2',
'BRTCSC1GW',
'vpl-cdr001',
'laglx2',
'GBS-I001-SERVER',
'MEC-I040-9F1C19',
'MHF-I012-B1F0R5',
'SKU Complexity',
'ABNSC1GW',
'Demand Planning Reporting',
'Google Chrome',
'mplx3',
'nov-mesdtabc',
'NCP',
'sglx1',
'alx-pbxava001',
'brclx4',
'bdc-sbc01',
'lmlx1',
'NLAMSB01RTR001',
'APCH-ST-DHCP-05-F',
'APCH-ST-DHCP-03-P',
'usahadfpgco001',
'NOV-I084-B75F3B',
'Centrify Infrastructure Services',
'Microsoft Lync',
'BRSERCE1GW',
'NPI portal',
'Finance MDM',
'EGFECE1GW',
'chdlx3',
'MAP (Market Analysis Platform a.',
'WH-I013-FE2E19',
'tha-safcl001',
'gadc-sqman002',
'3PLConnect',
'oralb.pl/pl-pl_41165',
'fixodent.co.uk/en-gb_32993',
'gillette.co.uk/en-gb_33020',
'TSCE1GW',
'merlx5',
'AY-I150-SERVR2',
'VCR-PRVT-EUR-SUI-GENEVA-F4-W-Mor',
'HCRC-I036-DV1B',
'gillette.ca/en-ca_33001',
'marlx1',
'tilx3',
'EUS-I013-EERAUM',
'eFC (Electronic Formula Card)',
'adlg3869',
'talx6',
'meclx1',
'AMI-I044-PAC5OS',
'wfgovern-zl01',
'wolx1',
'jiclx3',
'JPTAKFSC1GW',
'GZGOCE1GW',
'tor-pbxava01',
'atllg3',
'C3DB',
'usalspgsa438',
'skelg5',
'gadc-icsprd001',
'tampax.co.uk/en-gb_33351',
'eulg2',
'INBAD-I015-B1F111',
'HCRC-I082-K2PT3',
'BELL-I092-B25MC',
'bdcdistgw',
'LMSC1GW',
'malx4',
'GEN-I038-TWRB24',
'PLLODP01SWA006',
'Webcenter SaaS',
'IMP-I047-NSTGF',
'LDZ-I018-LMCPC3',
'LDS (Longterm Demand Sensing) PR',
'azl-shrorape01',
'bdc-extra155',
'EUS-I046-7ERAUM',
'prga-sis-srx-euh-03',
'brclx3',
'DPF (Data Processing Framework)',
'polx2',
'AY-I150-SERVR1',
'EUCHEACE1GW',
'SAP-SD (Order Management) - F6P',
'SPA (Spend Pool Analysis)',
'SH - CFR Root Causing Tool',
'newlx2',
'ARGUS',
'SLS (Smart Learning System)',
'usqasb02swc001',
'blov-esx001',
'Security Weaver',
'EDC-3PAR8069',
'aelx1',
'Direct Tax & Local GAAP',
'Enterprise Directory  - PROD',
'CNHAPSC1GW',
'LDZ-I012-LMCBOA',
'Expat Tax Settlement (ETS)',
'melx1',
'SAP Single Sign On (Single User ',
'gzlx6',
'C3DB (Production)',
'emclg4',
'emclg3',
'eis001-zw1',
'celg2',
'hydlx3',
'SAP EnableNow',
'BW PROC (Procurement)',
'thlx1',
'JPYAUP02SWC001',
'JPYAUP02SWA008',
'PeopleFinder',
'axlg99',
'kalx2',
'ALT-I021-M1',
'balx5',
'bdln2641',
'Pulse Secure (VPN.pg.com) - **fo',
'Integrated Security Tool',
'LDZ-I014-LMCBOC',
'Prod',
'IBA (Intelligent Business Alerts',
'tclx6',
'HYGSC1GW',
'aylx3',
'SAP Basis',
'SAP Build Services',
'dolx5',
'LDZSC1GW',
'INAMDP01SWS002',
'ADZ11-ADZ12',
'Azure API Management',
'Material Master Automation (MMA)',
'adlg3817',
'Microsoft Teams',
'MHF-I028-B1F1RD',
'mvlg3',
'AMA Hub Application Blueprint 2',
'NLAMSB01RTR002',
'NOVSC1GW',
'MECSC1GW',
'Artios CAD',
'PASS',
'mnlg5',
'USXDCD01FWL01',
'PLLODP01SWA002',
'NACHBE-CUCMP-1SV',
'NEMCSC1GW',
'bdln2465',
'cailx3',
'VALP-I001-VALDC',
'SAP-BW (Global)',
'Internet Explorer',
'shalx3',
'Indirect Tax Compliance',
'ahmlx5',
'DPF Application (EDW MM)',
'CRASC1GW',
'badlx3',
'INBADSC1GW',
'USABNB01RTR001',
'jplx3',
'phlx3',
'MSA Expense Management',
'Citrix PG VirtualApp  (productio',
'belx3',
'sntlx2',
'bdln9267',
'xqlx1',
'DAT-AOV (Advanced Order Visibili',
'D4P',
'adlg8225',
'Cyber Defense Operations',
'adln5723',
'bdc-iptcbsaf001',
'eCARM - KGS',
'K5P',
'JPYAUP02SWS003',
'qulx4',
'bhlx3',
'pillx3',
'sylx1',
'PLLODP01SWA003',
'VCR-AMA-Singapore-SGIC-Biopolis-',
'bclx1',
'xqlx6',
'Purchased Materials Automation (',
'INAMDP01SWS001',
'C360 Data Platform',
'cdlx1',
'SAP ERP Financials - SRA',
'WLD-I019-F1',
'novlx1',
'lvlx1',
'sblx3',
'lulx3',
'rnlx2',
'oralb.fr/fr-fr_33178',
'adhn4913',
'tclx3',
'CEO Award',
'braun.de/de-de_32859',
'GBS-I046-SERVER',
'mxo-cmecube001',
'Audit',
'IDF (Prod)',
'Datalliance AP (Prod)',
'Endpoint Threat Management',
'IDFP',
'Award Payment Preferences',
'FPP',
'calx3',
'GPDB: Global Product Database (P',
'EUCHSC1GW',
'BRTC-I134-CP-B',
'UNIX--HL',
'SAP Payroll Control Center',
'SH - RCT (Rapid Correction Tool)',
'SH - P&G Worldwide Shipments',
'External Reporting',
'gulx3',
'Wirekey',
'Microsoft Teams DirectRouting',
'golx3',
'gadc-plmgp001',
'tablg7',
'gglx1',
'solx1',
'Microsoft O365 - OneDrive for Bu',
'MFTSentinel (Prod)',
'DIL-I007-AE2',
'brsdfsql01-zw1',
'CCM - Consumer Complaints Manage',
'MIC',
'adln9265',
'Consult (Digital In-Store Counse',
'APIGEE API Management Platform',
'Global Separation System (GSS)',
'AMISC1GW',
'BW FMR (Financial Management Rep',
'RTDC',
'CNPDGB01RTR001',
'ITC-I133-HF4C35',
'DV Common Layer',
'S/4HANA P2P Reporting',
'Store Execution App',
'bidlx1',
'cob-pbxava02',
'J1P',
'SAP Ariba STRM',
'Security Ops Center',
'Spot Rate Request Tool',
'hylx3',
'SAP-S2C BW Chemicals Business Re',
'rnelx6',
'SH - Direct Shipments SWIFFER',
'SH - Case Fill Rate (CFR)',
'K6P',
'merlx1',
'vmlx1',
'Trackwise',
'Cloud Platforms',
'limlg1',
'Cloud Active Directory',
'SH - SFDS (Shipments Fused Dimen',
'marlx3',
'Rulex - Production Instance',
'matlx5',
'jklx5',
'adlg8266',
'jolx3',
'KNIME Platform',
'laglx1',
'Group Genie',
'F7P',
'brdlx1',
'tblx3',
'orlx3',
'FireEye HX',
'gadc-cell2-sw01',
'VPL-I060-NBDR',
'WebCenter - RTA Softpoints',
'malx3',
'SAP-BW ES-HR (Employee Services)',
'cgo-sbc001',
'PC Trade Up',
'ServiceNow - Employee Care HR Ca',
'amplg5',
'HKZTWB01RTR001',
'GEDB: Global Enterprise Database',
'GSP',
'SH - Business Pulse',
'PLM Central User Registration',
'LA TST - SmartSelling',
'sntlx1',
'MHF-I043-B1GRTR',
'Corporate Home Page',
'lodlx1',
'ANP',
'BigFix Corporate Production',
'ralx3',
'splx1',
'CFM Canada',
'relx3',
'shilx1',
'riolx3',
'TIE',
'SAP-SD (Order Management) - L6P',
'daylg5',
'jklx3',
'SRM PP (Price & Promo)',
'celx3',
'T&W BI FP Ground EMEA',
'DIL-I009-AE2',
'VCR-AMA-Singapore-SGO-Metropolis',
'kalx1',
'pqlx3',
'SAP Ariba Network (SCC)',
'anlx1',
'atlx6',
'TAX Vault',
'dallg5',
'brklx1',
'chdlx2',
'MarketScope',
'thlx5',
'oralb.com/en-us_33198',
'eCARM - KOFAX Software',
'Executive Distribution',
'ACL AX - Global (Production)',
'oplx3',
'HCRC-M001',
'SAP BO (Prod)',
'borlx3',
'T&W Analytics',
'tablg5',
'MyPSP (Performance Stock Program',
'iclx1',
'dalx3',
'prga-sis-srx-nah-03',
'gblx1',
'shlg6',
'WebEx',
'gsdc-cell3-sw01',
'hplx1',
'LDZ-I013-LMCBOB',
'bdln2729',
'allx3',
'WOM (Web Order Management v0.0 I',
'qulx3',
'aelg1',
'SIOD (Shopper Insights On Demand',
'NACHEACE1GW',
'CAS Data Cubes (Datamart)',
'GVP',
'gadc-ldapprd001',
'seklx6',
'Walmart Galaxy',
'L6P',
'gillette.com/en-us_33021',
'xqlx5',
'sk-ii.co.th_4387',
'ILM Optimization',
'brsql001-zw1',
'thlx6',
'always.co.uk/en-gb_32799',
'JDA Business Analytics for TMS',
'iSARA (Prod)',
'My Payroll Files',
'urlx3',
'BELSC1GW',
'sk-ii.co.id/in/index.aspx_27753',
'APCHSC1GW',
'TCF Prod',
'Hierarchy Tool (HIT)',
'General Ledger',
'gadc-eptmepo01',
'Switch',
'jelx3',
'IPaaS-Boomi (PROD)',
'lvlx6',
'HWP',
'gadc-oorchpd001',
'bdlx4003',
'GMP',
'GBP',
'DPF (Data Processing Framework) ',
'novlg3',
'talx3',
'ENOVIA Data Handler',
'SCSI (Supply Chain Synchronizati',
'FireEye Endpoint Threat Preventi',
'cdlx5',
'celg1',
'G11',
'SAP-HR-PAYROLL-GT',
'taklx3',
'D1P',
'Career by Design',
'CDS',
'oralb.de/de-de_33176',
'DPR (PROD)',
'italx6',
'telx3',
'Servers (Linux/UNIX)',
'SAP ERP Financials - MSA',
'celg3',
'newlx1',
'daylg3',
'balx7',
'adln9321',
'Enterprise Search',
'Exabeam',
'bdc-223-sw01',
'Payroll Performance Management',
'NACHSC1GW',
'skii.com.cn_3148',
'myISOP',
'gylx1',
'anlx5',
'SAP Logon',
'KPP',
'McAfee Endpoint Protection',
'polx1',
'IVR (Interactive Voice Response)',
'Electronic Lab Notebook (ELN)',
'Media Reporting Service - iRisk ',
'LAN',
'FPT Profit Forecast',
'FASTMART Platform (PROD)',
'tenableappliance',
'CISPro',
'US Retirement Plans (USRP)',
'adln9304',
'BW SRAP (Legacy)',
'kolx3',
'oralb.co.uk/en-gb_33197',
'Selling Content (formerly Custom',
'sk-ii.com.my/en/index.aspx_3149',
'gzlx5',
'sk2.co.kr/kr/index.aspx_2645',
'adlg2998',
'Chromeleon',
'adln9288',
'GDSN - LANSA',
'bdc-iptcmpub001',
'pllx3',
'iolx1',
'talx5',
'F5P',
'Global People Mobility Services ',
'G4P',
'GCDB: Global Customer Database',
'bdc-221-sw01',
'cailx7',
'gelx3',
'BARS (Budget and Actuals Reporti',
'NP1',
'Power of You (globoforce)',
'eManufacturing',
'SAP-HR-PAYROLL-MY',
'BW IPSR',
'DV (Data Virtualization) Platfor',
'atlx5',
'IDP',
'mdclx5',
'ADW Reference Data (RDSv2)',
'IOP Tracker (IOPT)',
'Data Fabric',
'bajlx3',
'D2P',
'Enginuity',
'rnlx1',
'Microsoft Lync (Prod) 2',
'Digital SKU Base Plan',
'WAN',
'Xerox Secure Print Manager Suite',
'My Career',
'manlx1',
'APIGEE API Management Platform P',
'seklx5',
'SAP-ERP (Human Resources)',
'KAP',
'CA API Management Platform',
'bllx1',
'CF - Revenue Accounting',
'sk-ii.com.sg/en/index.aspx_3150',
'Optima Tx LA Prod',
'Agile PC',
'SAP-HR-PAYROLL-VN',
'Office Plus',
'sde2-exadata',
'SAP SEM - Financial Consolidatio',
'Security Role Development',
'gadc-cxesys01',
'Golden Eye (aka DICOM)',
'SAP-HR-PAYROLL-CH',
'WorkFusion',
'rnelx5',
'CRM-Pharma Italy',
'PingFederate',
'APO DRP',
'SAP-HR-PAYROLL- PA',
'nt--hl',
'SAP-BW (Regional)',
'A6P',
'GAIMS',
'LDS (Longterm Demand Sensing)',
'SAP-HR-PAYROLL-HK',
'tclx5',
'D3P',
'italx5',
'bdc-126-sw01',
'Enterprise Directory (LDAP)',
'SAP-HR-PAYROLL-TW',
'ECM - Customer Portal Genesis Tw',
'novlg1',
'Consumer Research Center',
'Customer Forms',
'Price Corridor (PROD)',
'MEGA',
'LabWare Digital Quality LIMS',
'Office',
'sk-ii.com.hk/tc/index.aspx_3151',
'General Ledger Accounting',
'Brand Health on Demand',
'MIC Customs Solutions',
'ade11-exadata',
'SAP - ERP',
'Core Data Platform',
'ISC (Inventory at Standard Cost)',
'REA (Retail Execution Alerts)',
'sk-ii.com.tw_2646',
'CAS NA',
'SAP Landscape Transformation Rep',
'Microsoft Office 365 (O365)',
'lvlx5',
'IBP-I Integrated Business Planni',
'ZScaler',
'WLAN',
'SAP ERP Financials - CO-PA',
'SAP SCS - PROD Instance',
'GCS - Salary Planning',
'F6P',
'SAP-BW R/3 Security / CheckMate',
'Voice',
'B2G outbound',
'B2Bi (Prod)',
'SAP-HR-PAYROLL-AU',
'Core Data Hub - EU',
'bdc-222-sw01',
'SAP-HR-PAYROLL-ID',
'KWP',
'SAP-PO',
'Perfect Store (FR)',
'Sentinel (PROD)',
'RTDX',
'SAP',
'My Pay & Benefits Information',
'Master Minder',
'shlg5',
'Counter Insights',
'LAStore',
'sk-ii.jp_2338',
'STEAM',
'RTDC (Realtime Distributor Conne',
'SAP-Netweaver (HR Portal)',
'IT@Labs',
'SAP-S2C BW/BO Retail Business Re',
'My Pay',
'SAP-HR-PAYROLL-KR',
'MOI - My Organization Informatio',
'Financial Master Data',
'Blue Prism Automation Platform',
'Darwin',
'Workfusion Automation - OM',
'iBOT - MSA Expense Management',
'Optima Tx CEEMEA Prod',
'Axon',
'Microsoft Azure',
'SAP-HR-PAYROLL-SG',
'Big Data AWS Cloud (PROD)',
'K4P',
'Di Junction',
'SOARS',
'SAP-SD (Transportation)',
'SAP-HR-PAYROLL-TH',
'SIMPLEMENT PROD',
'eBest iMarket (JP Samurai Pro)',
'Category Supply Planning (CSP) B',
'B2G Edicom',
'Enhanced Vulnerability Protectio',
'MYPGS - Employee Data Management',
'Core Data Hub - AMA',
'Anaplan TPM - transactional - Pr',
'RTA (Real Time Artwork)',
'Payroll',
'SRAP Expense Management',
'SAP-HR-PAYROLL-ES',
'ae.braun.com/ar-ae_40200',
'Integration Platforms',
'SAP-HR-PAYROLL-IN',
'SAP-SD (Order Management) - N6P',
'SAP-SD (Order Management) - ANP',
'ADW7P',
'Brand Health Interim Data Hub (C',
'CNGC Data service',
'N6P',
'KBP',
'Proficy Plant Applications',
'Salesbook Content Authoring & Pu',
'Core Data Hub - LA',
'SAP-HR-PAYROLL',
'Transportation View',
'Core Data Hub - JP',
'SAP-HR-PAYROLL- CR',
'SAP R/3 DRP',
'B2G GRC',
'SAP-HR-PAYROLL-JP',
'Business Service Management (BSM',
'Servers (Wintel)',
'SAP-HR-PAYROLL-IE',
'TMS',
'DC - LAN',
'FastMart',
'Optima Tx WE Prod',
'Optima reporting (AX) - Prod',
'ESD3SWS Marimba',
'itAccess',
'SAP-HR-PAYROLL- PE',
'IT @ Labs',
'SAP-HR-PAYROLL- VE',
'SAP-HR-PAYROLL- CL',
'ALICS',
'PS EDW - KAP',
'FPT',
'SAP-HR-PAYROLL-RU',
'UNSPECIFIED',
'Forecast One - F1',
'SAP-HR-PAYROLL-PH',
'ADW6P',
'rtcis1',
'SAP-HR-PAYROLL- CO',
'Optima Tx Asia Prod',
'Windows 10 [PROD]',
'Axway MFT â€“ PROD Instance',
'IDF (Intelligent Daily Forecasti',
'Control M',
'TIBCO-BW (Production)',
'Microsoft Exchange',
'SAP-HR-PAYROLL-GB',
'SAP-SM (Solution Manager)',
'GPDB: Global Product Database',
'TMS Atlas (Transportation Manage',
'GTP',
'SKII SDC (counters solution)',
'SAP-SD (Order Management) - A6P',
'SAP-SD (Shipping Documents)',
'SAP-SCM-gATP',
'Core Data Lake - MDM Tool',
'Spotfire Server (Production)',
'HGP',
'Windows',
'MIO',
'SH - Incremental Shipment Engine',
'Active Directory (PG.com Forest)',
'Global SAP TM (Lane Management)',
'SAP-HR-PAYROLL-BE',
'K8P',
'SAP-HR-PAYROLL-CN',
'Kinaxis RapidResponse',
'SAP Core Purchasing SAP-MM-PUR',
'Citrix PGVirtualApp',
'Capture Financial Data',
'STC Analytics',
'DSM (Digital Specification Manag',
'Cloud Operations Monitoring Plat',
'SAP-HR-PAYROLL-CA',
'K9P',
'BW Platform',
'SAP ERP Financials - Assets',
'SAP ERP Financials - Intercompan',
'GPPDB: Global Price and Promotio',
'Order Acquisition B2B platform',
'SAP-HR-PAYROLL-MX',
'SAP-HR-PAYROLL-DE',
'APO IDP (Integrated Demand Plann',
'SAP-PM',
'ENOVIA (PLM)',
'SAP-HR-PAYROLL-BR',
'WMS PrIME',
'SAP-HR-PAYROLL- AR',
'Simplement',
'SAP-HR-PAYROLL-IT',
'Voyager',
'ServiceNow IT Service Management',
'SAP-AR',
'SAP ERP Financials - Tax',
'SAP ERP Financials - Payment Ser',
'MIC â€“ Production',
'SAP-HR-PAYROLL-FR',
'SAP-PI-Customer EDI',
'Technology Hosting Solution',
'CDS - Data Store (ADW)',
'SAP-QM',
'SAP ERP Financials - Costs',
'SAP-WM',
'SAP ERP Financials - Banking Ser',
'SAP ERP Financials - GL',
'OMP+ APS',
'ServiceNow (PGGEIPROD)',
'RTCIS',
'APO DRP Application',
'Mercury',
'PI-APPS',
'SAP-PP (MPS & MRP)',
'Oracle BI on Exalytics (PROD SDL',
'LAN--HL',
'SAP-PP (Process Order Execution)',
'SAP-IM',
'Telepresence',
'SAP-PI-Customer EDI (Prod)',
'SAP-HR-PAYROLL-US',
'Cross Box (XBox)',
'Order and Load Builder (LEO)',
'SAP Systems',
'TMS (Transportation Management S',
'SAP-SD (Order Management)',
'SAP-SD (Shipping)'
)
)a
where cmdb_ci_grouped<>cmdb_ci_grouped_c;

