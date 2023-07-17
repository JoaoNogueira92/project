//-----------------------------------------------MODULO T4-T5-T6 + STATION----------------------------------------------------------

LOAD CSV WITH HEADERS FROM 'file:///station.csv' AS rowSt

WITH rowSt WHERE NOT rowSt.id IS NULL
CREATE (st:Station 
	{
		id: toInteger(rowSt.id),
		name: rowSt.name,
		marker: rowSt.marker,
		description: rowSt.description,
		date_from: rowSt.date_from,
		date_to: rowSt.date_to,
		id_station_type: toInteger(rowSt.id_station_type),
		comment: rowSt.comment,
		id_location: toInteger(rowSt.id_location),
		id_geological: toInteger(rowSt.id_geological),
		id_monument: toInteger(rowSt.id_monument),
		iers_domes: rowSt.iers_domes, 
		cpd_num: toInteger(rowSt.cpd_num),
		monument_num: toInteger(rowSt.monument_num),
		receiver_num: toInteger(rowSt.receiver_num),
		country_code: rowSt.countrycode
	});

CREATE INDEX station_id IF NOT EXISTS FOR (st:Station) ON (st.id);


LOAD CSV WITH HEADERS FROM 'file:///reference_position_velocities.csv' AS rowRefPos

WITH rowRefPos WHERE NOT rowRefPos.id IS NULL
CREATE(ref: Reference_position_velocities
	{
		id: toInteger(rowRefPos.id),
		id_station: toInteger(rowRefPos.id_station),
		velx: toFloat(rowRefPos.velx),
		vely: toFloat(rowRefPos.vely),
		velz:toFloat(rowRefPos.velz),
		velx_sigma: toFloat(rowRefPos.velx_sigma),
	 	vely_sigma: toFloat(rowRefPos.vely_sigma),
	  	velz_sigma: toFloat(rowRefPos.velz_sigma),
	  	vel_rho_xy: toFloat(rowRefPos.vel_rho_xy),
	  	vel_rho_xz: toFloat(rowRefPos.vel_rho_xz),
	  	vel_rho_yz: toFloat(rowRefPos.vel_rho_yz),
	  	reference_position_x: toFloat(rowRefPos.reference_position_x),
	  	reference_position_y: toFloat(rowRefPos.reference_position_y),
	  	reference_position_z: toFloat(rowRefPos.reference_position_z),
	  	reference_position_x_sigma: toFloat(rowRefPos.reference_position_x_sigma),
	  	reference_position_y_sigma: toFloat(rowRefPos.reference_position_y_sigma),
	  	reference_position_z_sigma: toFloat(rowRefPos.reference_position_z_sigma),
	  	reference_position_rho_xy: toFloat(rowRefPos.reference_position_rho_xy),
	  	reference_position_rho_xz: toFloat(rowRefPos.reference_position_rho_xz),
	  	reference_position_rho_yz: toFloat(rowRefPos.reference_position_rho_yz),
	  	start_epoch: rowRefPos.start_epoch,
	  	end_epoch: rowRefPos.end_epoch,
	  	ref_epoch: rowRefPos.ref_epoch, 
	  	id_station: toInteger(rowRefPos.id_station),
	  	id_product_files: toInteger(rowRefPos.id_product_files),
	  	id_method_identification: toInteger(rowRefPos.id_method_identification)

		});

CREATE INDEX reference_position_velocities_id FOR (ref: Reference_position_velocities) ON (ref.id);

LOAD CSV WITH HEADERS FROM 'file:///method_identification.csv' AS rowMeth

WITH rowMeth WHERE NOT rowMeth.id IS NULL
MERGE(mt: Method_identification
	{
		id: toInteger(rowMeth.id),
		creation_date: rowMeth.creation_date,
		doi: rowMeth.doi,
		software: rowMeth.software,
		data_type: rowMeth.data_type,
		version: rowMeth.version,
		id_reference_frame: toInteger(rowMeth.id_reference_frame),
		id_analysis_centers: toInteger(rowMeth.id_analysis_centers)

		});

CREATE INDEX method_identification_id FOR (mt:Method_identification) ON (mt.id);


LOAD CSV WITH HEADERS FROM 'file:///reference_frames.csv' AS rowRframe
WITH rowRframe WHERE NOT rowRframe.id IS NULL
CREATE(ref: Reference_frame
	{	
		id: toInteger(rowRframe.id),
		name: rowRframe.name,	
		epoch: rowRframe.epoch

	});

CREATE INDEX reference_frame_id FOR (ref: Reference_frame) ON (ref.id);

LOAD CSV WITH HEADERS FROM 'file:///product_files.csv' AS rowPfiles
WITH rowPfiles WHERE NOT rowPfiles.id IS NULL
CREATE(pfil: product_files 
	{
		id: toInteger(rowPfiles.id),
		url : rowPfiles.url,
		epoch: rowPfiles.epoch,
		version: toInteger(rowPfiles.version),
		file_type: rowPfiles.file_type,
		sampling_period: rowPfiles.sampling_period,
		data_type: rowPfiles.data_type,
		id_analysis_centers: toInteger(rowPfiles.id_analysis_centers)
	});
CREATE INDEX product_files_id FOR (pfil:product_files) ON (pfil.id);


LOAD CSV WITH HEADERS FROM 'file:///helmert.csv' AS rowHelmert
WITH rowHelmert WHERE NOT rowHelmert.id IS NULL
CREATE(hel: helmert 
	{
		id: toInteger(rowHelmert.id),
		cx: toFloat(rowHelmert.cx),
		cy: toFloat(rowHelmert.cy),
		cz: toFloat(rowHelmert.cz),
		scale: toFloat(rowHelmert.scale), 
		rx: toFloat(rowHelmert.rx),
		ry: toFloat(rowHelmert.ry),
		rz: toFloat(rowHelmert.rz),
		id_analysis_centers: toInteger(rowHelmert.id_analysis_centers),
		id_old_frame: toInteger(rowHelmert.id_old_frame), 
		id_new_frame: toInteger(rowHelmert.id_new_frame)
});

