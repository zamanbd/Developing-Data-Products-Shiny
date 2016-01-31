### Welcome to Data Explorer for Electric Power Generation in Canada during 2008-2015

This application is based on monthly electricity generation in different provinces in Canada based on the generation types used and the types of producers.

Dataset has been obtained from [the Socioeconomic database of Statistics Canada, CANSIM](http://www5.statcan.gc.ca/cansim/a26?lang=eng&retrLang=eng&id=1270002&&pattern=&stByVal=1&p1=1&p2=31&tabMode=dataTable&csid=).

Source code is available on the [GitHub](https://github.com/zamanbd/Developing-Data-Products-Shiny.git).

You can select Canada or any of its provinces, type of an electricity producer and the the generation type - time series of the electric power generation will be displayed accordingly. 

#### Known Issues:
- For some combinations of selection, no data is available, (for example, there is not data of tidal generation for many provinces). Please select differnt combinations.

#### To do

- The time series analysis part will be included later (for example, seasonal decomposition, forecasting etc).
- Inclusion of maps is our next target as well
