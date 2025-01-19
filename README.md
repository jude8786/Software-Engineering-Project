
# Expense Tracker Application 🛠️💰

A Flutter-based project aimed at simplifying financial tracking and budget management. This project not only helps users stay organized with their finances but also showcases my learning journey and technical expertise.

---

## 🔍 Project Objective and Motivation

### Objective
Develop a small pet project as a way to re-engage with coding. This project, shared on GitHub, is designed to be simple and accompanied by concise documentation.

### Motivation
Managing finances isn’t just about adhering to a budget—it's also about understanding where your money goes. The chaotic process of piecing together bank statements, notes, and forgotten receipts makes budgeting difficult and often leads to overspending without clear insights.

With this app, financial tracking becomes straightforward. Users can view their finances clearly and comprehensively, reducing reliance on scattered notes and receipts. This project also serves as a tool for others looking to set up their own expense tracking systems and understand their spending habits.

Traditional methods, like notebooks and spreadsheets, were cumbersome and prone to errors. While there are various budgeting apps available, I wanted to create a customized solution that met my specific needs and provided instant clarity.

---

## 📝 Detailed Project Checklist

### 1. Use and Understand Git
Basic Git commands such as branching, merging, and time-travel techniques were used throughout the project.

---

### 2. UML Diagrams
Created three different UML diagrams: **Use Case**, **Component**, and **Class Diagrams**.

