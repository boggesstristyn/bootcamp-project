#!/usr/bin/env python
# coding: utf-8

# In[1]:


import pandas as pd
import os


# In[2]:


crime_data_to_load = os.path.join("Resources", "Crime_Reports.csv")


# In[4]:


# Read the school data file and store it in a Pandas DataFrame.
crime_data_df = pd.read_csv(crime_data_to_load)
crime_data_df.head(10)


# In[5]:


crime_data_df.count()


# In[6]:


# drop the row
crime_data_df.dropna()


# In[ ]:




