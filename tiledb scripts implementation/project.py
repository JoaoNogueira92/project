import pandas as pd
import tiledb

#METHOD_IDENTIFICATION-------------------------------------------------
csv_file = "/home/joao/Desktop/project/csvs/method_identification.csv"

# Define the desired data types for each attribute
dtype = {
    "id": "int32",
    "creation_date": "object",
    "doi": "str",
    "software": "str",
    "id_analysis_centers": "int32",
    "id_reference_frame": "int32",
    "version": "float32",
    "data_type": "str"
}

# Specify the columns to parse as dates
parse_dates = ["creation_date"]

# Read the CSV file using pandas
df = pd.read_csv(csv_file, dtype=dtype, parse_dates=parse_dates)

# Create the TileDB array from the DataFrame
tiledb.from_pandas("method_identification_array", df)


#REFERENCE POSITION VALUES-----------------------------------------------------
csv_file = "/home/joao/Desktop/project/csvs/reference_position_values.csv"

# Define the desired data types for each attribute
dtype = {
    "id": "int32",
    "velx": "float32",
    "vely": "float32",
    "velz": "float32",
    "velx_sigma": "float32",
    "vely_sigma": "float32",
    "velz_sigma": "float32",
    "vel_rho_xy": "float32",
    "vel_rho_xz": "float32",
    "vel_rho_yz": "float32",
    "reference_position_x": "float32",
    "reference_position_y": "float32",
    "reference_position_z": "float32",
    "reference_position_x_sigma": "float32",
    "reference_position_y_sigma": "float32",
    "reference_position_z_sigma": "float32",
    "reference_position_rho_xy": "float32",
    "reference_position_rho_xz": "float32",
    "reference_position_rho_yz": "float32",
    "start_epoch": "str",
    "end_epoch": "str",
    "ref_epoch": "str",
    "id_station": "int32",
    "id_product_files": "int32",
    "id_method_identification": "int32",
}

# Specify the columns to parse as dates
parse_dates = ["start_epoch", "end_epoch", "ref_end"]

# Read the CSV file using pandas
df = pd.read_csv(csv_file, dtype=dtype, parse_dates=parse_dates)

# Create the TileDB array from the DataFrame
tiledb.from_pandas("reference_position_values_array", df)



#ESTIMATED COORDINATES--------------------------------------------------
csv_file = "/home/joao/Desktop/project/csvs/estimated_coordinates.csv"

# Define the desired data types for each attribute
dtype = {
    "id": "int32",
    "x": "float32",
    "y": "float32",
    "z": "float32",
    "var_xx": "float32",
    "var_yy": "float32",
    "var_zz": "float32",
    "var_xy": "float32",
    "var_xz": "float32",
    "var_yz": "float32",
    "outlier": "int32",
    "epoch": "str",
    "id_processing_parameters": "int32",
    "id_method_identification": "int32",
    "id_station": "int32",
    "id_product_files": "int32"
}

# Specify the columns to parse as dates
parse_dates = ["epoch"]

# Read the CSV file using pandas
df = pd.read_csv(csv_file, dtype=dtype, parse_dates=parse_dates)


# Create the TileDB array from the DataFrame
tiledb.from_pandas("estimated_coordinates_array_2", df)


#REFERENCE FRAME-------------------------------------------------------
csv_file = "/home/joao/Desktop/project/csvs/reference_frame.csv"

# Define the desired data types for each attribute
dtype = {
    "id": "int32",
    "name": "str",
    "epoch": "str",

}

# Specify the columns to parse as dates
parse_dates = ["epoch"]

# Read the CSV file using pandas
df = pd.read_csv(csv_file, dtype=dtype, parse_dates=parse_dates)

# Create the TileDB array from the DataFrame
tiledb.from_pandas("reference_frame_array", df)

#ANALYSIS CENTERS---------------------------------------------------------
csv_file = "/home/joao/Desktop/project/csvs/analysis_centers.csv"

# Define the desired data types for each attribute
dtype = {
    "id": "int32",
    "name": "str",
    "abbreviation": "str",
    "contact": "str",
    "email": "str",
    "url": "str"

}

# Specify the columns to parse as dates
parse_dates = ["epoch"]

# Read the CSV file using pandas
df = pd.read_csv(csv_file, dtype=dtype)

# Create the TileDB array from the DataFrame
tiledb.from_pandas("analysis_cente_array", df)


# HELMERT---------------------------------------------------------------------


csv_file = "/home/joao/Desktop/project/csvs/helmert.csv"

# Define the desired data types for each attribute
dtype = {
    "id": "int32",
    "cx": "float32",
    "cy": "float32",
    "cz": "float32",
    "scale": "float32",
    "rx": "float32",
    "ry": "float32",
    "rz": "float32",
    "id_analysis_centers": "int32",
    "id_old_frame": "int32",
    "id_new_frame": "int32"

}


# Read the CSV file using pandas
df = pd.read_csv(csv_file, dtype=dtype)

# Create the TileDB array from the DataFrame
tiledb.from_pandas("helmert_array", df)


#STATION------------------------------------------------------------


