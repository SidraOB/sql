# Participant Name : Sidra Zain
# Assignment 1: Design a Logical Model

## Question 1
Create a logical model for a small bookstore. 📚

At the minimum it should have employee, order, sales, customer, and book entities (tables). Determine sensible column and table design based on what you know about these concepts. Keep it simple, but work out sensible relationships to keep tables reasonably sized. Include a date table. There are several tools online you can use, I'd recommend [_Draw.io_](https://www.drawio.com/) or [_LucidChart_](https://www.lucidchart.com/pages/).

![Logical model for Bookstore](Lgical%20model%20for%20bookstore.png)

## Question 2
We want to create employee shifts, splitting up the day into morning and evening. Add this to the ERD.

Question 1 and Question 2 are combined in one ERD.

## Question 3
The store wants to keep customer addresses. Propose two architectures for the CUSTOMER_ADDRESS table, one that will retain changes, and another that will overwrite. Which is type 1, which is type 2?

_Hint, search type 1 vs type 2 slowly changing dimensions._

![Type 1 and Type 2 SCD](Type%201%20and%20Type%202%20SCD.png)

Bonus: Are there privacy implications to this, why or why not?
```
Both architectures present privacy implications, but Type 2 poses more significant challenges due to the retention of Addresses. Bookstore must implement robust data protection measures, provide clear privacy policies, and ensure compliance with applicable regulations to manage these implications effectively. Additionally, offering customers transparency and control over their data can help build trust and mitigate privacy concerns.
```

## Question 4
Review the AdventureWorks Schema [here](https://i.stack.imgur.com/LMu4W.gif)

Highlight at least two differences between it and your ERD. Would you change anything in yours?
```
The AdventureWorks database is a comprehensive schema used for demonstrating various aspects of business data management. Here are two notable differences between the AdventureWorks schema and the ERD I provided for a small bookstore:

Differences:

AdventureWorks:

1. This schema is much larger and more complex, featuring multiple entities like Production, purchasing, Sales, persons and more. It includes various dimensions catering to larger-scale business operations.
2. It uses a highly normalized approach, often separating information into numerous related tables to minimize data redundancy. For example, there are separate tables for Address, Contact Information, and other dimensions.

Bookstore ERD:

 1. The bookstore schema is simpler, focusing on core entities relevant to a small business. It primarily tracks Employees, Customers, Orders, Sales, and Books, with less emphasis on extensive attributes or multiple product categories.
2. While still maintaining some normalization, the bookstore schema is more straightforward, with fewer separate tables. For instance, customer address details are stored directly in the Customers table rather than in a separate Addresses table.

Potential Changes to the Bookstore ERD:

To align more closely with best practices seen in the AdventureWorks schema, I would consider normalizing the Customer table further. This could involve creating a separate Addresses table to manage customer addresses. This way, a customer could have multiple addresses (billing, shipping, etc.), and it would avoid redundancy.

In AdventureWorks, products are often categorized and linked to various attributes (like size, color, etc.). For the bookstore ERD, I might consider adding a Categories table to categorize books (e.g., Fiction, Non-Fiction, Children's), which would enhance the organization and querying capabilities of the book data.
```

# Criteria

[Assignment Rubric](./assignment_rubric.md)

# Submission Information

🚨 **Please review our [Assignment Submission Guide](https://github.com/UofT-DSI/onboarding/blob/main/onboarding_documents/submissions.md)** 🚨 for detailed instructions on how to format, branch, and submit your work. Following these guidelines is crucial for your submissions to be evaluated correctly.

### Submission Parameters:
* Submission Due Date: `September 28, 2024`
* The branch name for your repo should be: `model-design`
* What to submit for this assignment:
    * This markdown (design_a_logical_model.md) should be populated.
    * Two Entity-Relationship Diagrams (preferably in a pdf, jpeg, png format).
* What the pull request link should look like for this assignment: `https://github.com/<your_github_username>/sql/pull/<pr_id>`
    * Open a private window in your browser. Copy and paste the link to your pull request into the address bar. Make sure you can see your pull request properly. This helps the technical facilitator and learning support staff review your submission easily.

Checklist:
- [ ] Create a branch called `model-design`.
- [ ] Ensure that the repository is public.
- [ ] Review [the PR description guidelines](https://github.com/UofT-DSI/onboarding/blob/main/onboarding_documents/submissions.md#guidelines-for-pull-request-descriptions) and adhere to them.
- [ ] Verify that the link is accessible in a private browser window.

If you encounter any difficulties or have questions, please don't hesitate to reach out to our team via our Slack at `#cohort-4-help`. Our Technical Facilitators and Learning Support staff are here to help you navigate any challenges.
