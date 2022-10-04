import pandas as pd
import matplotlib.pyplot as mp

gsheetid = "1AP_5XMPLBqFueDtewiq-NsVwoDpMqHR_Sjh-7UKKUVM"
sheet_name = "Users"
gsheet_url = "https://docs.google.com/spreadsheets/d/1AP_5XMPLBqFueDtewiq-NsVwoDpMqHR_Sjh-7UKKUVM/gviz/tq?tqx=out:csv&sheet=Users".format(gsheetid, sheet_name)
df = pd.read_csv(gsheet_url)

month=["February","March","April","May","June"]
def graph(id):
    usg=df[df["id"]==id]["Feb.Usage"],df[df["id"]==id]["Mar.Usage"],df[df["id"]==id]["Apr.Usage"],df[df["id"]==id]["May.Usage"],df[df["id"]==id]["Jun.Usage"]
    mp.plot(month,usg,color='green',marker='o',
     markerfacecolor='red', markersize=12)
    mp.xlabel("Month")
    mp.ylabel("Data Usage")
    mp.title("Data Usage per Month")


graph(28559)    