# NYC Airbnb SQL Analysis

This project contains exploratory SQL analysis of the NYC Airbnb Open Data dataset from March 2025. The goal is to identify trends, patterns, and insights from Airbnb listings using PostgreSQL.

---

## Dataset

The dataset used is the NYC Airbnb Open Data from [Inside Airbnb](http://insideairbnb.com/get-the-data.html), which includes details on listings such as price, location, host details, and reviews.

---

## Questions Answered

- Which neighborhoods have the highest and lowest ratings?
- What is the average price per night for a listing in NYC?
- Which boroughs have the highest and lowest average prices per night?
- Which neighborhoods have the most listings?
- What are the most common property types in NYC Airbnb listings?
- Do superhosts generally have higher-priced listings?
- Do listings with a verified host identity or profile picture tend to have more reviews or higher ratings?

---

## Tools Used

- SQL (PostgreSQL)
- DBeaver (SQL editor)

---

## File Structure

- `airbnb_analysis.sql` – Contains all SQL queries used for analysis.
- `README.md` – This documentation.

---

## Key Insights

- Which neighborhoods have the highest and lowest ratings?
    - Listings in Ditmars Steinway have the highest average rating of 4.79, suggesting a consistently positive guest experience. In contrast, Theater District listings have the lowest average rating of 4.39.

- What is the average price per night for a listing in NYC?
    - The overall average nightly price is $184.25.

- Which boroughs have the highest and lowest average prices per night?
    - Manhattan has the highest average nightly price at $234.85, while The Bronx has the lowest at $109.19.

- Which neighborhoods have the most listings?
    - The top three neighborhoods by listing count are:
        - Bedford-Stuyvesant: 1,535 listings
        - Midtown Manhattan: 1,384 listings
        - Hell’s Kitchen: 1,022 listings

- What are the most common property types in NYC Airbnb listings?
    - The most common property type is an entire rental unit, with 9,523 listings.

- Do superhosts generally have higher-priced listings?
    - No — superhosts tend to have lower average prices. The average price for superhost listings is $165.19, compared to $191.73 for non-superhosts.

- Do listings with a verified host identity or profile picture tend to have more reviews or higher ratings?
    - Listings with a verified identity or profile picture receive more reviews on average. However, the average rating does not differ significantly between verified and unverified hosts.

---

## How to Use

1. Clone this repository.
2. Download the NYC Airbnb Open Data dataset (March 1, 2025 version) from the Inside Airbnb website.
3. Clean the data before loading it — the raw CSV may contain formatting issues.
4. Load the cleaned dataset into your PostgreSQL database.
5. Open airbnb_analysis.sql in your SQL editor (e.g., DBeaver).
6. Run each section of the file to explore different insights.

---

## License

This project is open source under the [MIT License](https://opensource.org/licenses/MIT).