CREATE INDEX helmert_id FOR (hel:helmert) ON (hel.id);



LOAD CSV WITH HEADERS FROM 'file:///analysis_centers.csv' AS rowACenter
WITH rowACenter WHERE NOT rowACenter.id IS NULL
CREATE(ac: analysis_centers 
	{
		id: toInteger(rowACenter.id),
		name: rowACenter.name,
		abbreviation: rowACenter.abbreviation,
		contact: rowACenter.contact,
		email: rowACenter.email,
		url: rowACenter.url

});

CREATE INDEX analisys_centers_id FOR (ac:analysis_centers) ON (ac.id);


LOAD CSV WITH HEADERS FROM 'file:///processing_parameters.csv' AS rowPpar
WITH rowPpar WHERE NOT rowPpar.id IS NULL
CREATE(param: processing_parameters  
	{
		sinex_version: rowPpar.sinex_version,
		otl_model: rowPpar.otl_model,
		antenna_model: rowPpar.antenna_model,
		p_id: toInteger(rowPpar.id),
		cut_of_angle: toFloat(rowPpar.cut_of_angle),
		sampling_period: rowPpar.sampling_period,
		id_rowHelmert:rowPpar.id_helmert

});

CREATE INDEX processing_parameters_id FOR (param:processing_parameters) ON (param.id);


:auto LOAD CSV WITH HEADERS FROM 'file:///estimated_coordinates.csv' AS rowEst
CALL{
    WITH rowEst
    CREATE(rowEstim: Estimated_coordinates
	    {
            id: toInteger(rowEst.id),
            x: toFloat(rowEst.x),
            y: toFloat(rowEst.y),
            z: toFloat(rowEst.z),
            var_xx: toFloat(rowEst.var_xx),
            var_yy: toFloat(rowEst.var_yy),
            var_zz: toFloat(rowEst.var_zz),
            var_xy: toFloat(rowEst.var_xy),
            var_xz: toFloat(rowEst.var_xz),
            var_yz: toFloat(rowEst.var_yz) ,
            outlier: toInteger(rowEst.outlier),
            epoch: rowEst.epoch,
            id_processing_parameters: toInteger(rowEst.id_processing_parameters),
            id_method_identification: toInteger(rowEst.id_method_identification),
            id_station: toInteger(rowEst.id_station),
            id_product_files: toInteger(rowEst.id_product_files)

	    })
    }IN TRANSACTIONS;

CREATE INDEX Estimated_coordinates FOR (rowEstim:Estimated_coordinates) ON (rowEstim.id);


// ------------------------------------------station-module T1-------------------------------------------------------


LOAD CSV WITH HEADERS FROM 'file:///tectonic.csv' AS rowTec
WITH rowTec WHERE NOT rowTec.id IS NULL
CREATE(tectonic: Tectonic
	{
		id: toInteger(rowTec.id),
		plate_name: rowTec.plate_name

	});

CREATE INDEX tectonic_id FOR (tectonic:Tectonic) ON (tectonic.id);

LOAD CSV WITH HEADERS FROM 'file:///location.csv' AS rowLoc
WITH rowLoc WHERE NOT rowLoc.id IS NULL
CREATE(location: Location
	{
		id: toInteger(rowLoc.id),
		id_city: toInteger(rowLoc.id_city),
		id_coordinates: toInteger(rowLoc.id_coordinates),
		id_tectonic: toInteger(rowLoc.id_tectonic),
		description: rowLoc.description


	});

CREATE INDEX location_id FOR (location:Location) ON (location.id);

LOAD CSV WITH HEADERS FROM 'file:///station_type.csv' AS rowStype
WITH rowStype WHERE NOT rowStype.id IS NULL
CREATE(station_type: Station_type
	{
		id: toInteger(rowStype.id),
		id_station: toInteger(rowStype.id_station),
		id_station_colocated: toInteger(rowStype.id_station_colocated)

	});

CREATE INDEX station_type_id FOR (station_type:Station_type) ON (station_type.id);


LOAD CSV WITH HEADERS FROM 'file:///station_colocation.csv' AS rowStcol
WITH rowStcol WHERE NOT rowStcol.id IS NULL
CREATE(station_colocation: Station_colocation
	{
		id: toInteger(rowStcol.id),
		id_station: toInteger(rowStcol.id_station),
		id_station_colocated: toInteger(rowStcol.id_station_colocated)

	});

CREATE INDEX station_colocation_id FOR (station_colocation:Station_colocation) ON (station_colocation.id);


LOAD CSV WITH HEADERS FROM 'file:///country.csv' AS rowCountry
WITH rowCountry WHERE NOT rowCountry.id IS NULL
CREATE(country: Country
	{
		id: toInteger(rowCountry.id),
		name: rowCountry.name,
		iso_code: rowCountry.iso_code

	});

CREATE INDEX country_id FOR (country:Country) ON (country.id);


LOAD CSV WITH HEADERS FROM 'file:///state.csv' AS rowState
WITH rowState WHERE NOT rowState.id IS NULL
CREATE(state: State
	{
		id: toInteger(rowState.id),
		id_country: toInteger(rowState.id_country),
		name: rowState.name

	});

CREATE INDEX state_id FOR (state:State) ON (state.id);


LOAD CSV WITH HEADERS FROM 'file:///city.csv' AS rowCt
WITH rowCt WHERE NOT rowCt.id IS NULL
CREATE(state: State
	{
		id: toInteger(rowCt.id),
		id_state: toInteger(rowCt.id_state),
		name: rowCt.name

	});

CREATE INDEX city_id FOR (city:City) ON (city.id);