#### Class Diagram
![Corrected_Simple_Colored_Expense_Tracker_Class_Diagram](https://github.com/user-attachments/assets/995dfb30-9010-47b4-bc77-8ca518d9b9b1)

#### Activity Diagram
![Screenshot (186)](https://github.com/user-attachments/assets/b9df1cb9-d0c9-463c-b711-a230b47b6bb9)

#### Use Case Diagram
![Screenshot (189)](https://github.com/user-attachments/assets/43c2f83a-c07f-4f54-a9ea-6e6527d012aa)

---

### 3. Requirements Documentation

#### Trello (Simple Tool)

- **Initial Requirements:**

![Image](https://github.com/user-attachments/assets/1dcc0e34-4049-4a64-b2fb-fb1b3de20878)

- **Current Requirements:**
[Expense Tracker Requirements - Trello Board](https://trello.com/invite/b/6789867899c4728f8e4a732f/ATTIcff9c7eae0a753f74e7ad8290f92e3007D121905/expense-tracker)

#### Jira (Professional Tool)

- **Initial Requirements:**

![Image](https://github.com/user-attachments/assets/437faed0-1bb5-42d9-9fd9-bfbd24cb130f)

- **Current Requirements:**

![Image](https://github.com/user-attachments/assets/6bd789bb-996d-41a6-afca-cb7877cf3861)

---

### 4. System Analysis

#### Analysis Checklist:
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

[📄 Detailed Analysis PDF](https://github.com/jude8786/Software-Engineering-Project/blob/master/Expense%20Tracker%20Project%20Analysis%20Checklist.pdf)

---

### 5. Domain-Driven Design (DDD)
Conducted event-storming to discover relevant domains and created a **Core Domain Chart** illustrating their relationships and mappings.

#### Domain Charts:
![Screenshot (358)](https://github.com/user-attachments/assets/595ba08b-9aeb-4701-9aae-9f51982784b7)

![Screenshot (211)](https://github.com/user-attachments/assets/ea6527f6-d9c3-415a-9f83-1388b793e4d2)

![Screenshot (212)](https://github.com/user-attachments/assets/b2875f14-24ec-43e8-bfb0-9b92e3b2b959)

![Screenshot (356)](https://github.com/user-attachments/assets/e562d150-c262-4de4-bf5c-4da60dc69c93)

---

### 6. Metrics
Used **Dart’s linter** to ensure the code adheres to industry best practices, maintaining a clean and efficient codebase.

#### Project Metrics:
![Image](https://github.com/user-attachments/assets/cf9c1dbb-ccd5-433e-81dd-f0a0a5077670)

![Image](https://github.com/user-attachments/assets/abdc880d-7d5f-45d6-aba9-9935cbf29430)

![Image](https://github.com/user-attachments/assets/c21f63cc-ad10-4445-b3a6-af5c11acb6b5)

---

# Clean Code Development (CCD)

This project demonstrates clean code practices with examples and explanations. Below are the practices implemented in the codebase, along with their benefits.

---

## Clean Code Practices

### 1. Single Responsibility Principle
**Update:** The `_deleteExpense` logic was extracted into a separate private method to handle budget updates. This ensures the `_deleteExpense` method focuses only on removing the expense.

**Example:**
- `BudgetScreen` only manages budget operations instead of mixing transaction logic.

---

### 2. Readable Names
**Update:** Renamed `_buildHomeTab` to `_buildTransactionOverviewTab` for better clarity about its purpose.

**Example:**
- Updated `_buildHomeTab` to have meaningful and structured widgets like `_buildBudgetOverview` and `_buildTransactionList`.

---

### 3. Encapsulation
**Update:**
- State variables like `_selectedIndex` and `_expenses` are private to `HomeScreen` or `ExpenseTrackerAppState` to prevent external modifications.

**Example:**
- Encapsulated input validation logic within a private `_validateAndParseBudget` method. This method handles both validation and parsing, ensuring the rest of the code doesn’t need to worry about these details.

---

### 4. DRY (Don’t Repeat Yourself) Principle
**Updates:**
1. **Input Validation and Parsing:**
   - Encapsulated in the `_validateAndParseBudget` method to avoid redundant validation checks across multiple places.
   - This method is reused wherever input validation is required.

2. **Reusability:**
   - Removed repetitive `expenses.isEmpty` logic by creating a reusable private `_buildEmptyMessage` method.

---

### 5. User Feedback
**Update:**
- Added a confirmation dialog before deleting an expense to provide better user feedback and prevent accidental deletions.

---

## [CCD Cheat Sheet](https://github.com/jude8786/Software-Engineering-Project/blob/master/Clean_Code_Cheat_Sheet.pdf)
A personal CCD cheat sheet (PDF) with over 10 points is attached to this project. The cheat sheet covers essential practices for writing clean, maintainable, and scalable code.

---



8. REFACTORING: Show me two (non-trivial) Refactoring Examples of your code! Showing the original content and the refactored code! Explain what happened, why and how it has improved! Again: do not send me pure AI work!

Original Code
Here’s the current validation logic embedded in the Add Expense Screen


```dart
if (titleController.text.isEmpty) {
  showErrorDialog(context, 'Title is required.');
  return;
}

if (amountController.text.isEmpty || double.tryParse(amountController.text) == null) {
  showErrorDialog(context, 'Valid amount is required.');
  return;
}
```
Issues
Duplication: The same validation logic might be repeated for other fields across screens.
Mixed Concerns: Validation logic is directly embedded in the UI logic, which makes the code harder to read.


Refactored Code
Refactored the validation logic into a reusable method in the same file to ensure no new darts are introduced.


```dart
String? validateInput(String value, String fieldName, {bool isAmount = false}) {
  if (value.isEmpty) {
    return '$fieldName is required.';
  }
  if (isAmount && double.tryParse(value) == null) {
    return 'Valid $fieldName is required.';
  }
  return null;
}
```

Original Code
This snippet handles the logic for deleting an expense and adjusting the budget in the HomeScreen.


```dart
void _deleteExpense(int index) {
  final double amount = widget.expenses[index].amount;
  setState(() {
    widget.expenses.removeAt(index);
    widget.budget.remainingAmount += amount;
  });
}
```
Refactored Code
Refactor the logic into two separate methods: one for deleting the expense and another for adjusting the budget.


```dart
void _deleteExpense(int index) {
  final double amount = widget.expenses[index].amount;
  _removeExpenseAtIndex(index);
  _adjustBudget(amount);
}

void _removeExpenseAtIndex(int index) {
  setState(() {
    widget.expenses.removeAt(index);
  });
}

void _adjustBudget(double amount) {
  setState(() {
    widget.budget.remainingAmount += amount;
  });
}
```
How These Changes Improved the Code
Performance Optimization with const:
Prevents unnecessary widget rebuilds, improving app performance.
Reduces memory consumption by reusing immutable widgets.
Ensures a smoother user experience, especially during state changes.
Centralized Widget Constructor Parameters (Key? key):
Enhances widget tree identification, particularly during testing.
Improves maintainability by preparing the app for complex widget hierarchies.
Simplifies debugging and testing of individual widgets.
Improved Code Readability:
Logical ordering of widget properties makes code easier to read and follow.
Adherence to Dart's linting guidelines ensures standardized formatting.
Simplifies the onboarding process for future developers.
Error Validation and Messaging:
Improved error feedback for incomplete expense details (e.g., empty fields or missing categories).
Reduces user confusion by providing immediate feedback.
Ensures consistent error handling across the app.

9. Build Management
Employed a build tool (e.g., Maven or Gradle) to automate processes like documentation generation and testing.

10. Continuous Delivery
Implemented a CI/CD pipeline using tools like GitHub Actions, with at least two automated scripts.
Implemented a CI/CD pipeline using GitHub Actions with at least two automated scripts:

Install dependencies.
Run Tests
Build the release APK.



11. Unit Tests
Integrated comprehensive unit tests within the codebase.


Home Screen Tests (home_screen_test.dart):

Budget Overview Display: Verifies that the budget summary (Total Balance, Income, Expenses) is displayed accurately.
Transaction List Display: Confirms that expense titles (e.g., "Dinner", "Taxi") are correctly rendered on the home screen.


Add Expense Screen Tests (add_expense_screen_test.dart):

Form Field Validation: Ensures proper validation of required fields and price input during expense creation.
Transaction Addition: Tests that a new expense is added to the expense list and the budget is updated accordingly.







13. IDE Proficiency
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

13. AI Coding: Set Up an AI-coding environment on your computer like ZED, Aider, free Cursor / Windsurf programs, etc. Show your steps and personal experiences! 
I chose GitHub Copilot as my AI coding assistant because of its ability to understand the context of my project. It provides not just code snippets but also logical suggestions tailored to the structure of my application. Its versatility across different languages and frameworks makes it a robust tool for diverse coding tasks.

Personal Experience
Github Copilot was simple to get started and it immediately

Enhance Efficiency in Complex Logic:
Copilot assisted in generating intricate algorithms for filtering and sorting data, which would have taken more time to write manually.
Helped me add images to my catergories for the different expenses.


![Image](https://github.com/user-attachments/assets/54b226ef-dc37-416b-8a41-4b7d66f56587)

![Image](https://github.com/user-attachments/assets/8fb4bd07-45b9-41c8-b9c8-6701e1b62e01)

![Image](https://github.com/user-attachments/assets/67d779df-dc7a-4070-8d51-55fb3392ac45)

Copilot really helped me implement the images into my project as I was struggling to figure out how to add it to my project. It make my life easier by showing me how to add it and using my code to implement it. I will be using this feature mor often in the future.

14. **FUNCTIONAL PROGRAMMING:** prove that you have covered all functional aspects in your code as:
    - only final data structures
    - (mostly) side-effect-free functions
    - the use of higher-order functions
    - functions as parameters and return values
    - use closures / anonymous functions
 Final Data Structures
Immutability:
Using final ensures the data structures are not reassigned, reducing bugs caused by unintended mutations.

```dart
final List<Expense> expenses = [
  Expense(id: '1', title: 'Coffee', amount: 3.5, category: 'Food'),
  Expense(id: '2', title: 'Taxi', amount: 15.0, category: 'Transport'),
];
```

Why this is functional:
Once the expenses list is initialized, its reference cannot be reassigned.
This avoids unintended side effects and makes the code immutable.

Side-Effect-Free Functions

Side-Effect-Free Functions:
Functions like calculateTotalExpense are easier to test and debug because they don't depend on external state.

```dart
double calculateTotalExpense(List<Expense> expenses) {
  return expenses.fold(0, (sum, expense) => sum + expense.amount);
}
```

Why this is functional:
The function doesn’t modify the input list (expenses) or rely on external variables.
It is predictable and only computes the total based on its input.


Higher-Order Functions
Higher-Order Functions:
Improve reusability and flexibility by allowing custom logic to be passed as arguments.


```dart
void applyDiscount(List<Expense> expenses, double Function(double) discount) {
  for (var expense in expenses) {
    expense.amount = discount(expense.amount);
  }
}
```
Why this is functional:
applyDiscount takes a function (discount) as a parameter, which allows different discount strategies to be passed dynamically.

4. Functions as Parameters and Return Values
Functions as Parameters/Return Values:
Enables dynamic behavior and composition, making the code more modular and reusable.

```dart
Function calculateRemainingBudget(double budget) {
  return (double expenses) => budget - expenses;
}
```

Why this is functional:
The calculateRemainingBudget function returns a closure that calculates the remaining budget based on the input expenses.
This allows for flexibility and composition.


5. Closures / Anonymous Functions
Closures/Anonymous Functions:
Simplify logic by encapsulating behavior directly within higher-order functions like where.

```dart
List<Expense> filterExpenses(List<Expense> expenses, String category) {
  return expenses.where((expense) => expense.category == category).toList();
}
```
Why this is functional:
The anonymous function (expense) => expense.category == category is a closure because it captures the category variable from its surrounding scope.







🏆 Bonus
Set up and documented an AI-powered coding environment.

⚠️ Submission Reminder
Ensure all related documents, code snippets, and screenshots are accessible and organized within the README. The project and documentation aim to share personal experiences and practical insights gained during the process.

Submit only a public link to your GitHub repository in Moodle for evaluation. Repositories should remain public until grading is complete, then may be switched to private.