csv_file = "/home/joao/Desktop/project/csvs/stations.csv"

# Define the desired data types for each attribute
dtype = {
    "id": "int32",
    "name": "str",
    "marker": "str",
    "description": "str",
    "date_from": "str",
    "date_to": "str",
    "id_station_type": "int32",
    "comment": "str",
    "id_location": "int32",
    "id_geological": "int32",
    "id_monument": "int32",
    "ires_domes": "str",
    "cpd_num": "int32",
    "monument_num": "int32",
    "receiver_num": "int32",
    "country_code": "int32"

}

# Specify the columns to parse as dates
parse_dates = ["date_from", "date_to"]

# Read the CSV file using pandas
df = pd.read_csv(csv_file, dtype=dtype, parse_dates)

# Create the TileDB array from the DataFrame
tiledb.from_pandas("stations_array", df)

#STATION------------------------------------------------------------


csv_file = "/home/joao/Desktop/project/csvs/tectonic.csv"

# Define the desired data types for each attribute
dtype = {
    "id": "int32",
    "plate_name": "str",

}

# Read the CSV file using pandas
df = pd.read_csv(csv_file, dtype=dtype)

# Create the TileDB array from the DataFrame
tiledb.from_pandas("tectonic_array", df)

#STATION------------------------------------------------------------


csv_file = "/home/joao/Desktop/project/csvs/location.csv"

# Define the desired data types for each attribute
dtype = {
    "id": "int32",
    "id_city": "int32",
    "id_coordinates": "int32",
    "id_tectonic": "int32",
    "description": "str",

}

# Read the CSV file using pandas
df = pd.read_csv(csv_file, dtype=dtype)

# Create the TileDB array from the DataFrame
tiledb.from_pandas("location_array", df)


#STATION_TYPE------------------------------------------------------------


csv_file = "/home/joao/Desktop/project/csvs/station_type.csv"

# Define the desired data types for each attribute
dtype = {
    "id": "int32",
    "id_station": "int32",
    "id_station_colocated": "int32"

}

# Read the CSV file using pandas
df = pd.read_csv(csv_file, dtype=dtype)

# Create the TileDB array from the DataFrame
tiledb.from_pandas("station_type_array", df)



#STATION_COLOCATION------------------------------------------------------------


csv_file = "/home/joao/Desktop/project/csvs/station_colocation.csv"

# Define the desired data types for each attribute
dtype = {
    "id": "int32",
    "id_station": "int32",
    "id_station_colocated": "int32"

}

# Read the CSV file using pandas
df = pd.read_csv(csv_file, dtype=dtype)

# Create the TileDB array from the DataFrame
tiledb.from_pandas("station_colocation_array", df)


#COUNTRY------------------------------------------------------------


csv_file = "/home/joao/Desktop/project/csvs/country.csv"

# Define the desired data types for each attribute
dtype = {
    "id": "int32",
    "name": "str",
    "iso_code": "str"

}

# Read the CSV file using pandas
df = pd.read_csv(csv_file, dtype=dtype)

# Create the TileDB array from the DataFrame
tiledb.from_pandas("country_array", df)


#STATE------------------------------------------------------------


csv_file = "/home/joao/Desktop/project/csvs/state.csv"

# Define the desired data types for each attribute
dtype = {
    "id": "int32",
    "id_country": "int32",
    "name": "str"

}

# Read the CSV file using pandas
df = pd.read_csv(csv_file, dtype=dtype)

# Create the TileDB array from the DataFrame
tiledb.from_pandas("state_array", df)


#CITY------------------------------------------------------------


csv_file = "/home/joao/Desktop/project/csvs/city.csv"

# Define the desired data types for each attribute
dtype = {
    "id": "int32",
    "id_state": "int32",
    "name": "str"

}

# Read the CSV file using pandas
df = pd.read_csv(csv_file, dtype=dtype)

# Create the TileDB array from the DataFrame
tiledb.from_pandas("city_array", df)


#GEOLOGICAL------------------------------------------------------------


csv_file = "/home/joao/Desktop/project/csvs/geological.csv"

# Define the desired data types for each attribute
dtype = {
    "id": "int32",
    "id_bedrock": "int32",
    "characteristics": "str",
    "fracture_spacing": "str",
    "fault_zone": "str",
    "distance_to_fault": "str"

}

# Read the CSV file using pandas
df = pd.read_csv(csv_file, dtype=dtype)

# Create the TileDB array from the DataFrame
tiledb.from_pandas("geological_array", df)


#BEDROCK------------------------------------------------------------


csv_file = "/home/joao/Desktop/project/csvs/bedrock.csv"

# Define the desired data types for each attribute
dtype = {
    "id": "int32",
    "condition": "str",
    "type": "str"

}

# Read the CSV file using pandas
df = pd.read_csv(csv_file, dtype=dtype)

# Create the TileDB array from the DataFrame
tiledb.from_pandas("bedrock_array", df)


#BEDROCK------------------------------------------------------------


csv_file = "/home/joao/Desktop/project/csvs/coordinates.csv"

