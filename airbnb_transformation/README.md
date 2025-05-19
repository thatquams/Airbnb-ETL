# 🏡 Airbnb ETL Project (dbt)

Welcome to the Airbnb ETL project!  
This dbt project transforms and models raw Airbnb data for analysis and reporting. It covers listings, hosts, reviews, and derived fact and dimension tables for improved analytical insights.

---

## 📁 Project Structure

This project is organized using modular dbt best practices:

- **Staging Models (`stg_*`)**  
  Clean and standardize raw Airbnb source tables.

- **Dimension Tables (`dim_*`)**  
  Enriched entities like hosts and reviews for descriptive analysis.

- **Fact Tables (`fct_*`)**  
  Transactional datasets such as listings with metrics and foreign keys.

- **Macros**  
  Utility functions for price normalization, date formatting, and surrogate key generation.

---

## 🚀 How to Use

Run the following dbt commands after setting up your environment:

```bash
dbt run        # Build models
dbt test       # Run tests on models
dbt docs generate && dbt docs serve  # Generate and browse model documentation
