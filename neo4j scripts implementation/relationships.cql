// ------------------------------------RELATIONSHIPS T3-T4-T5 + STATION ------------------------------------------
// Create relationships between Station and Reference_position_velocities
MATCH (st:Station), (ref:Reference_position_velocities)
WHERE st.id = ref.id_station
CREATE (st)-[:HAS_REFERENCE_POSITION]->(ref);

// Create relationships between Reference_position_velocities and product_files
MATCH (ref:Reference_position_velocities), (p:product_files)
WHERE ref.id_product_files = p.id
CREATE (ref) <-[:HAS_REFERENCE_POSITION_VELOCITIES]- (p);

// Create relationships between Reference_position_velocities and product_files
MATCH (ref:Reference_position_velocities), (m:Method_identification)
WHERE ref.id_product_files = m.id
CREATE (ref) <-[:HAS_REFERENCE_POSITION_VELOCITIES]- (r);

// Create relationships between product_files and analysis_centers
MATCH (pfil:product_files), (ac:analysis_centers)
WHERE pfil.id_analysis_centers = ac.id
CREATE (pfil)-[:PRODUCED_BY]->(ac);

// Create relationships between helmet, analysis_centers and reference frames
MATCH (hel:helmert), (ac:analysis_centers)
WHERE hel.id_analysis_centers = ac.id
CREATE (hel)-[:PRODUCED_BY]->(ac);

MATCH (hel:helmert), (r:Reference_frame)
WHERE hel.id_old_frame = r.id
CREATE (hel)-[:HAS_REFERENCE_FRAME]->(r);

MATCH (hel:helmert), (r:Reference_frame)
WHERE hel.id_new_frame = r.id
CREATE (hel)-[:HAS_REFERENCE_FRAME]->(r);

MATCH (hel:helmert), (p:processing_parameters)
WHERE hel.id = p.id_helmert
CREATE (hel)-[:HAS_PROCESSING_PARAMETERS]->(r);

// Create relationships between Method_identification and analysis_centers
MATCH (mt:Method_identification), (ac:analysis_centers)
WHERE mt.id_analysis_centers = ac.id
CREATE (mt)-[:CREATED_BY]->(ac);

// Create relationships between Method_identification and Reference_frame
MATCH (mt:Method_identification), (r:Reference_frame)
WHERE mt.id_reference_frame = r.id
CREATE (mt)-[:USES_REFERENCE_FRAME]->(r);

//--------------------------------------FIX THIS FOR PERFORMANCE----------------------------------------------

MATCH (mt:Method_identification), (e:Estimated_coordinates)
WHERE mt.id = e.id_method_identification
WITH mt, e
SKIP 6000000
LIMIT 1500000
MERGE (mt)-[:USES_ESTIMATED_COORDINATES_MI]->(e);


MATCH (p:processing_parameters), (e:Estimated_coordinates)
WHERE p.p_id = e.id_processing_parameters
WITH p, e
SKIP 6000000
LIMIT 1500000
MERGE (p)-[:HAS_ESTIMATED_COORDINATES_PP]->(e);


MATCH (p:product_files),(e:Estimated_coordinates)
WHERE p.id = e.id_product_files
WITH p, e
SKIP 6000000
LIMIT 1500000
MERGE (p)-[:HAS_ESTIMATED_COORDINATES_PF]->(e)


MATCH (st:Station),(e:Estimated_coordinates)
WHERE st.id = e.id_station
WITH st, e
SKIP 6000000
LIMIT 1500000
MERGE (st)-[:HAS_ESTIMATED_COORDINATES_ST]->(e)

//------------------------------------------------Relationships-T1-----------------------------------------

MATCH (st:Station), (sc:Station_colocation)
WHERE st.id = sc.id_station
CREATE (st)-[:IS_COLLOCATED]->(sc);

MATCH (sc:Station_colocated), (co: Colocation_offset)
WHERE sc.id = co.id_station_colocated
CREATE (sc)-[:HAS_OFFSET]->(co);

MATCH (st:Station), (t:Station_type)
WHERE st.id_station_type = t.id
CREATE (st)-[:HAS_STATION_TYPE]->(t);

MATCH (st:Station), (l:Location)
WHERE st.id_location = l.id
CREATE (st)-[:IS_LOCATED]->(l);

MATCH (st:Station), (m:Monument)
WHERE st.id_monument = m.id
CREATE (st)-[:HAS_MONUMENT]->(m);

MATCH (l:Location), (c:coordinates)
WHERE l.id_coordinates = c.id
CREATE (l)-[:HAS_COORDINATES]->(c);

MATCH (l:Location), (c:City)
WHERE l.id_city = c.id
CREATE (l)-[:BELONGS_TO_CITY]->(c);

MATCH (l:Location), (t:Tectonic)
WHERE l.id_tectonic = t.id
CREATE (l)-[:IN_TECTONIC]->(t);