# Define the desired data types for each attribute
dtype = {
    "id": "int32",
    "x": "float32",
    "y": "float32",
    "z": "float32",
    "lat": "float32",
    "lon": "float32",
    "altitude": "float32"

}

# Read the CSV file using pandas
df = pd.read_csv(csv_file, dtype=dtype)

# Create the TileDB array from the DataFrame
tiledb.from_pandas("coordinates_array", df)


#COLOCATION_OFFSET------------------------------------------------------------


csv_file = "/home/joao/Desktop/project/csvs/colocation_offset.csv"

# Define the desired data types for each attribute
dtype = {
    "id": "int32",
    "id_station_colocation": "int32",
    "offset_x": "float32",
    "offset_y": "float32",
    "offset_z": "float32",
    "date_measure": "str"

}

# Specify the columns to parse as dates
parse_dates = ["date_measure"]

# Read the CSV file using pandas
df = pd.read_csv(csv_file, dtype=dtype, parse_dates)

# Create the TileDB array from the DataFrame
tiledb.from_pandas("colocation_offset_array", df)


#MONUMENT------------------------------------------------------------


csv_file = "/home/joao/Desktop/project/csvs/monument.csv"

# Define the desired data types for each attribute
dtype = {
    "id": "int32",
    "description": "str",
    "inscription": "str",
    "height": "float32",
    "foundation": "str",
    "foundation_depth": "str"

}

# Specify the columns to parse as dates
parse_dates = ["date_measure"]

# Read the CSV file using pandas
df = pd.read_csv(csv_file, dtype=dtype)

# Create the TileDB array from the DataFrame
tiledb.from_pandas("monument_array", df)


#CONDITION------------------------------------------------------------


csv_file = "/home/joao/Desktop/project/csvs/condition.csv"

# Define the desired data types for each attribute
dtype = {
    "id": "int32",
    "id_station": "int32",
    "id_effect": "int32",
    "date_from": "str",
    "date_to": "str",
    "degradation": "str",
    "comments": "str"

}

# Specify the columns to parse as dates
parse_dates = ["date_from", "date_to"]

# Read the CSV file using pandas
df = pd.read_csv(csv_file, dtype=dtype, parse_dates)

# Create the TileDB array from the DataFrame
tiledb.from_pandas("condition_array", df)

#EFFECTS------------------------------------------------------------


csv_file = "/home/joao/Desktop/project/csvs/effects.csv"

# Define the desired data types for each attribute
dtype = {
    "id": "int32",
    "type": "str"

}

# Read the CSV file using pandas
df = pd.read_csv(csv_file, dtype=dtype)

# Create the TileDB array from the DataFrame
tiledb.from_pandas("effects_array", df)


#COLOCATION_OFFSET------------------------------------------------------------


csv_file = "/home/joao/Desktop/project/csvs/instrument_collocation.csv"

# Define the desired data types for each attribute
dtype = {
    "id": "int32",
    "id_station": "int32",
    "type": "str",
    "status": "str",
    "date_from": "str",
    "date_to": "str",
    "comment": "str"

}

# Specify the columns to parse as dates
parse_dates = ["date_from", "date_to"]

# Read the CSV file using pandas
df = pd.read_csv(csv_file, dtype=dtype, parse_dates)

# Create the TileDB array from the DataFrame
tiledb.from_pandas("instrument_collocation_array", df)


#LOCAL_TIES------------------------------------------------------------


csv_file = "/home/joao/Desktop/project/csvs/local_ties.csv"

# Define the desired data types for each attribute
dtype = {
    "id": "int32",
    "id_station": "int32",
    "name": "str",
    "usage": "str",
    "cpd_num": "str",
    "ires_domes": "str",
    "dx": "float32",
    "dy": "float32",
    "dz": "float32",
    "accuracy": "float32",
    "survey_method": "str",
    "date_at": "str",
    "comment": "str"

}

# Specify the columns to parse as dates
parse_dates = ["date_at"]

# Read the CSV file using pandas
df = pd.read_csv(csv_file, dtype=dtype, parse_dates)

# Create the TileDB array from the DataFrame
tiledb.from_pandas("local_ties_array", df)


#ITEM------------------------------------------------------------


csv_file = "/home/joao/Desktop/project/csvs/item.csv"

# Define the desired data types for each attribute
dtype = {
    "id": "int32",
    "id_item_type": "int32",
    "id_contact_as_producer": "int32",
    "id_contact_as_owner": "int32",
    "comment": "str"


}

# Read the CSV file using pandas
df = pd.read_csv(csv_file, dtype=dtype)

# Create the TileDB array from the DataFrame
tiledb.from_pandas("item_array", df)


#ITEM_TYPE------------------------------------------------------------


csv_file = "/home/joao/Desktop/project/csvs/item_type.csv"

# Define the desired data types for each attribute
dtype = {
    "id": "int32",
    "name": "str"
}



# Read the CSV file using pandas
df = pd.read_csv(csv_file, dtype=dtype)

# Create the TileDB array from the DataFrame
tiledb.from_pandas("item_type_array", df)

#ITEM_TYPE_ATTRIBUTE------------------------------------------------------------


csv_file = "/home/joao/Desktop/project/csvs/item_type_attribute.csv"

