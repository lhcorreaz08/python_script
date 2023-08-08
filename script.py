## py -m venv env
## /env/Scripts/Activate
## pip install -r requirements.txt


import pandas as pd
import codecs

sheets = ['ACSFlight','ACSPaxFlight','ACSPaxVCR','ACSPaxDOCX','ACSPaxSeat','ACSPaxBag','ACSFlightHistory','ACSPaxHistory', 'TktDocument']
df2 =pd.DataFrame()

dataframes = []

for sheet in sheets:
    df = pd.read_excel('input\ACS_FILE.xlsx',sheet_name=sheet)

    df['file_name'] = sheet
    
    for column in df.columns:
        column_parsed = column.strip() 
        column_parsed = column_parsed.replace(sheet,'')
        column_parsed = column_parsed.replace(' ','')

        df.rename(columns = {column:column_parsed}, inplace = True)
        df[column_parsed] = df[column_parsed].astype('string')
        df[column_parsed] = df[column_parsed].str.strip()

    df['bq_datatype'] = df['DataType']

    df.loc[df['DataType'].str.contains('INT'), 'bq_datatype'] = 'INTEGER'
    df.loc[df['DataType'].str.contains('CHAR'), 'bq_datatype'] = 'STRING'
    df.loc[df['DataType'].str.contains('TIMESTAMP'), 'bq_datatype'] = 'TIMESTAMP'
    ##df['bq_datatype'] = df.loc[df['bq_datatype'].str.contains('CHAR'), 'bq_datatype'] = 'STRING'

    dataframes.append(df)

    dummy_data_df = df[['ColumnName','SampleValue']]
    dummy_data_df = dummy_data_df.set_index('ColumnName')
    dummy_data_df = dummy_data_df.transpose()
    dummy_data_df.to_csv(f'output\{sheet}.txt',index=False)

df2 = pd.concat(dataframes)

df2.to_excel('input\SABRE_CONSOLIDATED_2.xlsx')


sheets = ['ACSPaxFlight']

df = pd.read_excel('input\SABRE_CONSOLIDATED_2.xlsx')
    
df = df[df.file_name == sheets[0]] 

table_name = f'{sheets[0][0:3]}_{sheets[0][3:]}'
table_name = table_name.lower()

with codecs.open(f"output/tb_{table_name}.sql", "w",'utf_8_sig') as file1:
    # Writing data to a file
    
    file1.write(f'CREATE TABLE IF NOT EXISTS ODS_SABRE.tb_{table_name}  \n')
    file1.write(f"(\n")
    file1.write(f'  ID_DATE_BQ STRING OPTIONS(description="Date of data load to the database."),\n'), 
    for index, row in df.iterrows():
      file1.write(f'  {row["ColumnName"]} {row["bq_datatype"]} OPTIONS(description="{row["Definition"]}"),\n')
    file1.write(f")\n")
