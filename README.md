🔍 Project Objective and Motivation
A) Objective
Develop a small pet project as a way to re-engage with coding. This project, shared on GitHub, will be simple (e.g., a console-based game) and accompanied by concise documentation.

Motivation
I've realized that one of the toughest parts of financial management isn't just adhering to a budget but understanding where my money actually goes. Countless times, I’ve found myself sifting through bank statements, notes, and forgotten receipts to piece together my monthly expenses. This chaotic process made budgeting difficult and often led to overspending without any clear insights.

With this app, I aimed to make financial tracking straightforward, helping myself and others stay organized and on budget. Now, instead of relying on scattered notes and receipts, I can view my finances in a clear, comprehensive way. This project also serves as a tool for others who want to set up their own expense tracking systems and better understand their spending habits.

Traditional methods, like notebooks and spreadsheets, were cumbersome and prone to errors. While there are various budgeting apps available, I wanted to create a customized solution that met my specific needs and provided instant clarity.

📝 Detailed Project Checklist
Below is a checklist addressing each of the points outlined in the learning objectives, with explanations.

1. Use and Understand GIT
Basic Git commands were used throughout the project, including branching, merging, and experimenting with time travel techniques.

2. UML Diagrams
Created at least three different UML diagrams: Use Case, Component, and Class Diagrams, exported for easy viewing.



