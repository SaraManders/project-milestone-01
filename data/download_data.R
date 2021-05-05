#' download_data.R
#'
#' contributors: Sara Manders
#'
#' Explain what this file does
#' Within this file, Twitte API data is selected contain data about tweets, retweets, replies and quotes about the 
#' vaccination passport
#' The tweets collected in the data, are specified to The Netherlands as geolocation.
#' To get to know what is tweeted about this vaccination password, the tweets will be searched for using the following search words:
#' #Vaccinatiepaspoort OR #Vaccinatie #COVID19 OR #Vaccinatie #COVID-19 OR #Vaccinatiesamenleving OR #VaccinationPassport OR 
#' #Vaccination #COVID19 OR #Vaccination #COVID-19 OR #Vaccinatie #Coronavirus OR #Vaccinatieprogramma
#' 

# Libraries
## NOTES: Add the libraries you need for this script to run sucessfully
library(dplyr)
library(tidyr)
library(tibble)
library(ggplot2)
library(tidygraph)
library(rtweet)
library(modelsummary)

# YOUR CODE HERE
## NOTES: Do add comments

Vac_pass <- search_tweets("#Vaccinatiepaspoort", #to retreive tweets about the vaccination passsport (vaccinatiepaspoort in Dutch)
                          include_rts = TRUE, #To include retweets
                          n = 10000, #Set the limit to 10 000 to load a dataset big enough, yet to not have to wait an hour to retreive my data
                          retryonratelimit = TRUE) #To retrieve the required tweets from the Twitter API with a max. of 10 000 tweets, managed to get 74%

View(Vac_pass)
#7397 entries, 90 columns

#I want to retrieve only tweets from the Netherlands, so:


# Save Data to File
## NOTES: Use the end of the script to save the data
##        If you are using the readr library, can save as follows:
## Example 1: write_csv(my_df, here("data", "my_dataset.csv"))
## Example 2: write_rds(my_df, here("data", "my_dataset.csv"))