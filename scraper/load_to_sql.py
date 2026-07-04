import sqlite3
import pandas as pd
from scraper import FILENAME

DB_FILENAME = "sql/real_estate.db"

df = pd.read_excel(FILENAME)
conn = sqlite3.connect(DB_FILENAME)
df.to_sql("real_estate", conn, if_exists="replace", index=False)
with open("sql/queries/01_create_view.sql") as f:
    query = f.read()

conn.execute(query)
with open("sql/queries/03_top10.sql", encoding="utf-8") as f:
    query = f.read()
conn.execute(f"CREATE VIEW IF NOT EXISTS top_10 AS  {query}")
conn.commit()
conn.close()

print("Data loaded into SQLite database successfully.")
