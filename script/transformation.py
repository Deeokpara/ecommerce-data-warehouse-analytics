import pandas as pd

df = pd.read_csv("data/raw/online_retail.csv")

# Remove nulls
df = df.dropna()

# Remove negative quantities
df = df[df['Quantity'] > 0]

# Create Revenue column
df['Revenue'] = df['Quantity'] * df['UnitPrice']

# Convert date
df['InvoiceDate'] = pd.to_datetime(df['InvoiceDate'])

# Save cleaned data
df.to_csv("data/processed/cleaned_data.csv", index=False)