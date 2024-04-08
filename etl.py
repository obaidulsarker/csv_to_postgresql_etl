# import necessary libraries

from logging import exception
from IPython.display import display
import pandas as pd
from validation import *
from logger import *

import os
import argparse

# Import data into DB
from sqlalchemy import create_engine, false
from sqlalchemy.sql import text as sa_text

# Parse command-line arguments
parser = argparse.ArgumentParser(description='Compare two CSV files and update PostgreSQL database.')
parser.add_argument('--old', type=str, help='Path to the old CSV file')
parser.add_argument('--new', type=str, help='Path to the new CSV file')
parser.add_argument('--host', type=str, help='Host URL to specify the source of the CSV data')
args = parser.parse_args()

# Load and preprocess CSV data
old_csv_file_path = args.old
new_csv_file_path = args.new
host_name = args.host

# Get the current datetime
current_datetime = datetime.now()

# Format the datetime as yyyy_mm_dd_HH_mi_ss
formatted_datetime = current_datetime.strftime('%Y_%m_%d_%H_%M_%S')
formatted_date = current_datetime.strftime('%Y_%m_%d')

# Database Connection
conn_file_path = "D:\python-project\csv_to_pg\config\db_connection.ini"
conn_file = open(conn_file_path, mode="r")

conn_string = conn_file.read()
conn_file.close()

db = create_engine(conn_string, isolation_level='AUTOCOMMIT')
table_name = "shopify_track"

# CSV Directory
source_dir = "D:\python-project\csv_to_pg\data"
destination_dir= "D:\python-project\csv_to_pg\data_archive"

# Log file
log_directory="D:\python-project\csv_to_pg\logs"
log_file_name = f"etl-{formatted_date}.log"
log_file_path = os.path.join(log_directory, log_file_name)

log = Logger(logfile=log_file_path)
log.log_info("********************* STARTED ETL JOB ***************************")
log.log_info("*****************************************************************")
#Read SQL file
# INSERT
sql_file_insert = "D:\python-project\csv_to_pg\script\etl_insert.sql"
sql_file = open(sql_file_insert, mode="r")
insert_sql = sql_file.read()
insert_sql = sa_text(insert_sql)
sql_file.close()

# UPDATE
sql_file_update = "D:\python-project\csv_to_pg\script\etl_update.sql"
sql_file = open(sql_file_update, mode="r")
update_sql = sql_file.read()
update_sql = sa_text(update_sql)
sql_file.close()

#DELETE
sql_delete_file = "D:\python-project\csv_to_pg\script\etl_delete.sql"
sql_file = open(sql_delete_file, mode="r")
delete_sql = sql_file.read()
delete_sql = sa_text(delete_sql)
sql_file.close()

# read only csv files
#csv_files = glob.glob(os.path.join(source_dir, "*.csv"))
csv_files = []
csv_files.append(new_csv_file_path)
csv_files.append(old_csv_file_path)

# Required Column
required_columns = ['host', 'shopifyid', 'variantid']

dt_format ='%Y-%m-%d %H:%M:%S'

# Read File

print(f"Host : {host_name}")
log.log_info(f"Host : {host_name}")

# loop over the list of csv files
#for f in csv_files:
for i in range(len(csv_files)):
	f = csv_files[i]
	file_name = f.split("\\")[-1]
	
    # Table name for new and old CSV
	if (i==0):
		table_name="shopify_track_new"
	else:
		table_name="shopify_track_old"
		
	print(f"Processing Started: {file_name}")
	log.log_info(f"Processing Started: {file_name}")
	
	# read the csv file
	df_raw = pd.read_csv(f, delimiter=",", encoding='utf-8', skip_blank_lines=True)

	#Convert the column headers to lowercase
	df_raw.columns = map(str.lower, df_raw.columns)

	# Remove leading and trailing whitespace from column headers
	df_raw.columns = df_raw.columns.str.strip()

	df_raw = preprocess_data(df_raw)

	# df_raw = convert_datatype(df_raw)

	# # Get columns of object type (string columns)
	string_columns = df_raw.select_dtypes(include=['object']).columns
	# print(string_columns)

	# Convert object type columns to string type
	#df = df_raw[string_columns].apply(lambda x: str(x))

	# df_raw['sku'] = df_raw['sku'].apply(lambda x: str(x))

	#print(df_raw.info())

	for col in required_columns:
		if col not in df_raw.columns:
			log.log_error(f"CSV file must contain the '{col}' column.")
			raise ValueError(f"CSV file must contain the '{col}' column.")
	
	# print(df_raw.info())

	# print(df_raw.head(5))

	# computing number of rows and column
	rows = len(df_raw.axes[0])
	cols = len(df_raw.axes[1])

	print(f"Number of Columns: {cols}")
	print(f"Number of Rows: {rows}")
	log.log_info(f"Number of Columns: {cols}")
	log.log_info(f"Number of Rows: {rows}")
	
	# Remove null rows
	df_raw.dropna()

	#Load data into staging
	print("Loading data into database ....................")
	log.log_info("Loading data into database ....................")
	try:
		
		with db.connect() as connection:

			connection.autocommit = True

			# TRUNCATE TABLE statement
			truncate_sql = sa_text(f"TRUNCATE TABLE stg.{table_name}")
			connection.execute(truncate_sql)
			print(f"Executed: {truncate_sql}")
			log.log_info(f"Executed: {truncate_sql}")

			df_raw.to_sql(table_name, connection, schema='stg', if_exists='append', index=False)
			print(f"Data imported into staging {table_name} table")
			log.log_info(f"Data imported into staging {table_name} table")

			print(f"Processing Completed: {file_name}")
			log.log_info(f"Processing Completed: {file_name}")
			
	except Exception as e:
		print(str(e))
		log.log_error(str(e))

# Load into public.shopify_track table 
try:	
	with db.connect() as connection:

		connection.autocommit = True

		result = connection.execute(insert_sql)
		affected_rows_insert = result.rowcount
		print(f"Executed: {insert_sql}")
		log.log_info(f"Executed: {insert_sql}")

		result = connection.execute(update_sql)
		affected_rows_update = result.rowcount
		print(f"Executed: {update_sql}")
		log.log_info(f"Executed: {update_sql}")

		result = connection.execute(delete_sql)
		affected_rows_delete= result.rowcount
		print(f"Executed: {delete_sql}")
		log.log_info(f"Executed: {delete_sql}")

		# Update Sales table
		if (affected_rows_insert+affected_rows_update+affected_rows_delete)>0:
			sales_sql = f"INSERT INTO sales (url, date, sales) VALUES ('{host_name}', CURRENT_DATE, 1) ON CONFLICT (url, date) DO UPDATE SET sales = sales.sales + 1"
			sales_sql = sa_text(sales_sql)
			connection.execute(sales_sql)
			print(f"Executed: {sales_sql}")
			log.log_info(f"Executed: {sales_sql}")

except Exception as e:
	print(str(e))
	log.log_error(str(e))

	log.log_info("********************* ENDED ETL JOB ***************************")
	log.log_info("***************************************************************")

print()