# Define the desired data types for each attribute
dtype = {
    "id": "int32",
    "id_item_type": "int32",
    "id_attribute": "int32",

}

# Read the CSV file using pandas
df = pd.read_csv(csv_file, dtype=dtype)

# Create the TileDB array from the DataFrame
tiledb.from_pandas("item_type_attribute_array", df)


#COLOCATION_OFFSET------------------------------------------------------------


csv_file = "/home/joao/Desktop/project/csvs/colocation_offset.csv"

# Define the desired data types for each attribute
dtype = {
    "id": "int32",
    "id_station_colocation": "int32",
    "offset_x": "float32",
    "offset_y": "float32",
    "offset_z": "float32",
    "date_measure": "str"

}

# Specify the columns to parse as dates
parse_dates = ["date_measure"]

# Read the CSV file using pandas
df = pd.read_csv(csv_file, dtype=dtype, parse_dates)

# Create the TileDB array from the DataFrame
tiledb.from_pandas("colocation_offset_array", df)


#ATTRIBUTE------------------------------------------------------------


csv_file = "/home/joao/Desktop/project/csvs/attribute.csv"

# Define the desired data types for each attribute
dtype = {
    "id": "int32",
    "name": "str"


}

# Read the CSV file using pandas
df = pd.read_csv(csv_file, dtype=dtype)

# Create the TileDB array from the DataFrame
tiledb.from_pandas("attribute_array", df)


#STATION_ITEM------------------------------------------------------------


csv_file = "/home/joao/Desktop/project/csvs/station_item.csv"

# Define the desired data types for each attribute
dtype = {
    "id": "int32",
    "id_station": "int32",
    "id_item": "int32",
    "date_from": "str",
    "date_to": "str"

}

# Specify the columns to parse as dates
parse_dates = ["date_from", "date_to"]

# Read the CSV file using pandas
df = pd.read_csv(csv_file, dtype=dtype, parse_dates)

# Create the TileDB array from the DataFrame
tiledb.from_pandas("station_item_array", df)


#ITEM_ATTRIBUTE------------------------------------------------------------


csv_file = "/home/joao/Desktop/project/csvs/item_attribute.csv"

# Define the desired data types for each attribute
dtype = {
    "id": "int32",
    "id_item": "int32",
    "id_attribute": "float32",
    "date_from": "float32",
    "date_to": "float32",
    "value_varchar": "str",
    "value_date": "str",
    "value_numeric": "float32"

}

# Specify the columns to parse as dates
parse_dates = ["date_from", "date_to"]

# Read the CSV file using pandas
df = pd.read_csv(csv_file, dtype=dtype, parse_dates)

# Create the TileDB array from the DataFrame
tiledb.from_pandas("item_attribute_array", df)


#DOCUMENT---------------------------------------------------------------

csv_file = "/home/joao/Desktop/project/csvs/document.csv"

# Define the desired data types for each attribute
dtype = {
    "id": "int32",
    "date": "str",
    "title": "str",
    "description": "str",
    "link": "str",
    "id_station": "int32",
    "id_item": "int32",
    "id_document_type": "int32"

}

# Specify the columns to parse as dates
parse_dates = ["date"]

# Read the CSV file using pandas
df = pd.read_csv(csv_file, dtype=dtype, parse_dates)

# Create the TileDB array from the DataFrame
tiledb.from_pandas("document_array", df)

#DOCUMENT_TYPE------------------------------------------------------------


csv_file = "/home/joao/Desktop/project/csvs/document_type.csv"

# Define the desired data types for each attribute
dtype = {
    "id": "int32",
    "name": "str"

}


# Read the CSV file using pandas
df = pd.read_csv(csv_file, dtype=dtype)

# Create the TileDB array from the DataFrame
tiledb.from_pandas("document_type_array", df)


#USER_GROUP_STATION------------------------------------------------------------


csv_file = "/home/joao/Desktop/project/csvs/user_group_station.csv"

# Define the desired data types for each attribute
dtype = {
    "id": "int32",
    "id_station": "int32",
    "id_user_group": "int32"

}


# Read the CSV file using pandas
df = pd.read_csv(csv_file, dtype=dtype)

# Create the TileDB array from the DataFrame
tiledb.from_pandas("user_group_station_array", df)


#USER_GROUP------------------------------------------------------------


csv_file = "/home/joao/Desktop/project/csvs/user_group.csv"

# Define the desired data types for each attribute
dtype = {
    "id": "int32",
    "name": "str"

}


# Read the CSV file using pandas
df = pd.read_csv(csv_file, dtype=dtype)

# Create the TileDB array from the DataFrame
tiledb.from_pandas("user_group_array", df)


#LOG---------------------------------------------------------------

csv_file = "/home/joao/Desktop/project/csvs/log.csv"

# Define the desired data types for each attribute
dtype = {
    "id": "int32",
    "title": "str",
    "date": "str",
    "id_log_type": "int32",
    "id_station": "int32",
    "modified": "str",
    "previous": "str",
    "id_contact": "int"

}

# Specify the columns to parse as dates
parse_dates = ["date"]