LOAD CSV WITH HEADERS FROM 'file:///geological.csv' AS rowGeo
WITH rowGeo WHERE NOT rowGeo.id IS NULL
CREATE(geological: Geological
	{
		id: toInteger(rowGeo.id),
		id_bedrock: toInteger(rowGeo.id_bedrock),
		characteristic: rowGeo.characteristic,
		fracture_spacing: rowGeo.fracture_spacing,
		fault_zone: rowGeo.fault_zone,
		distance_to_fault: rowGeo.distance_to_fault

	});

CREATE INDEX geological_id FOR (geological:Geological) ON (geological.id);


LOAD CSV WITH HEADERS FROM 'file:///bedrock.csv' AS rowBed
WITH rowBed WHERE NOT rowBed.id IS NULL
CREATE(bedrock: Bedrock
	{
		id: toInteger(rowBed.id),
		condition: rowBed.condition,
		type: rowBed.type

	});

CREATE INDEX bedrock_id FOR (bedrock:Bedrock) ON (bedrock.id);


LOAD CSV WITH HEADERS FROM 'file:///coordinates.csv' AS rowCoor
WITH rowCoor WHERE NOT rowCoor.id IS NULL
CREATE(coordinates: Coordinates
	{
		id: toInteger(rowCoor.id),
		x: toFloat(rowCoor.x),
		y: toFloat(rowCoor.y),
		z: toFloat(rowCoor.z),
		lat: toFloat(rowCoor.lat),
		lon: toFloat(rowCoor.lon),
		altitude: toFloat(rowCoor.altitude)

	});

CREATE INDEX coordinates_id FOR (coordinates:Coordinates) ON (coordinates.id);



LOAD CSV WITH HEADERS FROM 'file:///colocation_offset.csv' AS rowCoff
WITH rowCoff WHERE NOT rowCoff.id IS NULL
CREATE(colocation_offset: Colocation_offset
	{
		id: toInteger(rowCoff.id),
		id_station_colocation: toInteger(rowCoff.id_station_colocation),
		offset_x: toFloat(rowCoff.offset_x),
		offset_y: toFloat(rowCoff.offset_y),
		offset_z: toFloat(rowCoff.offset_z),
		date_measure: rowCoff.date_measure

	});

CREATE INDEX colocation_offset_id FOR (colocation_offset:Colocation_offset) ON (colocation_offset.id);


LOAD CSV WITH HEADERS FROM 'file:///monument.csv' AS rowMon
WITH rowMon WHERE NOT rowMon.id IS NULL
CREATE(monument: Monument
	{
		id: toInteger(rowMon.id),
		description: rowMon.description,
		inscription: rowMon.inscription,
		height: toFloat(rowMon.height),
		foundation: rowMon.foundation,
		foundation_depth: rowMon.foundation_depth

	});

CREATE INDEX monument_id FOR (monument:Monument) ON (monument.id);


LOAD CSV WITH HEADERS FROM 'file:///condition.csv' AS rowCon
WITH rowCon WHERE NOT rowCon.id IS NULL
CREATE(condition: Condition
	{
		id: toInteger(rowCon.id),
		id_station: toInteger( rowCon.id_station),
		id_effect: toInteger(rowCon.id_effect),
		date_from: rowCon.date_from,
		date_to: rowCon.date_to,
		degradation: rowCon.degradation,
		comments: rowCon.comments
	});
CREATE INDEX condition_id FOR (condition:Condition) ON (condition.id);


LOAD CSV WITH HEADERS FROM 'file:///effects.csv' AS rowEff
WITH rowEff WHERE NOT rowEff.id IS NULL
CREATE(effects: Effects
	{
		id: toInteger(rowEff.id),
		type: rowEff.type
	});

CREATE INDEX effects_id FOR (effects:Effects) ON (effects.id);


LOAD CSV WITH HEADERS FROM 'file:///instrument_collocation.csv' AS rowIcol
WITH rowIcol WHERE NOT rowIcol.id IS NULL
CREATE(instrument_colocation: Instrument_colocation
	{
		id: toInteger(rowIcol.id),
		id_station: toInteger(rowIcol.id_station),
		type: rowIcol.type,
		status: rowIcol.status,
		date_from: rowIcol.date_from,
		date_to: rowIcol.date_to,
		comment: rowIcol.comment

	});
CREATE INDEX instrument_colocation_id FOR (instrument_colocation:Instrument_colocation) ON (instrument_colocation.id);


LOAD CSV WITH HEADERS FROM 'file:///local_ties.csv' AS rowLties
WITH rowLties WHERE NOT rowLties.id IS NULL
CREATE(local_ties: Local_ties
	{
		id: toInteger(rowLties.id),
		id_station: toInteger(rowLties.id_station),
		name: rowLties.name,
		usage: rowLties.usage,
		cpd_num: rowLties.cpd_num,
		iers_domes: rowLties.iers_domes,
		dx: toFloat(rowLties.dx),
		dy: toFloat(rowLties.dy),
		dz: toFloat(rowLties.dz),
		accuracy: toFloat(rowLties.accuracy),
		survey_method: rowLties.survey_method,
		date_at: rowLties.date_at,
		comment: rowLties.comment

	});

CREATE INDEX local_ties_id FOR (local_ties:Local_ties) ON (local_ties.id);


LOAD CSV WITH HEADERS FROM 'file:///item.csv' AS rowIt
WITH rowIt WHERE NOT rowIt.id IS NULL
CREATE(item: Item
	{
		id: toInteger(rowIt.id),
		id_item_type: toInteger(rowIt.id_item_type),
		id_contact_as_producer: toInteger(rowIt.id_contact_as_producer),
		id_contact_as_owner: toInteger(rowIt.id_contact_as_owner),
		comment: rowIt.comment

	});

CREATE INDEX item_id FOR (item:Item) ON (item.id);