MATCH (c:City), (s:State)
WHERE c.id_state = s.id
CREATE (c)-[:BELONGS_TO_STATE]->(s);

MATCH (s:State), (c:Country)
WHERE s.id_country = c.id
CREATE (s)-[:BELONGS_TO_COUNTRY]->(c);

MATCH (g:Geological), (b:Bedrock)
WHERE g.id_bedrock = b.id
CREATE (g)-[:HAS_BEDROCK]->(b);

MATCH (c:Condition), (st:Station)
WHERE c.id_station = st.id
CREATE (c)-[:IN_CONDITION]->(st);

MATCH (c:Condition), (e:Effects)
WHERE c.id_effect = e.id
CREATE (c)-[:HAS_EFFECTS]->(e);

//------------------------------------------condition-effects---------------------------------

MATCH (i:Instrument_colocation), (st:Station)
WHERE i.id_station = st.id
CREATE (i)-[:STATION_INSTRUMENT_COLLOCATION]->(st);

MATCH (l:Local_ties), (st:Station)
WHERE l.id_station = st.id
CREATE (l)-[:STATION_LOCAL_TIES]->(st);


//-------------------------------------------items-T1--------------------------------------------

MATCH (i:Item), (c:Contact)
WHERE i.id_contact_as_producer = c.id
CREATE (i)-[:HAS_PRODUCER_COTACT]->(c);

MATCH (i:Item), (c:Contact)
WHERE i.id_contact_as_owner = c.id
CREATE (i)-[:HAS_OWNER_COTACT]->(c);

MATCH (i:Item), (it:Item_type)
WHERE i.id_item_type = it.id
CREATE (i)-[:HAS_ITEM_TYPE]->(it);

MATCH (i:Item_type), (ia:Item_type_attribute)
WHERE ia.id_item_type = i.id
CREATE (ia)-[:ITEM_TYPE_HAS_ATTRIBUTES]->(i);

MATCH (ia:Item_type_attribute), (a:Attribute)
WHERE ia.id_attribute = a.id
CREATE (ia)-[:COMPOSED_OF]->(a);

MATCH (ia:Item_attribute), (i:Item)
WHERE ia.id_item = i.id
CREATE (ia)-[:GIVES_ATTRIBUTES_TO_ITEMS]->(i);

MATCH (ia:Item_attribute), (a:Attribute)
WHERE ia.id_item_type = a.id
CREATE (ia)-[:HAS_FOLLOWING_ATTRIBUTES]->(i);

MATCH (si:Station_item), (st:Station)
WHERE si.id_station = st.id
CREATE (si)-[:DERIVED_FROM_STATION]->(st);

MATCH (si:Station_item), (i:Item)
WHERE si.id_item = i.id
CREATE (ia)-[:ITEM_FROM_STATION]->(i);

//--------------------------------------------------LOG-----------------------------------------------

MATCH (l:Log), (lt:Log_type)
WHERE l.id_log_type = lt.id
CREATE (l)-[:HAS_LOG_TYPE]->(lt);

MATCH (l:Log), (st:Station)
WHERE l.id_station = st.id
CREATE (l)-[:LOGS_FROM_STATION]->(st);

MATCH (l:Log), (c:Contact)
WHERE l.id_contact = c.id
CREATE (ia)-[:LOG_CONTACT]->(i);

//--------------------------------------------DOCUMENT-----------------------------------------------------



MATCH (d:Document), (st:Station)
WHERE d.id_station = st.id
CREATE (d)-[:DOCUMENT_FROM_STATION]->(st);

MATCH (d:Document), (i:Item)
WHERE d.id_item = i.id
CREATE (d)-[:ITEM_FROM_DOCUMENT]->(i);

MATCH (d:Document), (dt:Document_type)
WHERE d.id_document_type = dt.id
CREATE (d)-[:HAS_DOCUMENT_TYPE]->(dt);

//----------------------------------------ACCESS-CONTROL---------------------------------------------------

MATCH (ugs:User_group_station), (ug:User_group)
WHERE ugs.id_user_group = ug:id
CREATE (ugs)-[:HAS_USER_GROUP]->(ug);

MATCH (ugs:User_group_station), (st:Station)
WHERE ugs.id_station = st:id
CREATE (ugs)-[:USER_GROUP_FROM]->(st);

//------------------------------------------OPERATIONAL_CENTER--------------------------------------------

MATCH (c:Contact), (a:Agency)
WHERE  c.id_agency = a.id
CREATE (c)-[:CONTACT_FROM_AGENCY]->(a);

MATCH (sc:Station_contact), (st:Station)
WHERE  sc.id_station = st.id
CREATE (sc)-[:CONTACT_FROM_STATION]->(st);

