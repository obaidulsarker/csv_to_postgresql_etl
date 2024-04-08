
from logging import exception
from IPython.display import display
import pandas as pd
import numpy as np
from datetime import datetime

def preprocess_data(df):
    # df.columns = [col.lower() for col in df.columns]
    # df.columns = map(str.lower, df.columns)
    df.replace({np.nan: None}, inplace=True)
    df['instock'] = df['instock'].apply(lambda x: True if isinstance(x, str) and x.lower() == 'true' else False if x is not None else None)
    if 'imageurl' in df.columns:
        df['imageurl'] = df['imageurl'].apply(lambda x: x.split('?')[0] if x and isinstance(x, str) else x)
    return df

def datetime_str_diff_seconds(dt1, dt2):
    """Calculates the difference in seconds between two datetime strings."""
    if dt1 is None or dt2 is None:
        return None
    format = '%Y-%m-%d %H:%M:%S'
    try:
        dt1 = datetime.strptime(dt1.split('.')[0], format)
        dt2 = datetime.strptime(dt2.split('.')[0], format)
        diff = dt2 - dt1
        return diff.total_seconds()
    except ValueError:
        return None

def get_latest_updatedat(new_df, host):
    host_df = new_df[new_df['host'] == host]
    if not host_df.empty:
        return host_df['updatedat'].max()
    else:
        return None

def convert_datatype(df):
    # Define a dictionary mapping column names to data types
    # data_type_mapping = {
    #     'id': 'str',    
    #     'shopifyid': 'int',  
    #     'variantid': 'int',     
    #     'host': 'str',
    #     'sku': 'str',
    #     'collection1': 'str',
    #     'collection2': 'str',
    #     'collection3': 'str',
    #     'collection4': 'str',
    #     'collection5': 'str',
    #     'tags': 'str',
    #     'producttitle': 'str',
    #     'varianttitle': 'str',
    #     'price': 'float',
    #     'instock': 'bool',
    #     'producturl': 'str',
    #     'imageurl': 'str',
    #     'description': 'str',
    #     'descriptionnohtml': 'str',
    #     'updatedat': 'datetime'
    # }

    data_type_mapping = {
        'id': 'str',    
        'shopifyid': 'int',  
        'variantid': 'int',     
        'instock': 'bool',
        'producturl': 'str',
        'updatedat': 'datetime'
    }

    dt_format ='%Y-%m-%d %H:%M:%S'

    # Convert column data types according to the predefined mapping
    for column, data_type in data_type_mapping.items():
        if (data_type!='datetime'):
            df[column] = df[column].astype(data_type)
        else:
            df[column] = pd.to_datetime(df[column], format=dt_format)


    return df