LOAD CSV WITH HEADERS FROM 'file:///item_type.csv' AS rowItype
WITH rowItype WHERE NOT rowItype.id IS NULL
CREATE(item_type: Item_type
	{
		id: toInteger(rowItype.id),
		name: rowItype.name

	});

CREATE INDEX item_type_id FOR (item_type:Item_type) ON (item_type.id);



LOAD CSV WITH HEADERS FROM 'file:///item_type_attribute.csv' AS rowItypeA
WITH rowItypeA WHERE NOT rowItypeA.id IS NULL
CREATE(item_type_attribute: Item_type_attribute
	{
		id: toInteger(rowItypeA.id),
		id_item_type: toInteger(rowItypeA.id_item_type),
		id_attribute: toInteger(rowItypeA.id_attribute)

	});

CREATE INDEX item_type_attribute_id FOR (item_type_attribute:Item_type_attribute) ON (item_type_attribute.id);


LOAD CSV WITH HEADERS FROM 'file:///attribute.csv' AS rowAttr
WITH rowAttr WHERE NOT rowAttr.id IS NULL
CREATE(attribute: Attribute
	{
		id: toInteger(rowAttr.id),
		name: rowAttr.name

	});

CREATE INDEX attribute_id FOR (attribute:Attribute) ON (attribute.id);


LOAD CSV WITH HEADERS FROM 'file:///station_item.csv' AS rowSitem
WITH rowSitem WHERE NOT rowSitem.id IS NULL
CREATE(station_item: Station_item
	{
		id: toInteger(rowSitem.id),
		id_station: toInteger(rowSitem.id_station),
		id_item: toInteger(rowSitem.id_item),
		date_from: rowSitem.date_from,
		date_to: rowSitem.date_to

	});

CREATE INDEX station_item_id FOR (station_item:Station_item) ON (station_item.id);


LOAD CSV WITH HEADERS FROM 'file:///item_attribute.csv' AS rowItAt
WITH rowItAt WHERE NOT rowItAt.id IS NULL
CREATE(item_attribute: Item_attribute
	{
		id: toInteger(rowItAt.id),
		id_item: toInteger(rowItAt.id_item),
		id_attribute: toInteger(rowItAt.id_attribute),
		date_from: rowItAt.date_from,
		date_to: rowItAt.date_to,
		value_varchar: rowItAt.value_varchar,
		value_date: rowItAt.value_date,
		value_numeric: toFloat(rowItAt.value_numeric)

	});

CREATE INDEX item_attribute_id FOR (item_attribute:Item_attribute) ON (item_attribute.id);


//--------------------------document--------------------------

LOAD CSV WITH HEADERS FROM 'file:///document.csv' AS rowDoc
WITH rowDoc WHERE NOT rowDoc.id IS NULL
CREATE(document: Document
	{
		id: toInteger(rowDoc.id),
		date: rowDoc.date,
		title: rowDoc.title,
		desciption: rowDoc.description,
		link: rowDoc.link,
		id_station: toInteger(rowDoc.id_station),
		id_item: toInteger(rowDoc.id_item),
		id_document_type: toInteger(rowDoc.id_document_type)


	});

CREATE INDEX document_id FOR (document:Document) ON (document.id);



LOAD CSV WITH HEADERS FROM 'file:///document_type.csv' AS rowDoctype
WITH rowDoctype WHERE NOT rowDoctype.id IS NULL
CREATE(document_type: Document_type
	{
		id: toInteger(rowDoctype.id),
		name: rowDoctype.name

	});

CREATE INDEX document_type_id FOR (document_type:Document_type) ON (document_type.id);

//---------------------------------Access-Control----------------------


LOAD CSV WITH HEADERS FROM 'file:///user_group_station.csv' AS rowUGS
WITH rowUGS WHERE NOT rowUGS.id IS NULL
CREATE(user_group_station: User_group_station
	{
		id: toInteger(rowUGS.id),
		id_station: toInteger(rowUGS.id_station),
		id_user_group: toInteger(rowUGS.id_user_group)

	});
CREATE INDEX user_group_station_id FOR (user_group_station:User_group_station) ON (user_group_station.id);


LOAD CSV WITH HEADERS FROM 'file:///user_group.csv' AS rowUG
WITH rowUG WHERE NOT rowUG.id IS NULL
CREATE(user_group: User_group
	{
		id: toInteger(rowUG.id),
		name: rowUG.name

	});

CREATE INDEX user_group_id FOR (user_group:User_group) ON (user_group.id);


//--------------------------------LOG-----------------------------------





LOAD CSV WITH HEADERS FROM 'file:///log.csv' AS rowLog
WITH rowLog WHERE NOT rowLog.id IS NULL
CREATE(log: Log
	{
		id: toInteger(rowLog.id),
		title: rowLog.title,
		date: rowLog.date,
		id_log_type: toInteger(rowLog.id_log_type),
		id_station: toInteger(rowLog.id_station),
		modified: rowLog.modified,
		previous: rowLog.previous,
		id_contact: toInteger(rowLog.id_contact)

	});
CREATE INDEX log_id FOR (log:Log) ON (log.id);


LOAD CSV WITH HEADERS FROM 'file:///log_type.csv' AS rowLogT
WITH rowLogT WHERE NOT rowLogT.id IS NULL
CREATE(log_type: Log_type
	{
		id: toInteger(rowLogT.id),
		name: rowLogT.name

	});

CREATE INDEX log_type_id FOR (log_type:Log_type) ON (log_type.id);


//-----------------------------------------------OPERATIONAL-CENTER----------------------------------------------


LOAD CSV WITH HEADERS FROM 'file:///network.csv' AS rowNetw
WITH rowNetw WHERE NOT rowNetw.id IS NULL
CREATE(network: Network
	{
		id: toInteger(rowNetw.id),
		name: rowNetw.name,
		id_contact: toInteger(rowNetw.id_contact)

	});