MATCH (sc:Station_contact), (c:Contact)
WHERE  sc.id_agency = c.id
CREATE (sc)-[:STATION_CONTACT_HAS_CONTACT]->(c);

MATCH (n:Network), (c:Contact)
WHERE  n.id_contact = c.id
CREATE (n)-[:CONTACT_FROM_NETWORK]->(c);

MATCH (sn:Station_network), (st:Station)
WHERE  sn.id_station = st.id
CREATE (sn)-[:NETWORK_FROM_STATION]->(st);

MATCH (sn:Station_network), (n:Network)
WHERE  sn.id_network = n.id
CREATE (sn)-[:HAS_NETWORK]->(n);

//----------------------------------------NODE-T0----------------------------------------------------------

MATCH (ndc:Node_data_center), (n:Node)
WHERE ndc.id_node = n.id
CREATE (ndc)-[:NODES_FROM_NODE_DATA_CENTER]->(n);

MATCH (ndc:Node_data_center), (dc:Data_center)
WHERE ndc.id_data_center = dc.id
CREATE (ndc)-[:NODE_FROM_DATA_CENTER]->(dc);

MATCH (nrf:Node_rinex_file), (n:Node)
WHERE nrf.id_node = n.id
CREATE (ndc)-[:NODE_RINEX_FILE]->(n);

MATCH (nrf:Node_rinex_file), (rf:Rinex_file)
WHERE nrf.id_node = rf.id
CREATE (nrf)-[:NODE_COMPOSED_OF_RINEX_FILES]->(rf);

MATCH (c:Connections), (n:Node)
WHERE c.source = n.id
CREATE (c)-[:HAS_SOURCE]->(n);

MATCH (c:Connections), (n:Node)
WHERE c.destiny = n.id
CREATE (c)-[:HAS_DESTINY]->(n);

MATCH (c:Connections), (st:Station)
WHERE c.station_id = st.id
CREATE (c)-[:CONNECTIONS_FROM_STATION]->(st);

MATCH (q:Queries), (st:Station)
WHERE q.station_id = st.id
CREATE (q)-[:QUERIES_FROM_STATION]->(st);
	
MATCH (fq:Failed_queries), (n:Node)
WHERE fq.destiny = n.id
CREATE (fq)-[:SOURCE_OF_FAILED_QUERIES]->(n);


//-------------------------------------------DATACENTER-T0------------------------------------------------

MATCH (dc:Data_center), (a:Agency)
WHERE dc.id_agency = a.id
CREATE (dc)-[:DATA_CENTER_FROM_AGENCY]->(a);

MATCH (dcs:Data_center_station), (st:Station)
WHERE dcs.id_station = st.id
CREATE (dcs)-[:DATA_CENTER_FROM_STATION]->(st);

MATCH (dcs:Data_center_station), (dc:Data_center)
WHERE dcs.id_data_center = dc.id
CREATE (dcs)-[:DATA_CENTER_IS_DATA_CENTER_FROM_STATION]->(dc);

MATCH (dcstr:Data_center_structure), (dc:Node)
WHERE dcstr.source = dc.id
CREATE (dcstr)-[:STRUCTURE_FROM_DATA_CENTER]->(dc);


//-----------------------------------------DATA-FILES-T2----------------------------------------------------



MATCH (rf: Rinex_file), (st: Station)
WHERE rf.id_station = st.id
CREATE (rf)-[:RINEX_FILE_STATION]->(st);

MATCH (rf: Rinex_file), (d: Data_center_structure)
WHERE rf.id_data_center_structure = d.id
CREATE (rf)-[:RINEX_FILE_DATA_CENTER_STRUCTURE]->(d);

MATCH (rf: Rinex_file), (ft:File_type)
WHERE rf.file_type = ft.id
CREATE (rf)-[:RINEX_FILE_FROM_STATION]->(st);

MATCH (qf:Quality_file), (d:Data_center_structure)
WHERE qf.id_data_center_structure = d.id
CREATE (qf)-[:QUALITY_FILE_DATA_CENTER_STRUCTURE]->(d);

MATCH (qf:Quality_file), (r:Rinex_file)
WHERE qf.id_rinexfile = r.id
CREATE (qf)-[:QUALITY_FILE_DATA_CENTER_STRUCTURE]->(r);


MATCH (qf:Quality_file), (ft:File_type)
WHERE qf.id_file_type = ft.id
CREATE (qf)-[:QUALITY_FILE_TYPE]->(ft);

MATCH (re:Rinex_errors), (r:Rinex_file)
WHERE re.id_rinex_file = r.id
CREATE (re)-[:QUALITY_FILE_DATA_CENTER_STRUCTURE]->(r);


MATCH (re:Rinex_errors), (et:Rinex_error_type)
WHERE re.id_error_type = et.id
CREATE (re)-[:RINEX_ERROR_HAS_TYPES]->(et);