# Read the CSV file using pandas
df = pd.read_csv(csv_file, dtype=dtype, parse_dates)

# Create the TileDB array from the DataFrame
tiledb.from_pandas("log_array", df)



#LOG_TYPE---------------------------------------------------------------

csv_file = "/home/joao/Desktop/project/csvs/log_type.csv"

# Define the desired data types for each attribute
dtype = {
    "id": "int32",
    "name": "str"

}

# Read the CSV file using pandas
df = pd.read_csv(csv_file, dtype=dtype)

# Create the TileDB array from the DataFrame
tiledb.from_pandas("log_type_array", df)


#NETWORK---------------------------------------------------------------

csv_file = "/home/joao/Desktop/project/csvs/network.csv"

# Define the desired data types for each attribute
dtype = {
    "id": "int32",
    "name": "str",
    "id_contact": "int32"

}

# Read the CSV file using pandas
df = pd.read_csv(csv_file, dtype=dtype)

# Create the TileDB array from the DataFrame
tiledb.from_pandas("network_array", df)


#STATION_NETWORK---------------------------------------------------------------

csv_file = "/home/joao/Desktop/project/csvs/station_network.csv"

# Define the desired data types for each attribute
dtype = {
    "id": "int32",
    "id_station": "int32",
    "id_network": "int32"

}

# Read the CSV file using pandas
df = pd.read_csv(csv_file, dtype=dtype)

# Create the TileDB array from the DataFrame
tiledb.from_pandas("station_network_array", df)


#STATION_CONTACT---------------------------------------------------------------

csv_file = "/home/joao/Desktop/project/csvs/station_contact.csv"

# Define the desired data types for each attribute
dtype = {
    "id": "int32",
    "id_station": "int32",
    "id_contact": "int32",
    "role": "str"

}

# Read the CSV file using pandas
df = pd.read_csv(csv_file, dtype=dtype)

# Create the TileDB array from the DataFrame
tiledb.from_pandas("station_contact_array", df)


#AGENCY---------------------------------------------------------------

csv_file = "/home/joao/Desktop/project/csvs/agency.csv"

# Define the desired data types for each attribute
dtype = {
    "id": "int32",
    "name": "str",
    "abbreviation": "str",
    "address": "str",
    "www": "str",
    "infos": "str"
}

# Read the CSV file using pandas
df = pd.read_csv(csv_file, dtype=dtype)

# Create the TileDB array from the DataFrame
tiledb.from_pandas("agency_array", df)


#CONTACT---------------------------------------------------------------

csv_file = "/home/joao/Desktop/project/csvs/contact.csv"

# Define the desired data types for each attribute
dtype = {
    "id": "int32",
    "name": "str",
    "title": "str",
    "email": "str",
    "phone": "str",
    "gsm": "str",
    "comment": "str"
    "id_agency": "int32",
    "role": "str",
    "fax": "str"

}

# Read the CSV file using pandas
df = pd.read_csv(csv_file, dtype=dtype)

# Create the TileDB array from the DataFrame
tiledb.from_pandas("contact_array", df)


#DATA_CENTER---------------------------------------------------------------

csv_file = "/home/joao/Desktop/project/csvs/data_center.csv"

# Define the desired data types for each attribute
dtype = {
    "id": "int32",
    "acronym": "str",
    "id_agency": "int32",
    "hostname": "str",
    "root_path": "str",
    "name": "str",
    "protocol": "str"

}

# Read the CSV file using pandas
df = pd.read_csv(csv_file, dtype=dtype)

# Create the TileDB array from the DataFrame
tiledb.from_pandas("data_center_array", df)



#DATA_CENTER_STATION---------------------------------------------------------------

csv_file = "/home/joao/Desktop/project/csvs/data_center_station.csv"

# Define the desired data types for each attribute
dtype = {
    "id": "int32",
    "id_station": "int32",
    "id_datacenter": "int32",
    "datacenter_type": "str"

}

# Read the CSV file using pandas
df = pd.read_csv(csv_file, dtype=dtype)

# Create the TileDB array from the DataFrame
tiledb.from_pandas("data_center_station_array", df)


#DATA_CENTER_STRUCTURE---------------------------------------------------------------

csv_file = "/home/joao/Desktop/project/csvs/data_center_structure.csv"

# Define the desired data types for each attribute
dtype = {
    "id": "int32",
    "id_datacenter": "int32",
    "id_file_type": "int32",
    "directory_naming": "str",
    "comments": "str" 

}

# Read the CSV file using pandas
df = pd.read_csv(csv_file, dtype=dtype)

# Create the TileDB array from the DataFrame
tiledb.from_pandas("data_center_structure_array", df)



#NODE_DATA_CENTER---------------------------------------------------------------

csv_file = "/home/joao/Desktop/project/csvs/node_data_center.csv"

# Define the desired data types for each attribute
dtype = {
    "id": "int32",
    "id_node": "int32",
    "id_data_center": "int32"
}

# Read the CSV file using pandas
df = pd.read_csv(csv_file, dtype=dtype)

# Create the TileDB array from the DataFrame
tiledb.from_pandas("node_data_center_array", df)