CREATE INDEX network_id FOR (network:Network) ON (network.id);


LOAD CSV WITH HEADERS FROM 'file:///station_network.csv' AS rowSNetw
WITH rowSNetw WHERE NOT rowSNetw.id IS NULL
CREATE(station_network: Station_network
	{
		id: toInteger(rowSNetw.id),
		id_station: toInteger(rowSNetw.id_station),
		id_network: toInteger(rowSNetw.id_network)

	});

CREATE INDEX station_network_id FOR (station_network:Station_network) ON (station_network.id);


LOAD CSV WITH HEADERS FROM 'file:///station_contact.csv' AS rowSCon
WITH rowSCon WHERE NOT rowSCon.id IS NULL
CREATE(station_contact: Station_contact
	{
		id: toInteger(rowSCon.id),
		id_station: toInteger(rowSCon.id_station),
		id_contact: toInteger(rowSCon.id_contact),
		role: rowSCon.role

	});

CREATE INDEX station_contact_id FOR (station_contact:Station_contact) ON (station_contact.id);


LOAD CSV WITH HEADERS FROM 'file:///agency.csv' AS rowAgen
WITH rowAgen WHERE NOT rowAgen.id IS NULL
CREATE(agency: Agency
	{
		id: toInteger(rowAgen.id),
		name: rowAgen.name,
		abbreviation: rowAgen.abbreviation,
		address: rowAgen.address,
		www: rowAgen.www,
		infos: rowAgen.infos

	});
CREATE INDEX agency_id FOR (agency:Agency) ON (agency.id);



LOAD CSV WITH HEADERS FROM 'file:///contact.csv' AS rowContact
WITH rowContact WHERE NOT rowContact.id IS NULL
CREATE(contact: Contact
	{
		id: toInteger(rowContact.id),
		name: rowContact.name,
		title: rowContact.title,
		email: rowContact.email,
		phone: rowContact.phone,
		gsm: rowContact.gsm,
		comment: rowContact.comment,
		id_agency: toInteger(rowContact.id_agency),
		role: rowContact.role,
		fax: rowContact.fax

	});

CREATE INDEX contact_id FOR (contact:Contact) ON (contact.id);

//-----------------------------------------------------DATA-CENTER-T0----------------------------------------------



LOAD CSV WITH HEADERS FROM 'file:///data_center.csv' AS rowDcenter
WITH rowDcenter WHERE NOT rowDcenter.id IS NULL
CREATE(data_center: Data_center
	{
		id: toInteger(rowDcenter.id),
		acronym: rowDcenter.acronym,
		id_agency: toInteger(rowDcenter.id_agency),
		hostname: rowDcenter.hostname,
		root_path: rowDcenter.root_path,
		name: rowDcenter.name,
		protocol: rowDcenter.protocol

	});

CREATE INDEX data_center_id FOR (data_center:Data_center) ON (data_center.id);


LOAD CSV WITH HEADERS FROM 'file:///datacenter_station.csv' AS rowDcenterST
WITH rowDcenterST WHERE NOT rowDcenterST.id IS NULL
CREATE(data_center_station: Data_center_station
	{
		id: toInteger(rowDcenterST.id),
		id_station: toInteger(rowDcenterST.id_station),
		id_datacenter: toInteger(rowDcenterST.id_datacenter),
		datacenter_type: rowDcenterST.datacenter_type

	});

CREATE INDEX datacenter_station_id FOR (data_center_station:Data_center_station) ON (data_center_station.id);


LOAD CSV WITH HEADERS FROM 'file:///data_center_structure.csv' AS rowDataStructure
WITH rowDataStructure WHERE NOT rowDataStructure.id IS NULL
CREATE(data_center_structure: Data_center_structure
	{
		id: toInteger(rowDataStructure.id),
		id_datacenter: toInteger(rowDataStructure.id_datacenter),
		id_file_type: toInteger(rowDataStructure.id_file_type),
		directory_naming: rowDataStructure.directory_naming,
		comments: rowDataStructure.comments

	});

CREATE INDEX data_center_structure_id FOR (data_center_structure:Data_center_structure) ON (data_center_structure.id);


LOAD CSV WITH HEADERS FROM 'file:///node_data_center.csv' AS rowDataNode
WITH rowDataNode WHERE NOT rowDataNode.id IS NULL
CREATE(node_data_center: Node_data_center
	{
		id: toInteger(rowDataNode.id),
		id_node: toInteger(rowDataNode.id_node),
		id_data_center: toInteger(rowDataNode.id_data_center)

	});

CREATE INDEX node_data_center_id FOR (node_data_center:Node_data_center) ON (node_data_center.id);


LOAD CSV WITH HEADERS FROM 'file:///node_rinex_file.csv' AS rowRinex
WITH rowRinex WHERE NOT rowRinex.id IS NULL
CREATE(node_rinex_file: Node_rinex_file
	{
		id: toInteger(rowRinex.id),
		id_node: toInteger(rowRinex.id_node),
		id_rinex_file: toInteger(rowRinex.id_rinex_file)

	});

CREATE INDEX node_rinex_file_id FOR (node_rinex_file:Node_rinex_file) ON (node_rinex_file.id);


LOAD CSV WITH HEADERS FROM 'file:///failed_queries.csv' AS rowFail
WITH rowFail WHERE NOT rowFail.id IS NULL
CREATE(failed_queries: Failed_queries
	{
		id: toInteger(rowFail.id),
		query: rowFail.query,
		destiny: toInteger(rowFail.destiny),
		timestamp: rowFail.timestamp,
		reason: rowFail.reason

	});

CREATE INDEX failed_queries_id FOR (failed_queries:Failed_queries) ON (failed_queries.id);


