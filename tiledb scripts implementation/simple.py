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
csv_file = "/home/joao/Desktop/project/csvs/reference_position_velocities.csv"

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
    "id_method_identification": "int32"
}

# Specify the columns to parse as dates
parse_dates = ["start_epoch", "end_epoch", "ref_epoch"]

# Read the CSV file using pandas
df = pd.read_csv(csv_file, dtype=dtype, parse_dates=parse_dates)

# Create the TileDB array from the DataFrame
tiledb.from_pandas("reference_position_values_array", df)



#ESTIMATED COORDINATES--------------------------------------------------
"""csv_file = "/home/joao/Desktop/project/csvs/estimated_coordinates.csv"

# Define the desired data types for each attribute
dtype = {
    "id": "float32",
    "x": "float32",
    "y": "float32",
    "z": "float32",
    "var_xx": "float32",
    "var_yy": "float32",
    "var_zz": "float32",
    "var_xy": "float32",
    "var_xz": "float32",
    "var_yz": "float32",
    "outlier": "Int32",
    "epoch": "str",
    "id_processing_parameters": "float32",
    "id_method_identification": "float32",
    "id_station": "float32",
    "id_product_files": "float32"
}

# Specify the columns to parse as dates
parse_dates = ["epoch"]

# Read the CSV file using pandas
df = pd.read_csv(csv_file, dtype=dtype, parse_dates=parse_dates)


# Create the TileDB array from the DataFrame
tiledb.from_pandas("estimated_coordinates_array", df)
"""

#REFERENCE FRAME-------------------------------------------------------
csv_file = "/home/joao/Desktop/project/csvs/reference_frames.csv"

# Define the desired data types for each attribute
dtype = {
    "id": "int32",
    "name": "str",
    "epoch": "str"

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


#PRODUCT FILES --------------------------------------------------------------------

csv_file = "/home/joao/Desktop/project/csvs/product_files.csv"

# Define the desired data types for each attribute
dtype = {
    "id": "int32",
    "url": "str",
    "epoch": "str",
    "version": "float32",
    "file_type": "str",
    "sampling_period": "str",
    "data_type": "str",
    "id_analysis_centers": "id"

}

# Specify the columns to parse as dates
parse_dates = ["epoch", "sampling_period"]

# Read the CSV file using pandas
df = pd.read_csv(csv_file, dtype=dtype)

# Create the TileDB array from the DataFrame
tiledb.from_pandas("product_files", df)

#HELMERT--------------------------------------------------------------

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

# Specify the columns to parse as dates
parse_dates = ["epoch"]

# Read the CSV file using pandas
df = pd.read_csv(csv_file, dtype=dtype)

# Create the TileDB array from the DataFrame
tiledb.from_pandas("helmert", df)


#PROCESSING_PARAMETERS-------------------------------------------------  

csv_file = "/home/joao/Desktop/project/csvs/processing_parameters.csv"

# Define the desired data types for each attribute
dtype = {
    "sinex_version": "str",
    "otl_model": "str",
    "antenna_model": "str",
    "id": "int32",
    "cut_of_angle": "float32",
    "sampling_period": "str",
    "id_helmert": "int32"

}

# Specify the columns to parse as dates
parse_dates = ["sampling_period"]

# Read the CSV file using pandas
df = pd.read_csv(csv_file, dtype=dtype)

# Create the TileDB array from the DataFrame
tiledb.from_pandas("processing_parameters", df)

