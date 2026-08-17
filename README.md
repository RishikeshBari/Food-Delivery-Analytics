# 🍔 Food Delivery Analytics — SQL & Python

An end-to-end **Data Analytics project** using **MySQL, Python, Pandas, and Matplotlib** to analyze food-delivery transactions and uncover insights about revenue, customers, restaurants, cuisines, and order performance.

## 🎯 Project Objective

The objective was to answer practical business questions such as:

* Which customers and restaurants generate the most revenue?
* Which cuisines perform best?
* What is the Average Order Value?
* How strong is customer retention?
* How does revenue change over time?
* What patterns exist in order status and customer spending?
* Do highly rated restaurants necessarily generate higher revenue?

## 🛠️ Tools & Technologies

* **MySQL** — Database design and business analysis
* **SQL** — JOINs, GROUP BY, HAVING, aggregations, subqueries and ranking
* **Python**
* **Pandas** — Data loading, validation and EDA
* **Matplotlib** — Business visualizations
* **Jupyter Notebook**

## 📊 Dataset

The project uses **5 relational tables** containing **19,000+ records**:

| Table       | Records |
| ----------- | ------: |
| Customers   |   1,500 |
| Restaurants |     120 |
| Orders      |   5,000 |
| Menu Items  |     400 |
| Order Items |  12,391 |

The tables are connected using primary and foreign keys to model a realistic food-delivery system.

## 🗄️ Database Design

The relational structure covers:

**Customers → Orders → Order Items ← Menu Items**

and

**Restaurants → Orders**

**Restaurants → Menu Items**

The `order_items` table acts as the transactional/detail table connecting orders with purchased menu items.

## 🔍 Analysis Performed

### SQL Analysis

* Platform-level KPIs
* Total revenue
* Average Order Value
* Repeat-customer analysis
* Top customers
* Top restaurants
* Revenue by cuisine
* Average rating by cuisine

### Python EDA & Visualization

After SQL analysis, MySQL was connected directly with Python using Pandas.

Data quality checks included:

* Missing-value validation
* Duplicate detection
* Data-type review
* Descriptive analysis

The dataset contained **no missing values or duplicate rows**.

I then created **10 business-focused visualizations**, including:

1. Revenue by Cuisine
2. Top Restaurants by Revenue
3. Customer Spending Distribution
4. Order Status Distribution
5. Monthly Revenue Trend
6. Average Rating by Cuisine
7. Revenue Contribution by Cuisine
8. Top Customers by Spending
9. Revenue by Day of Week
10. Restaurant Rating vs Revenue

## 📈 Key Results

| KPI                     |                 Result |
| ----------------------- | ---------------------: |
| Total Revenue           |        **₹560,509.15** |
| Average Order Value     |            **₹112.10** |
| Repeat Customers        |              **1,272** |
| Repeat Customer Rate    |              **84.8%** |
| Top Customer            |  **C1447 — ₹1,527.70** |
| Top Restaurant          |   **R061 — ₹6,908.29** |
| Highest Revenue Cuisine | **Thai — ₹127,428.71** |
| Highest Rated Cuisine   |     **Mexican — 4.20** |

## 💡 Key Business Insights

* **Thai cuisine** generated the highest revenue and contributed the largest share of overall cuisine revenue.
* **Mexican cuisine** had the highest average rating, showing that higher customer ratings do not automatically translate into higher revenue.
* Customer spending was **right-skewed**, indicating a smaller group of relatively high-value customers.
* Restaurant ratings showed **no strong visible relationship with revenue**, suggesting that factors such as demand, pricing, availability, promotions, and menu variety may also influence performance.
* Order-status analysis identified **1,717 Delivered, 1,671 Late, and 1,612 Cancelled orders**, highlighting an important area for deeper operational investigation.

## 💼 Business Recommendations

* Investigate the drivers behind **late and cancelled orders**.
* Introduce loyalty and personalized offers for high-value customers.
* Study top-performing restaurants and replicate successful practices.
* Increase visibility of highly rated but lower-revenue cuisines.
* Use weekday demand patterns for staffing and promotional planning.
* Evaluate restaurants using multiple KPIs rather than revenue or ratings alone.

## 📁 Project Structure

```text
Food-Delivery-Analytics/
│
├── data/          # Raw CSV datasets
├── sql/           # Database setup and SQL analysis
├── notebooks/     # Python EDA notebook
├── images/        # Visualization outputs
├── docs/          # Project journal / documentation
└── README.md
```

## ▶️ How to Run

1. Clone or download this repository.
2. Create the MySQL database.
3. Execute the database setup SQL file.
4. Import the provided CSV datasets.
5. Run the SQL analysis queries.
6. Open the Jupyter Notebook.
7. Replace the placeholder MySQL credentials with your own local credentials.
8. Run the notebook cells to reproduce the Python analysis and visualizations.

> **Security:** Database passwords and other private credentials are intentionally not included in this repository.

## 🧠 Skills Demonstrated

**SQL • MySQL • Python • Pandas • Matplotlib • EDA • Data Validation • Relational Database Design • Data Visualization • KPI Analysis • Business Analysis • Analytical Storytelling**

## 📌 Project Takeaway

This project demonstrates an end-to-end analytical workflow:

**Business Problem → Relational Database → SQL Analysis → Python EDA → Visualization → Business Insights → Recommendations**