Class Diagram
![Corrected_Simple_Colored_Expense_Tracker_Class_Diagram](https://github.com/user-attachments/assets/995dfb30-9010-47b4-bc77-8ca518d9b9b1)


Activity Diagram
![Screenshot (186)](https://github.com/user-attachments/assets/b9df1cb9-d0c9-463c-b711-a230b47b6bb9)


Use Case Diagram
![Screenshot (189)](https://github.com/user-attachments/assets/43c2f83a-c07f-4f54-a9ea-6e6527d012aa)



3. Requirements Documentation
Developed 5-10 requirements and documented them in tools like Airtable or Notion, with additional integration into a professional tool such as Jira. Mentioned the use of AI/LLMs for assistance.

I. User Authentication:
The app MUST implement user authentication to ensure data security and personalized access.
Users MUST log in to view and manage their expenses.
Authentication SHOULD adhere to best practices for secure data handling.

II. Budget Setting and Management:
Users MUST be able to set a budget, which updates automatically as expenses are added or deleted.
The app MUST display the remaining budget in real-time.
Budget alerts SHOULD notify users when a set budget threshold (e.g., 80%) is reached.

III. Expense Entry and Management:
Users MUST be able to add, edit, and delete expenses with details such as description, amount, category, and date.
Expense data MUST be validated for correctness and completeness before being saved.
Deleting an expense MUST adjust the budget to reflect the updated balance.

IV. Visual Expense Representation:
The app MUST include a bar graph that shows total expenses for each day of the week.
The bar graph MUST update in real-time when expenses are added or edited.
Data visualization SHOULD clearly display expense amounts and labels for each day of the week.

V. Dark/Light Mode Support:
The app MUST provide a toggle option for switching between dark and light themes.
The UI SHOULD maintain a consistent, user-friendly experience in both modes.

VI. Expense Categories and Filtering:
Users MUST be able to categorize expenses and filter them by category or date.
The filtering system MUST be efficient and return accurate results.
The app SHOULD enable users to view expenses based on specific filters for better tracking and analysis.


### 4. System Analysis

#### Checklist for Analysis:
- [ ] Problem Definition
- [ ] Target Audience
- [ ] Unique Selling Proposition (USP)
- [ ] Competitor Analysis
- [ ] Core Features
- [ ] Monetization Strategy
- [ ] Technical Feasibility
- [ ] User Experience (UX) Design
- [ ] Data Privacy and Security
- [ ] Scalability
- [ ] Market Validation
- [ ] Development Timeline
- [ ] Risks and Challenges
- [ ] Innovation Potential
- [ ] Future Expansion

The detailed pdf file is in the link below
[PDF File](https://github.com/jude8786/Software-Engineering-Project/blob/master/Expense%20Tracker%20Project%20Analysis%20Checklist.pdf)

5. Domain-Driven Design (DDD)
Conducted event-storming to discover relevant domains and charted these domains into a Core Domain Chart, illustrating their relationships and mappings.

![Screenshot (358)](https://github.com/user-attachments/assets/595ba08b-9aeb-4701-9aae-9f51982784b7)


![Screenshot (211)](https://github.com/user-attachments/assets/ea6527f6-d9c3-415a-9f83-1388b793e4d2)



![Screenshot (212)](https://github.com/user-attachments/assets/b2875f14-24ec-43e8-bfb0-9b92e3b2b959)



![Screenshot (356)](https://github.com/user-attachments/assets/e562d150-c262-4de4-bf5c-4da60dc69c93)



7. Metrics
Included project metrics such as SonarQube analysis and additional non-trivial metrics.

8. Clean Code Development (CCD)
Demonstrated at least 5 clean code practices in the codebase, with explanations for why they are considered clean. Attached a personal CCD cheat sheet (PDF) with >10 points.

Single Responsibility Principle
Update: The _deleteExpense logic is extracted into a separate private method to handle budget updates, ensuring the _deleteExpense method focuses only on removing the expense.

Readable Names
Update: Renamed _buildHomeTab to _buildTransactionOverviewTab for better clarity about its purpose.



Single Responsibility Principle

Example: BudgetScreen only manages budget operations instead of mixing transaction logic.
Readable Names

Updated _buildHomeTab to have meaningful and structured widgets like _buildBudgetOverview and _buildTransactionList.
Encapsulation

State variables like _selectedIndex and _expenses are private to HomeScreen or ExpenseTrackerAppState to avoid external modifications.
DRY Principle

Encapsulation:
Encapsulated the input validation logic within a private _validateAndParseBudget method. This method now handles both validation and parsing, ensuring the rest of the code doesn’t worry about these details.
_validateAndParseBudget encapsulates validation and parsing, which keeps the main _submitBudget method focused on handling the user action.



DRY Principle:
Reused _validateAndParseBudget for both input validation and parsing, avoiding redundant validation checks in multiple places.
Avoided duplicating validation logic in multiple places. The same _validateAndParseBudget method is reused wherever input validation is required.

DRY Principle:
Removed repetitive expenses.isEmpty logic by creating a reusable private _buildEmptyMessage method.


User Feedback:
Added a confirmation dialog before deleting an expense to provide better user feedback and prevent accidental deletions.



9. Build Management
Employed a build tool (e.g., Maven or Gradle) to automate processes like documentation generation and testing.

10. Continuous Delivery
Implemented a CI/CD pipeline using tools like GitHub Actions, with at least two automated scripts.

11. Unit Tests
Integrated comprehensive unit tests within the codebase.

12. IDE Proficiency
Used a preferred IDE (e.g., VSCode or IntelliJ) and documented the favorite shortcuts and techniques.

Key Features Used:
Extensions:
Flutter, Dart, Flutter Stylizer, GitLens
Integrated Terminal:
Running flutter pub get, flutter analyze, and version control commands.
Debugging:
Using the Flutter Inspector, examining widget trees, and stepping through code with breakpoints.



Favorite Shortcuts:
Ctrl + Shift + O: View and navigate to symbols (methods, classes) in the current file.
Alt + Shift + F10: Toggle between the Flutter Inspector and Debug Console during debugging.
Ctrl + Shift + K: Delete the current line of code.
F6: Rename a variable or method and refactor all occurrences in the project.
Ctrl + Shift + M: Open the Problems tab to view errors and warnings across the project.
Ctrl + Shift + T: Reopen a recently closed file in your workspace.
Shift + Alt + Right/Left Arrow: Expand or shrink the selection scope (e.g., to select a widget or method).
Ctrl + ` (Backtick): Quickly open or hide the integrated terminal.

14. DSL Implementation
Included a demonstration of a Domain-Specific Language snippet in the project.

15. Functional Programming
Demonstrated the use of functional programming aspects such as side-effect-free functions, closures, and higher-order functions.

🏆 Bonus
Set up and documented an AI-powered coding environment.

⚠️ Submission Reminder
Ensure all related documents, code snippets, and screenshots are accessible and organized within the README. The project and documentation aim to share personal experiences and practical insights gained during the process.

Submit only a public link to your GitHub repository in Moodle for evaluation. Repositories should remain public until grading is complete, then may be switched to private.