#NODE_RINEX_FILE---------------------------------------------------------------

csv_file = "/home/joao/Desktop/project/csvs/node_rinex_file.csv"

# Define the desired data types for each attribute
dtype = {
    "id": "int32",
    "id_node": "int32",
    "id_rinex_file": "int32"

}

# Read the CSV file using pandas
df = pd.read_csv(csv_file, dtype=dtype)

# Create the TileDB array from the DataFrame
tiledb.from_pandas("node_rinex_file_array", df)


#FAILED_QUERIES---------------------------------------------------------------

csv_file = "/home/joao/Desktop/project/csvs/failed_queries.csv"

# Define the desired data types for each attribute
dtype = {
    "id": "int32",
    "query": "str",
    "destiny": "int32",
    "timestamp": "str",
    "reason": "str"

}

# Specify the columns to parse as dates
parse_dates = ["timestamp"]

# Read the CSV file using pandas
df = pd.read_csv(csv_file, dtype=dtype, parse_dates)

# Create the TileDB array from the DataFrame
tiledb.from_pandas("faield_queries_array", df)


#QUERIES---------------------------------------------------------------

csv_file = "/home/joao/Desktop/project/csvs/queries.csv"

# Define the desired data types for each attribute
dtype = {
    "id": "int32",
    "query": "str",
    "metadata": "str",
    "station_id": "int32",
    "destiny": "int32"

}

# Specify the columns to parse as dates
parse_dates = ["timestamp"]

# Read the CSV file using pandas
df = pd.read_csv(csv_file, dtype=dtype, parse_dates)

# Create the TileDB array from the DataFrame
tiledb.from_pandas("queries_array", df)



#CONNECTIONS---------------------------------------------------------------

csv_file = "/home/joao/Desktop/project/csvs/connections.csv"

# Define the desired data types for each attribute
dtype = {
    "id": "int32",
    "source": "int32",
    "destiny": "int32",
    "station": "int32",
    "metadata": "str"

}

# Specify the columns to parse as dates
parse_dates = ["timestamp"]

# Read the CSV file using pandas
df = pd.read_csv(csv_file, dtype=dtype)

# Create the TileDB array from the DataFrame
tiledb.from_pandas("connections_array", df)


#NODE---------------------------------------------------------------

csv_file = "/home/joao/Desktop/project/csvs/node.csv"

# Define the desired data types for each attribute
dtype = {
    "id": "int32",
    "name": "str",
    "host": "str",
    "port": "str",
    "dbname": "str",
    "username": "str",
    "password": "str",
    "url": "str",
    "email": "str",
    "contact_name": "str"

}

# Specify the columns to parse as dates
parse_dates = ["timestamp"]

# Read the CSV file using pandas
df = pd.read_csv(csv_file, dtype=dtype)

# Create the TileDB array from the DataFrame
tiledb.from_pandas("node_array", df)


#SERVICE---------------------------------------------------------------

csv_file = "/home/joao/Desktop/project/csvs/service.csv"

# Define the desired data types for each attribute
dtype = {
    "id": "int32",
    "name": "str",
    "version": "float32",
    "comments": "str",
    "createdon": "str",
    "updatedon": "str"

}

# Specify the columns to parse as dates
parse_dates = ["createdon", "updatedon"]

# Read the CSV file using pandas
df = pd.read_csv(csv_file, dtype=dtype, parse_dates)

# Create the TileDB array from the DataFrame
tiledb.from_pandas("service_array", df)






#RINEX_FILE---------------------------------------------------------------

csv_file = "/home/joao/Desktop/project/csvs/rinex_file.csv"

# Define the desired data types for each attribute
dtype = {
    "id": "int32",
    "name":"str",
    "id_data_center": "int32",
    "id_data_center_structure":"int32",
    "file_size":"int32",
    "id_file_type": "int32"
    "relative_path": "str",
    "reference_date": "str",
    "creation_date": "str",
    "published_date": "str",
    "revision_date": "str",
    "md5checksum": "str",
    "md5uncompressed": "str",
    "status": "int32"

}

# Specify the columns to parse as dates
parse_dates = ["reference_date","creation_date", "published_date", "revision_date"]

# Read the CSV file using pandas
df = pd.read_csv(csv_file, dtype=dtype, parse_dates)

# Create the TileDB array from the DataFrame
tiledb.from_pandas("rinex_file_array", df)



#QUALITY_FILE---------------------------------------------------------------

csv_file = "/home/joao/Desktop/project/csvs/quality_file.csv"

# Define the desired data types for each attribute
dtype = {
    "id": "int32",
    "name":"str",
    "id_data_center_structure":"int32",
    "file_size":"int32",
    "id_file_type": "int32"
    "relative_path": "str",
    "creation_date": "str",
    "revision_date": "str",
    "md5checksum": "str",
    "status": "int32"

}

# Specify the columns to parse as dates
parse_dates = ["creation_date", "revision_date"]

# Read the CSV file using pandas
df = pd.read_csv(csv_file, dtype=dtype, parse_dates)

# Create the TileDB array from the DataFrame
tiledb.from_pandas("quality_file_array", df)