LOAD CSV WITH HEADERS FROM 'file:///queries.csv' AS rowQuery
WITH rowQuery WHERE NOT rowQuery.id IS NULL
CREATE(queries: Queries
	{
		id: toInteger(rowQuery.id),
		query: rowQuery.query,
		metadata: rowQuery.metadata,
		station_id: toInteger(rowQuery.station_id),
		destiny: toInteger(rowQuery.destiny)


	});

CREATE INDEX queries_id FOR (queries:Queries) ON (queries.id);


LOAD CSV WITH HEADERS FROM 'file:///connections.csv' AS rowConnections
WITH rowConnections WHERE NOT rowConnections.id IS NULL
CREATE(connections: Connections
	{
		id: toInteger(rowConnections.id),
		source: toInteger(rowConnections.query),
		destiny: toInteger(rowConnections.destiny),
		station: toInteger(rowConnections.station),
		metadata: rowConnections.metadata
		
	});

CREATE INDEX connections_id FOR (connections:Connections) ON (connections.id);



LOAD CSV WITH HEADERS FROM 'file:///node.csv' AS rowNode
WITH rowNode WHERE NOT rowNode.id IS NULL
CREATE(node: Node
	{
		id: toInteger(rowNode.id),
		name: rowNode.name,
		host: rowNode.host,
		port: rowNode.port,
		dbname: rowNode.dbname,
		username: rowNode.username,
		password: rowNode.password,
		url: rowNode.url,
		email: rowNode.email,
		contact_name: rowNode.contact_name

	});

CREATE INDEX node_id FOR (node: Node) ON (node.id);


LOAD CSV WITH HEADERS FROM 'file:///service.csv' AS rowService
WITH rowService WHERE NOT rowService.id IS NULL
CREATE(service: Service
	{
		id: toInteger(rowService.id),
		name: rowService.name,
		version: toFloat(rowService.version),
		comments: rowService.comments,
		createdon: rowService.createdon,
		updateon: rowService.updateon


	});

CREATE INDEX service_id FOR (service:Service) ON (service.id);



//------------------------------------ Data-files-T2-------------------------------------------------------------


LOAD CSV WITH HEADERS FROM 'file:///rinex_file.csv' AS rowRinexF
WITH rowRinexF WHERE NOT rowRinexF.id IS NULL
CREATE(rinex_file: Rinex_file
	{
		id: toInteger(rowRinexF.id),
		name: rowRinexF.name,
		id_data_center: toInteger(rowRinexF.id_data_center),
		id_data_center_structure: toInteger(rowRinexF.id_data_center_structure),
		file_size: toInteger(rowRinexF.file_size),
		id_file_type: toInteger(rowRinexF.id_file_type),
		relative_path: rowRinexF.relative_path,
		reference_date: rowRinexF.reference_date,
		creation_date: rowRinexF.creation_date,
		published_date: rowRinexF.published_date,
		revision_date: rowRinexF.revision_date,
		md5checksum: rowRinexF.md5checksum,
		md5uncompressed: rowRinexF.md5uncompressed,
		status: toInteger(rowRinexF.status)


	});

CREATE INDEX rinex_file_id FOR (rinex_file:Rinex_file) ON (rinex_file.id);


LOAD CSV WITH HEADERS FROM 'file:///quality_file.csv' AS rowQualF
WITH rowQualF WHERE NOT rowQualF.id IS NULL
CREATE(quality_file: Quality_file
	{
		id: toInteger(rowQualF.id),
		name: rowQualF.name,
		id_data_center_structure: toInteger(rowQualF.id_data_center_structure),
		id_rinex_file: toInteger(rowQualF.id_rinex_file),
		file_size: toInteger(rowQualF.file_size),
		id_file_type: toInteger(rowQualF.id_file_type),
		relative_path: rowQualF.relative_path,
		creation_date: rowQualF.creation_date,
		revision_date: rowQualF.revision_date,
		md5checksum: rowQualF.md5checksum,
		status: toInteger(rowQualF.status)


	});

CREATE INDEX quality_file_id FOR (quality_file:Quality_file) ON (quality_file.id);


LOAD CSV WITH HEADERS FROM 'file:///other_files.csv' AS rowOtherF
WITH rowOtherF WHERE NOT rowOtherF.id IS NULL
CREATE(other_file: Other_file
	{
		id: toInteger(rowOtherF.id),
		name: rowOtherF.name,
		id_data_center_structure: toInteger(rowOtherF.id_data_center_structure),
		id_rinex_file: toInteger(rowOtherF.id_rinex_file),
		file_size: toInteger(rowOtherF.file_size),
		id_file_type: toInteger(rowOtherF.id_file_type),
		relative_path: rowOtherF.relative_path,
		creation_date: rowOtherF.creation_date,
		revision_date: rowOtherF.revision_date,
		md5checksum: rowOtherF.md5checksum,
		status: toInteger(rowOtherF.status)


	});

CREATE INDEX other_file_id FOR (other_file:Other_file) ON (other_file.id);


LOAD CSV WITH HEADERS FROM 'file:///file_type.csv' AS rowFtype
WITH rowFtype WHERE NOT rowFtype.id IS NULL
CREATE(file_type: File_type
	{
		id: toInteger(rowFtype.id),
		format: rowFtype.format,
		sampling_window: rowFtype.sampling_window,
		sampling_frequency: rowFtype.sampling_frequency


	});

CREATE INDEX file_type_id FOR (file_type:File_type) ON (file_type.id);


LOAD CSV WITH HEADERS FROM 'file:///rinex_errors.csv' AS rowRinexErrors
WITH rowRinexErrors WHERE NOT rowRinexErrors.id IS NULL
CREATE(rinex_errors: Rinex_errors
	{
		id: toInteger(rowRinexErrors.id),
		id_rinex_file: toInteger(rowRinexErrors.id_rinex_file),
		id_error_type: toInteger(rowRinexErrors.id_error_type)

	});

