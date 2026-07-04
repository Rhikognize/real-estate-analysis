# Real Estate Analysis: Chisinau Apartments

Demonstrates an end-to-end workflow: scraping, cleaning,  EDA, ML modeling, business interpretation

## Project Overview

Scraped 1043 apartment listings from [immobiliare.md](https://immobiliare.md), cleaned and analyzed the data to answer 4 key business questions:

1. **Which sector is most stable?** -  Ciocana 
2. **Which feature adds most value?** - Area
3. **Is price linear with area?**  -  Linear up to ~120m², with a discount for extra-large units 
4. **How much does sector influence price vs area?** -  Area is ~6.9 more influential than sector on price 

## Model Performance
| Model | Average R² | MAE |
|---|---|---|
| Linear Regression | 0.744 | 22.2 |
| Random Forest | 0.754 | 23.17 |

![Feature importance from Random Forest model](image.png)


## Methodology

- **Data**: from 1043 raw listings to 450 cleaned apartments (outliers removed via IQR, invalid entries dropped)
- **Features**: sector, rooms, area, floor, heating, amenities (AC, underfloor heating, furniture, double glazing)

## Files

- `scraper/scraper.py` - Web scraper 
- `scraper/load_to_sql.py` - Creating slite3 database
- `notebooks/Real Estate Analysis.ipynb` - Full EDA + modeling pipeline
- `sql/queries` - SQL queries
- `dashboards/Real_estate_dashboards.pbix` - Interactive Power BI dashboard

## How to Run

1. **Install dependencies and playwright:**
```bash
   pip install -r requirements.txt
   playwright install chromium
```

2. **(Optional) Run the scraper:**
```bash
   python scraper/scraper.py
```
Choose S (sales) or R (rent) when prompted
Output: `Real_estate_data.xlsx` in data folder

3. **Load to sql:**
```bash
   python scraper/load_to_sql.py
```

4. **Run the analysis:**
```bash
   jupyter notebook "notebooks/Real Estate Analysis.ipynb"
```
Run all cells top to bottom.

`load_to_sql.py` loads the scraped data into SQLite and creates the `apartments` view used by the notebook.
Queries used in the analysis are in `sql/queries/` (includes a window-function query, aggregates etc.).

## Dashboard

An interactive Power BI dashboard (`dashboards/Real_estate_dashboards.pbix`) visualizes the analysis across three pages:

1. **Sector Analysis**: Listing counts, median prices, and mean-vs-median price comparison by sector which shows Ciocana's price stability.
2. **Price Drivers**: Feature importance from the Random Forest model and scatter plot showing Area's dominance in price prediction.
3. **Top Listings**: Top 10 most expensive apartments from the SQL `top_10` view with key details (sector, rooms, price, area).

To open: run the notebook once, then open the `.pbix` file in Power BI Desktop and press **Refresh** (Ctrl+R) to load the latest data.

## Tech Stack

- **Scraping**: BeautifulSoup / Playwright / requests, openpyxl for saving in Excel
- **Analysis**: pandas, numpy, matplotlib, seaborn
- **ML**: scikit-learn (Linear Regression, Random Forest)
- **Database**: sqlite, SQL (window functions, views)
- **BI**: Power BI

## Future Work

- Expand data 
- Add geolocation features (distance to Metro, schools, parks)

## Author

Tarnavski Stanislav

---