#OTHER_FILES---------------------------------------------------------------

csv_file = "/home/joao/Desktop/project/csvs/other_files.csv"

# Define the desired data types for each attribute
dtype = {
    "id": "int32",
    "name":"str",
    "id_data_center_structure":"int32",
    "id_rinex_file": "int32",
    "file_size":"int32",
    "id_file_type": "int32"
    "relative_path": "str",
    "creation_date": "str",
    "revision_date": "str",
    "md5checksum": "str",
    "status": "int32"

}

# Specify the columns to parse as dates
parse_dates = ["creation_date", "revision_date"]

# Read the CSV file using pandas
df = pd.read_csv(csv_file, dtype=dtype, parse_dates)

# Create the TileDB array from the DataFrame
tiledb.from_pandas("other_file_array", df)


#FILE_TYPE---------------------------------------------------------------

csv_file = "/home/joao/Desktop/project/csvs/file_type.csv"

# Define the desired data types for each attribute
dtype = {
    "id": "int32",
    "format":"str",
    "sampling_window":"str",
    "sampling_frequency": "str"


}

# Specify the columns to parse as dates
parse_dates = ["sampling_window"]

# Read the CSV file using pandas
df = pd.read_csv(csv_file, dtype=dtype, parse_dates)

# Create the TileDB array from the DataFrame
tiledb.from_pandas("file_type_array", df)

#RINEX_ERRORS---------------------------------------------------------------

csv_file = "/home/joao/Desktop/project/csvs/rinex_errors.csv"

# Define the desired data types for each attribute
dtype = {
    "id": "int32",
    "id_rinex_file": "int32",
    "id_error_type": "int32"

}


# Read the CSV file using pandas
df = pd.read_csv(csv_file, dtype=dtype)

# Create the TileDB array from the DataFrame
tiledb.from_pandas("rinex_errors_array", df)

#RINEX_ERROR_TYPES---------------------------------------------------------------

csv_file = "/home/joao/Desktop/project/csvs/rinex_error_types.csv"

# Define the desired data types for each attribute
dtype = {
    "id": "int32",
    "error_type" : "str"

}


# Read the CSV file using pandas
df = pd.read_csv(csv_file, dtype=dtype)

# Create the TileDB array from the DataFrame
tiledb.from_pandas("rinex_error_types_array", df)


#FILE_GENERATED---------------------------------------------------------------

csv_file = "/home/joao/Desktop/project/csvs/file_generated.csv"

# Define the desired data types for each attribute
dtype = {
    "id": "int32",
    "id_station": "int32",
    "id_file_type": "int32"

}


# Read the CSV file using pandas
df = pd.read_csv(csv_file, dtype=dtype)

# Create the TileDB array from the DataFrame
tiledb.from_pandas("file_generated_array", df)


#QC_CONSTELLATION_SUMMARY---------------------------------------------------------------

csv_file = "/home/joao/Desktop/project/csvs/qc_constelattion_summary.csv"

# Define the desired data types for each attribute
dtype = {
        "id": "int32",
        "id_qc_report_summary": "int32",
        "id_constellation": "int32",
        "nsat": "int32",
        "xele": "int32",
        "epo_expt": "int32",
        "epo_have": "int32",
        "epo_usbl": "int32",
        "xcod_epo": "int32",
        "xcod_sat": "int32",
        "xpha_epo": "int32",
        "xpha_sat": "int32",
        "xint_epo": "int32",
        "xint_sat": "int32",
        "xint_sig": "int32",
        "xint_slp": "int32",
        "x_crd": "float32"
        "y_crd": "float32"
        "z_crd": "float32"
        "x_rms": "float32"
        "y_rms": "float32"
        "z_rms": "float32"

}


# Read the CSV file using pandas
df = pd.read_csv(csv_file, dtype=dtype)

# Create the TileDB array from the DataFrame
tiledb.from_pandas("qc_constelattion_summary_array", df)


#QC_REPORT_SUMMARY---------------------------------------------------------------

csv_file = "/home/joao/Desktop/project/csvs/qc_report_summary.csv"

# Define the desired data types for each attribute
dtype = {
        "id": "int32",
        "id_rinex_file": "int32",
        "id_qc_report_summary": "int32",
        "date_beg": "str",
        "date_end": "str",
        "date_smp": "float32",
        "obs_elev": "float32",
        "obs_have": "int32",
        "obs_expt": "int32",
        "user_have": "int32",
        "user_expt": "int32",
        "cyc_slps": "int32",
        "clk_jmps": "int32",
        "xbeg": "int32",
        "xend": "int32",
        "xint": "int32",
        "xsys": "int32"
}


# Specify the columns to parse as dates
parse_dates = ["date_beg", "date_end"]

# Read the CSV file using pandas
df = pd.read_csv(csv_file, dtype=dtype, parse_dates)

# Create the TileDB array from the DataFrame
tiledb.from_pandas("qc_report_summary_array", df)


#QC_PARAMETERS---------------------------------------------------------------

csv_file = "/home/joao/Desktop/project/csvs/qc_parameters.csv"