CREATE INDEX rinex_errors_id FOR (rinex_errors:Rinex_errors) ON (rinex_errors.id);



LOAD CSV WITH HEADERS FROM 'file:///rinex_error_types.csv' AS rowRinexErrorsT
WITH rowRinexErrorsT WHERE NOT rowRinexErrorsT.id IS NULL
CREATE(rinex_error_types: Rinex_error_types
	{
		id: toInteger(rowRinexErrorsT.id),
		error_type: rowRinexErrorsT.error_type

	});

CREATE INDEX rinex_error_types_id FOR (rinex_error_types:Rinex_error_types) ON (rinex_error_types.id);


LOAD CSV WITH HEADERS FROM 'file:///file_generated.csv' AS rowFileGen
WITH rowFileGen WHERE NOT rowFileGen.id IS NULL
CREATE(file_generated: File_generated
	{
		id: toInteger(rowFileGen.id),
		id_station: toInteger(rowFileGen.id_station),
		id_file_type: toInteger(rowFileGen.id_file_type)

	});

CREATE INDEX file_generated_id FOR (file_generated:File_generated) ON (file_generated.id);

//---------------------------------------Quality-control-T3-------------------------------------------------------


LOAD CSV WITH HEADERS FROM 'file:///qc_constellation_summary.csv' AS rowConsSummary
WITH rowConsSummary WHERE NOT rowConsSummary.id IS NULL
CREATE(qc_constellation_summary: Qc_constellation_summary
	{
		id: toInteger(rowConsSummary.id),
		id_qc_report_summary: toInteger(rowConsSummary.id_qc_report_summary),
		id_constellation: toInteger(rowConsSummary.id_constellation),
		nsat: toInteger(rowConsSummary.nsat),
		xele: toInteger(rowConsSummary.xele),
		epo_expt: toInteger(rowConsSummary.epo_expt),
		epo_have: toInteger(rowConsSummary.epo_have),
		epo_usbl: toInteger(rowConsSummary.epo_usbl),
		xcod_epo: toInteger(rowConsSummary.xcod_epo),
		xcod_sat:toInteger(rowConsSummary.xcod_sat),
		xpha_epo: toInteger(rowConsSummary.xpha_epo),
		xpha_sat: toInteger(rowConsSummary.xpha_sat),
		xint_epo: toInteger(rowConsSummary.xint_epo),
		xint_sat: toInteger(rowConsSummary.xint_sat),
		xint_sig: toInteger(rowConsSummary.xint_sig),
		xint_slp: toInteger(rowConsSummary.xint_slp),
		x_crd: toFloat(rowConsSummary.x_crd),
		y_crd: toFloat(rowConsSummary.y_crd),
		z_crd: toFloat(rowConsSummary.z_crd),
		x_rms: toFloat(rowConsSummary.x_rms),
		y_rms: toFloat(rowConsSummary.y_rms),
		z_rms: toFloat(rowConsSummary.z_rms)

	});

CREATE INDEX qc_constellation_summary_id FOR (qc_constellation_summary:Qc_constellation_summary) ON (qc_constellation_summary.id);



LOAD CSV WITH HEADERS FROM 'file:///qc_report_summary.csv' AS rowRepSummary
WITH rowRepSummary WHERE NOT rowRepSummary.id IS NULL
CREATE(qc_report_summary: Qc_report_summary
	{
		id: toInteger(rowRepSummary.id),
		id_rinexfile: toInteger(rowRepSummary.id_rinexfile),
		id_qc_parameters: toInteger(rowRepSummary.id_qc_parameters),
		date_beg: rowRepSummary.date_beg,
		date_end: rowRepSummary.date_end,
		date_smp: toFloat(rowRepSummary.date_smp),
		obs_elev: toFloat(rowRepSummary.obs_elev),
		obs_have: toInteger(rowRepSummary.obs_have),
		obs_expt: toInteger(rowRepSummary.obs_expt),
		user_have: toInteger(rowRepSummary.user_have),
		user_expt: toInteger(rowRepSummary.user_expt),
		cyc_slps: toInteger(rowRepSummary.cyc_slps),
		clk_jmps: toInteger(rowRepSummary.clk_jmps),
		xbeg: toInteger(rowRepSummary.xbeg),
		xend: toInteger(rowRepSummary.xend),
		xint: toInteger(rowRepSummary.xint),
		xsys: toInteger(rowRepSummary.xsys)
	});

CREATE INDEX qc_report_summary_id FOR (qc_report_summary:Qc_report_summary) ON (qc_report_summary.id);



LOAD CSV WITH HEADERS FROM 'file:///qc_parameters.csv' AS rowQcPar
WITH rowQcPar WHERE NOT rowQcPar.id IS NULL
CREATE(qc_parameters: Qc_parameters
	{
		id: toInteger(rowQcPar.id),
		software_name: rowQcPar.software_name,
		software_version: rowQcPar.software_version,
		elevation_cutoff: toInteger(rowQcPar.elevation_cutoff),
		gps: rowQcPar.gps,
		glo: rowQcPar.glo,
		gal: rowQcPar.gal,
		bds: rowQcPar.bds,
		qzs: rowQcPar.qzs,
		sbs: rowQcPar.sbs,
		nav_gps: rowQcPar.nav_gps,
		nav_glo: rowQcPar.nav_glo,
		nav_gal: rowQcPar.nav_gal,
		nav_bds: rowQcPar.nav_bds,
		nav_qzs: rowQcPar.nav_qzs,
		nav_sbs: rowQcPar.nav_sbs
	});

CREATE INDEX qc_parameters_id FOR (qc_parameters:Qc_parameters) ON (qc_parameters.id);