MATCH (f:File_generated), (st:Station)
WHERE f.id_station = st.id
CREATE (f)-[:FILES_GENERATED_FROM]->(st);

MATCH (f:File_generated), (ft:File_type)
WHERE f.id_file_type = ft.id
CREATE (f)-[:FILE_TYPE_FROM_GENERATED_FILE]->(ft);

MATCH (o:Other_file), (st:Station)
WHERE o.id_station = st.id
CREATE (o)-[:OTHER_FILES_FROM_STATION]->(st);

MATCH (o:Other_file), (ft:File_type)
WHERE o.id_file_type = ft.id
CREATE (o)-[:OTHER_FILES_FROM_STATION]->(ft);

MATCH (o:Other_file), (d:Data_center_structure)
WHERE o.id_data_center_structure = d.id
CREATE (o)-[:OTHER_FILES_FROM_DATA_CENTER_STRUCTURE]->(d);


//-------------------------------------------------------------------QUALITY-CONTROL-T3---------------------------------------------------




MATCH (qs:Qc_report_summary), (r:Rinex_file)
WHERE qs.id_rinexfile = r.id
CREATE (qs)-[:RINEX_FILE_FROM_REPORT_SUMMARY]->(r);

MATCH (qs:Qc_report_summary), (qp:Qc_parameters)
WHERE qs.id_qc_parameters = qp.id
CREATE (qs)-[:RINEX_FILE_FROM_REPORT_SUMMARY]->(qp);

MATCH (qs:Qc_constellation_summary), (qr:Qc_report_summary)
WHERE qs.id_qc_report_summary = qr.id
CREATE (qs)-[:REPORT_SUMMARY_FROM_CONSTELLATION_SUMMARY]->(qr);


MATCH (qs:Qc_constellation_summary), (c:Constellation)
WHERE qs.id_constellation = c.id
CREATE (qs)-[:CONSTELLATION_HAS_CONSTELATION_SUMMARY]->(c);

MATCH (qc:Qc_navigation_msg), (qr:Qc_report_summary)
WHERE qc.id_qc_report_summary = qr.id
CREATE (qc)-[:REPORT_SUMMARY_FROM_NAVIGATION_MSG]->(qr);

MATCH (qc:Qc_navigation_msg), (c:Constellation)
WHERE qc.id_constellation = c.id
CREATE (qc)-[:CONSTELATION_FROM_NAVIGATION_MSG]->(qr);

MATCH (qc:Qc_navigation_msg), (qr:Qc_report_summary)
WHERE qc.id_qc_report_summary = qr.id
CREATE (qc)-[:REPORT_SUMMARY_FROM_NAVIGATION_MSG]->(qr);

MATCH (qc:Qc_observation_summary_c), (q:Qc_constellation_summary)
WHERE qc.id_qc_constellation_summary = q.id
CREATE (qc)-[:CONSTELATION_SUMMARY_C_HAS_CONSTELLATION_SUMMARY]->(q);

MATCH (qc:Qc_observation_summary_c), (g:Gnss_obsnames)
WHERE qc.id_gnss_obsnames = g.id
CREATE (qc)-[:CONSTELATION_SUMMARY_C_HAS_GNSS_OBSNAMES]->(g);

MATCH (qc:Qc_observation_summary_s), (q:Qc_constellation_summary)
WHERE qc.id_qc_constellation_summary = q.id
CREATE (qc)-[:CONSTELATION_SUMMARY_S_HAS_CONSTELLATION_SUMMARY]->(q);

MATCH (qc:Qc_observation_summary_s), (g:Gnss_obsnames)
WHERE qc.id_gnss_obsnames = g.id
CREATE (qc)-[:CONSTELATION_SUMMARY_S_HAS_GNSS_OBSNAMES]->(g);

MATCH (qc:Qc_observation_summary_l), (q:Qc_constellation_summary)
WHERE qc.id_qc_constellation_summary = q.id
CREATE (qc)-[:CONSTELATION_SUMMARY_L_HAS_CONSTELLATION_SUMMARY]->(q);

MATCH (qc:Qc_observation_summary_l), (q:Gnss_obsnames)
WHERE qc.id_gnss_obsnames = q.id
CREATE (qc)-[:CONSTELATION_SUMMARY_L_HAS_GNSS_OBS_NAMES]->(q);

MATCH (qc:Qc_observation_summary_d), (q:Qc_constellation_summary)
WHERE qc.id_qc_constellation_summary = q.id
CREATE (qc)-[:CONSTELATION_SUMMARY_D_HAS_CONSTELLATION_SUMMARY]->(q);

MATCH (qc:Qc_observation_summary_d), (q:Gnss_obsnames)
WHERE qc.id_gnss_obsnames = q.id
CREATE (qc)-[:CONSTELATION_SUMMARY_D_HAS_GNSS_OBSNAMES]->(q);