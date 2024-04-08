# csv_to_postgresql_etl
Transform and load data from CSVs files into PostgreSQL. It will take two csv files like new and old as parameters and compare among them and then ingest data into PostgreSQL database.

Steps:
1. Create database Schema using database\schema.sql.
2. Set database credentials to config\db_connection.ini.
3. Load your old and new csv files in /data directory. Both CSVs files must be same format.
4. Run the following ETL job.
python etl.py --new data\new.csv --old data\old.csv --host 'https://uptownie.com'

There are three paramters - 
--old : it contain old csv file
--new : it contain new csv file
--host : it caontain the host URL


