from datalab.context import Context
import datalab.storage as storage
import datalab.bigquery as bq
import pandas as pd
from pandas import DataFrame
import time
parquet_file = 'ac4d68005f124236-bdc2ca0500000004_493042000_data.99.parq'
parquet_file = 'gs://chia-data/chia_v4.db/mc/ac4d68005f124236-bdc2ca0500000004_493042000_data.99.parq'
df=pd.read_parquet(parquet_file, engine='pyarrow')

#df = df.astype(str).applymap(lambda x: x.replace("b'", ""))
#df = df.astype(str).applymap(lambda x: x.replace("'", ""))


# Dataframe to write
#start = time.time()
#sample_bucket_name = Context.default().project_id + '-datalab-example'
#sample_bucket_path = 'gs://' + sample_bucket_name
#sample_bucket_object = sample_bucket_path + '/Hello.txt'
#bigquery_dataset_name = 'TestDataSet'
#bigquery_table_name = 'TestTable'
## Define storage bucket
#sample_bucket = storage.Bucket(sample_bucket_name)
#
## Create or overwrite the existing table if it exists
#table_schema = bq.Schema.from_dataframe(not_so_simple_dataframe)
#
## Write the DataFrame to GCS (Google Cloud Storage)
#%storage write --variable not_so_simple_dataframe --object $sample_bucket_object