# Define the desired data types for each attribute
dtype = {
        "id": "int32",
        "software_name": "str",
        "software_version": "str",
        "elevation_cutoff": "int32",
        "gps": "str",
        "glo": "str",
        "gal": "str",
        "bds": "str",
        "qzs": "str",
        "sbs": "str",
        "nav_gps": "str",
        "nav_glo": "str",
        "nav_gal": "str",
        "nav_bds": "str",
        "nav_qzs": "str",
        "nav_sbs": "str"
}



# Read the CSV file using pandas
df = pd.read_csv(csv_file, dtype=dtype)

# Create the TileDB array from the DataFrame
tiledb.from_pandas("qc_parameters_array", df)


#QC_NAVIGATION_MSG---------------------------------------------------------------

csv_file = "/home/joao/Desktop/project/csvs/qc_navigation_msg.csv"

# Define the desired data types for each attribute
dtype = {
        "id": "int32",
        "id_qc_report_summary": "int32",
        "id_constellation": "int32",
        "nsat": "int32",
        "have": "int32"
}



# Read the CSV file using pandas
df = pd.read_csv(csv_file, dtype=dtype)

# Create the TileDB array from the DataFrame
tiledb.from_pandas("qc_navigation_msg_array", df)


#CONSTELLATIONS---------------------------------------------------------------

csv_file = "/home/joao/Desktop/project/csvs/constellations.csv"

# Define the desired data types for each attribute
dtype = {
        "id": "int32",
        "identifier_1ch": "str",
        "identifier_3ch": "str",
        "name": "str",
        "official": "str"

        }



# Read the CSV file using pandas
df = pd.read_csv(csv_file, dtype=dtype)

# Create the TileDB array from the DataFrame
tiledb.from_pandas("constellations_array", df)


#GNSS_OBSNAMES---------------------------------------------------------------

csv_file = "/home/joao/Desktop/project/csvs/gnss_obsnames.csv"

# Define the desired data types for each attribute
dtype = {
        "id": "int32",
        "name": "str",
        "frequency_band": "int32",
        "obstype": "str",
        "channel": "str",
        "official": "str"
}



# Read the CSV file using pandas
df = pd.read_csv(csv_file, dtype=dtype)

# Create the TileDB array from the DataFrame
tiledb.from_pandas("gnss_obsnames_array", df)


#QC_OBSERVATION_SUMMARY_C---------------------------------------------------------------

csv_file = "/home/joao/Desktop/project/csvs/qc_obervation_summary_c.csv"

# Define the desired data types for each attribute
dtype = {
        "id":"int32"
        "id_qc_constellation_summary": "int32",
        "id_gnss_obsnames": "int32",
        "obs_stats": "int32",
        "obs_have": "int32",
        "obs_expt": "int32",
        "user_have": "int32",
        "user_expt": "int32",
        "cod_mpth": "float32"
}



# Read the CSV file using pandas
df = pd.read_csv(csv_file, dtype=dtype)

# Create the TileDB array from the DataFrame
tiledb.from_pandas("qc_obervation_summary_c", df)



#QC_OBSERVATION_SUMMARY_D---------------------------------------------------------------

csv_file = "/home/joao/Desktop/project/csvs/qc_obervation_summary_d.csv"

# Define the desired data types for each attribute
dtype = {
        "id":"int32",
        "id_qc_constellation_summary": "int32",
        "id_gnss_obsnames": "int32",
        "obs_stats": "int32",
        "obs_have": "int32",
        "obs_expt": "int32",
        "user_have": "int32",
        "user_expt": "int32"
}



# Read the CSV file using pandas
df = pd.read_csv(csv_file, dtype=dtype)

# Create the TileDB array from the DataFrame
tiledb.from_pandas("qc_obervation_summary_d", df)


#QC_OBSERVATION_SUMMARY_S---------------------------------------------------------------

csv_file = "/home/joao/Desktop/project/csvs/qc_obervation_summary_s.csv"

# Define the desired data types for each attribute
dtype = {
        "id":"int32"
        "id_qc_constellation_summary": "int32",
        "id_gnss_obsnames": "int32",
        "obs_stats": "int32",
        "obs_have": "int32",
        "obs_expt": "int32",
        "user_have": "int32",
        "user_expt": "int32"
}



# Read the CSV file using pandas
df = pd.read_csv(csv_file, dtype=dtype)

# Create the TileDB array from the DataFrame
tiledb.from_pandas("qc_obervation_summary_s", df)

#QC_OBSERVATION_SUMMARY_L---------------------------------------------------------------

csv_file = "/home/joao/Desktop/project/csvs/qc_obervation_summary_l.csv"

# Define the desired data types for each attribute
dtype = {
        "id":"int32"
        "id_qc_constellation_summary": "int32",
        "id_gnss_obsnames": "int32",
        "obs_stats": "int32",
        "obs_have": "int32",
        "obs_expt": "int32",
        "user_have": "int32",
        "user_expt": "int32",
        "pha_slps": "int32"
}



# Read the CSV file using pandas
df = pd.read_csv(csv_file, dtype=dtype)

# Create the TileDB array from the DataFrame
tiledb.from_pandas("qc_obervation_summary_l", df)