LOAD CSV WITH HEADERS FROM 'file:///qc_navigation_msg.csv' AS rowNavMsg
WITH rowNavMsg WHERE NOT rowNavMsg.id IS NULL
CREATE(qc_navigation_msg: Qc_navigation_msg
	{
		id: toInteger(rowNavMsg.id),
		id_qc_report_summary: toInteger(rowNavMsg.id_qc_report_summary),
		id_constellation: toInteger(rowNavMsg.id_constellation),
		nsat: toInteger(rowNavMsg.nsat),
		have: toInteger(rowNavMsg.have)
	});


CREATE INDEX qc_navigation_msg_id FOR (qc_navigation_msg:Qc_navigation_msg) ON (qc_navigation_msg.id);

LOAD CSV WITH HEADERS FROM 'file:///constellations.csv' AS rowConstellation
WITH rowConstellation WHERE NOT rowConstellation.id IS NULL
CREATE(constellation: Constellation
	{
		id: toInteger(rowConstellation.id),
		identifier_1ch: rowConstellation.identifier_1ch,
		identifier_3ch: rowConstellation.identifier_3ch,
		name: rowConstellation.name,
		official: rowConstellation.official
	});

CREATE INDEX constellation_id FOR (constellation:Constellation) ON (constellation.id);


LOAD CSV WITH HEADERS FROM 'file:///gnss_obsnames.csv' AS rowGnssObs
WITH rowGnssObs WHERE NOT rowGnssObs.id IS NULL
CREATE(gnss_obsnames: Gnss_obsnames
	{
		id: toInteger(rowGnssObs.id),
		name: rowGnssObs.name,
		frequency_band: toInteger(rowGnssObs.frequency_band),
		obstype: rowGnssObs.obstype,
		channel: rowGnssObs.channel,
		official: rowGnssObs.official

	});

CREATE INDEX gnss_obsnames_id FOR (gnss_obsnames:Gnss_obsnames) ON (gnss_obsnames.id);


LOAD CSV WITH HEADERS FROM 'file:///qc_observation_summary_c.csv' AS rowQCObsc
WITH rowQCObsc WHERE NOT rowQCObsc.id IS NULL
CREATE(qc_observation_summary_c: Qc_observation_summary_c
	{
		id: toInteger(rowQCObsc.id),
		id_qc_constellation_summary: toInteger(rowQCObsc.id_qc_constellation_summary),
		id_gnss_obsnames: toInteger(rowQCObsc.id_gnss_obsnames),
		obs_stats: toInteger(rowQCObsc.obs_stats),
		obs_have: toInteger(rowQCObsc.obs_have),
		obs_expt: toInteger(rowQCObsc.obs_expt),
		user_have: toInteger(rowQCObsc.user_have),
		user_expt: toInteger(rowQCObsc.user_expt),
		cod_mpth: toFloat(rowQCObsc.codmpth)
	});

CREATE INDEX qc_observation_summary_c_id FOR (qc_observation_summary_c:Qc_observation_summary_c) ON (qc_observation_summary_c.id);



LOAD CSV WITH HEADERS FROM 'file:///qc_observation_summary_d.csv' AS rowQCObsd
WITH rowQCObsd WHERE NOT rowQCObsd.id IS NULL
CREATE(qc_observation_summary_d: Qc_observation_summary_d
	{
		id: toInteger(rowQCObsd.id),
		id_qc_constellation_summary: toInteger(rowQCObsd.id_qc_constellation_summary),
		id_gnss_obsnames: toInteger(rowQCObsd.id_gnss_obsnames),
		obs_stats: toInteger(rowQCObsd.obs_stats),
		obs_have: toInteger(rowQCObsd.obs_have),
		obs_expt: toInteger(rowQCObsd.obs_expt),
		user_have: toInteger(rowQCObsd.user_have),
		user_expt: toInteger(rowQCObsd.user_expt)
	});


CREATE INDEX qc_observation_summary_d_id FOR (qc_observation_summary_d:Qc_observation_summary_d) ON (qc_observation_summary_d.id);

LOAD CSV WITH HEADERS FROM 'file:///qc_observation_summary_s.csv' AS rowQCObss
WITH rowQCObss WHERE NOT rowQCObss.id IS NULL
CREATE(qc_observation_summary_s: Qc_observation_summary_s
	{
		id: toInteger(rowQCObss.id),
		id_qc_constellation_summary: toInteger(rowQCObss.id_qc_constellation_summary),
		id_gnss_obsnames: toInteger(rowQCObss.id_gnss_obsnames),
		obs_stats: toInteger(rowQCObss.obs_stats),
		obs_have: toInteger(rowQCObss.obs_have),
		obs_expt: toInteger(rowQCObss.obs_expt),
		user_have: toInteger(rowQCObss.user_have),
		user_expt: toInteger(rowQCObss.user_expt)
	});

CREATE INDEX qc_observation_summary_s_id FOR (qc_observation_summary_s:Qc_observation_summary_s) ON (qc_observation_summary_s.id);


LOAD CSV WITH HEADERS FROM 'file:///qc_observation_summary_l.csv' AS rowQCObsl
WITH rowQCObsl WHERE NOT rowQCObsl.id IS NULL
CREATE(qc_observation_summary_l: Qc_observation_summary_l
	{
		id: toInteger(rowQCObsl.id),
		id_qc_constellation_summary: toInteger(rowQCObsl.id_qc_constellation_summary),
		id_gnss_obsnames: toInteger(rowQCObsl.id_gnss_obsnames),
		obs_stats: toInteger(rowQCObsl.obs_stats),
		obs_have: toInteger(rowQCObsl.obs_have),
		obs_expt: toInteger(rowQCObsl.obs_expt),
		user_have: toInteger(rowQCObsl.user_have),
		user_expt: toInteger(rowQCObsl.user_expt),
		pha_slps: toInteger(rowQCObsl.pha_slps)
	});

CREATE INDEX qc_observation_summary_l_id FOR (qc_observation_summary_l:Qc_observation_summary_l) ON (qc_observation_summary_l.id);



