# Real Estate Analysis: Chisinau Apartments

Demonstrates an end-to-end workflow: scraping, cleaning,  EDA, ML modeling, business interpretation

## Project Overview

Scraped 1038 apartment listings from [immobiliare.md](https://immobiliare.md), cleaned and analyzed the data to answer 4 key business questions:

1. **Which sector is most stable?** -  Ciocana (smallest mean–median price gap: 4.7k EUR) 
2. **Which feature adds most value?** - Area
3. **Is price linear with area?**  -  Linear up to ~120m², with a discount for extra-large units 
4. **How much does sector influence price vs area?** -  Area is ~5.6x more influential than sector on price 

## Model Performance
## Results

![alt text](image.png)


## Methodology

- **Data**: from 1038 raw listings to 450 cleaned apartments (outliers removed via IQR, invalid entries dropped)
- **Features**: sector, rooms, area, floor, heating, amenities (AC, underfloor heating, furniture, double glazing)

## Files

- `scraper/scraper.py` - Web scraper (Playwright)
- `notebooks/Real Estate Analysis.ipynb` - Full EDA + modeling pipeline
- `data/real_estate_data.xlsx` - Raw scraped data

## How to Run

1. **Install dependencies and playwright:**
```bash
   pip install -r requirements.txt
   playwright install chromium
```

2. **(Optional) Run the scraper:**
```bash
   python src/scraper.py
```
Choose S (sales) or R (rent) when prompted
Output: `Real_estate_data.xlsx` in data folder

3. **Run the analysis:**
```bash
   jupyter notebook "notebooks/Real Estate Analysis.ipynb"
```


## Tech Stack

- **Scraping**: BeautifulSoup / Playwright / requests, openpyxl for saving in Excel
- **Analysis**: pandas, numpy, matplotlib, seaborn
- **ML**: scikit-learn (Linear Regression, Random Forest)

## Future Work

- Expand data 
- Add geolocation features (distance to Metro, schools, parks)

## Author

Tarnavski Stanislav

---

