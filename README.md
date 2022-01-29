# Pakistan-Economy
Project analysing economy of Pakistan using R

This project is a WIP using data obtained from the World Bank on Pakistan (obtainable from here: https://data.worldbank.org/country/pakistan). Much of the data processing occurred in excel, with the most important aspect of this involving creating a look up table to rename variables of interest into a more convenient code. Currently this project involves 2 scripts with different objectives.

The first script, "DevEcon_DataVis" is intended for data exploration. While this script is of use in this specific case, its primary benefit is the ease with which it can be applied to structured data frames to quickly visualise data. This script is ideal for time series data as (provided that the first column relates to the temporal measurement) it can be used to obtain time series plots for each variable in the data frame. Using solutions seen elsewhere, the script then combines all these plots into a single pdf, as well as a single word document. I intend to make these visualisations more user friendly and am attempting to use shiny to build a dashboard to easily scroll through the visualisations. 

The second script “DevEcon_Regression” is more specific and is part of an independent research project investigating links between corruption and military spending in Pakistan. The specification used follows the model proposed by Gupta et al (2001), however currently excludes military spending in neighbouring countries which was proposed to act as an indicator of regional tension (and thus affect the dependent variable). While I am still conducting this analysis I can provide some summary results obtained thus far.



The overall regression leads to a large R squared of 0.897, however considering the number of parameters in the model results in an adjusted R squared of approximately 0.775. This still suggests that, given the number of explanatory variables used in the model, a large amount of the variance in the ratio between military spending and total government spending can be explained by the explanatory variables used in the model. Additionally, the F score for the overall significance of the regression is 7.45

 (F=\frac{R^2/q}{(1-R^2)/(n-k-1)}=\frac{0.897/7}{(0.103)/(6)}=\ 7.45).
 
 This leads to a p-value of 0.013. suggesting that, assuming the null hypothesis (that none of the explanatory variables have an affect on our dependent variable): there is only a 1.3% probability of obtaining a F value at least as large as has been observed. Consequently, we reject the null hypothesis at the 5% value, in favour of the alternative hypothesis: that at least one of the explanatory variables has a partial effect on our dependent variable.
Despite this, the limited number of observations should be noted. Due to missing data this analysis was only applied for n=14 years. Taking into consideration that the model contained 8 parameters, this leads to only 6 residual degrees of freedom. For ease, much of the data was obtained from the World Bank: however further investigation could obtain data from other sources and (upon data validation) merge this with our data to mitigate the problem of missing data. This would increase the degrees of freedom, and thus increase the power of our test. 

Additionally, I provide 2 plots showing: 1) the residuals by year, and 2) the actual data against their fitted values.

![image](https://user-images.githubusercontent.com/95538088/151666787-d3aaabef-c20a-4e9d-b745-48df137e26b6.png)
![image](https://user-images.githubusercontent.com/95538088/151666790-220efbe0-a6bf-4036-9dd9-1b18bd375a65.png)

References:
Gupta, S., De Mello, L. and Sharan, R., 2001. Corruption and military spending. European journal of political economy, 17(4), pp.749-777.



