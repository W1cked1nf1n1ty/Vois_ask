import pandas as pd
import streamlit as st
import plotly.express as px
from PIL import Image



#  Set Page Layout

st.set_page_config(page_title="Data Usage",         # Add Title to Tab
                    page_icon=":signal_strength:",  # Add Icon to Tab 
                    layout="wide")                  # Set Page Layout

st.title("R.A.M   (Recharge Analysis Module)")      # Set Page Title



# Import data From Excel

sale = pd.read_excel(
    io='h1.xlsx',
    engine='openpyxl',
    sheet_name='Sheet1',

)

st.dataframe(sale)



# Pie chart

pie_chart = px.pie(sale,
                    title ="Popularity of Plans (in mbps)",
                    values= "Customer ID",
                    names= "Jan.Plan")

st.plotly_chart(pie_chart)



# Average Slider

averages = sale ["Average-Data-Usage"].unique().tolist()
ages = sale ["Age"].unique().tolist()
plan = sale ["Feb.Plan"].unique().tolist()


avg_selection = st.slider("Average Data Usage by a customer:",
                            min_value= min(averages),
                            max_value= max(averages),
                            value=(min(averages),max(averages)))



#Plan filter

Plan_selection= st.multiselect('Plans:',
                                plan,
                                default=plan)





# --- FILTER DATAFRAME BASED ON SELECTION

mask = (sale ["Average-Data-Usage"].between(*avg_selection)) & (sale ["Feb.Plan"].isin(Plan_selection))

number_of_result = sale [mask].shape[0]

st.markdown(f'*Available Results: {number_of_result}*')



# --- GROUP DATAFRAME AFTER SELECTION

df_grouped = sale[mask].groupby(by=['Rating']).count()[["Average-Data-Usage"]]
df_grouped = df_grouped.rename(columns={"Average-Data-Usage": 'Votes'})
df_grouped = df_grouped.reset_index()



# --- PLOT BAR CHART

bar_chart = px.bar(df_grouped,
                   x='Rating',
                   y='Votes',
                   text='Votes',
                   color_discrete_sequence = ['#F63366']*len(df_grouped),
                   template= 'plotly_white')
                   
st.plotly_chart(bar_chart)



image = Image.open('images/survey.png')
st.image(image,
        caption='Made by Shantanu Joshi        Aditya Muley        Kanhu Charan Sahoo          (Team:448) ',
        # use_column_width=True
        width = 1000)
