
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
![Image](https://github.com/user-attachments/assets/c3ae49e6-fae2-40e7-9705-a6239dbbfb2e)

![Image](https://github.com/user-attachments/assets/1c278085-5951-4e90-ab43-87701c6eff41)

![Image](https://github.com/user-attachments/assets/35a43d09-433e-409d-9b20-e7a553cf6f77)
![Image](https://github.com/user-attachments/assets/150d8c8d-9b50-4f03-9105-c7313c4dfb4a)

![Image](https://github.com/user-attachments/assets/d866df3d-7c29-41b7-8eb7-87ff9309599a)

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

## 7 Clean Code Practices

### 1. **Single Responsibility Principle**
**Update:** The `_deleteExpense` logic was extracted into separate private methods: `_removeExpense` and `_updateRemainingBudget`. This ensures that each method handles only one responsibility, simplifying the logic and improving readability.

**Example:**
- [`HomeScreen`](https://github.com/jude8786/Software-Engineering-Project/blob/master/lib/screens/home_screen.dart) handles expense deletion and budget updates using separate methods.

---

### 2. **Readable Names**
**Update:** The `_buildBudgetDetail` method was renamed and converted into a reusable widget called `BudgetDetail`. This change improves the readability and modularity of the code.

**Example:**
- [`HomeScreen`](https://github.com/jude8786/Software-Engineering-Project/blob/master/lib/screens/home_screen.dart) uses `BudgetDetail` for improved clarity and reusability.

---

### 3. **Encapsulation**
**Update:** Input validation logic in `AddExpenseScreen` was extracted into a private `_validateInputs` method. This encapsulates the validation logic, keeping it separate from the main logic of the `_saveExpense` method.

**Example:**
- [`AddExpenseScreen`](https://github.com/jude8786/Software-Engineering-Project/blob/master/lib/screens/add_expense_screen.dart) encapsulates validation in `_validateInputs`.

---

### 4. **DRY (Don’t Repeat Yourself) Principle**
**Update:** The logic for calculating category totals in `ExpenseSummaryScreen` was refactored to use `fold`, reducing redundancy and improving maintainability.

**Example:**
- [`ExpenseSummaryScreen`](https://github.com/jude8786/Software-Engineering-Project/blob/master/lib/screens/expense_summary_screen.dart) simplifies category total calculations using `fold`.

---

### 5. **Mixins**
**Update:** Shared validation logic was centralized into an `InputValidationMixin` for reuse across multiple widgets and screens.

**Example:**
- [`AddExpenseScreen`](https://github.com/jude8786/Software-Engineering-Project/blob/master/lib/screens/add_expense_screen.dart) applies `InputValidationMixin` for modular validation logic.

---

---

## [CCD Cheat Sheet](https://github.com/jude8786/Software-Engineering-Project/blob/master/Clean_Code_Cheat_Sheet.pdf)
A personal CCD cheat sheet (PDF) with over 10 points is attached to this project. The cheat sheet covers essential practices for writing clean, maintainable, and scalable code.

---



# 8. REFACTORING: Show me two (non-trivial) Refactoring Examples of your code! Showing the original content and the refactored code! Explain what happened, why and how it has improved! Again: do not send me pure AI work!

# Refactoring Examples

Below are two examples of code refactoring implemented in the project, along with explanations of the changes and their benefits.

---

### Example 1: Centralizing Input Validation in AddExpenseScreen

#### Original Code:

```dart
void _saveExpense() {
    final title = _titleController.text;
    final amount = double.tryParse(_amountController.text) ?? 0.0;

    if (title.isEmpty || amount <= 0 || _selectedDate == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please fill in all fields')),
      );
      return;
    }

    final newExpense = Expense(
      id: DateTime.now().toString(),
      title: title,
      amount: amount,
      category: _selectedCategory,
      date: _selectedDate!,
    );

    setState(() {
      widget.expenses.add(newExpense);
      widget.updateBudget(amount);
    });

    Navigator.of(context).pop();
}
```
#### Refactored Code:

```dart
bool _validateInputs() {
    if (_titleController.text.isEmpty ||
        double.tryParse(_amountController.text) == null ||
        _selectedDate == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please fill in all fields')),
      );
      return false;
    }
    return true;
}

void _saveExpense() {
    if (!_validateInputs()) return;

    final newExpense = Expense(
      id: DateTime.now().toString(),
      title: _titleController.text,
      amount: double.parse(_amountController.text),
      category: _selectedCategory,
      date: _selectedDate!,
    );

    setState(() {
      widget.expenses.add(newExpense);
      widget.updateBudget(newExpense.amount);
    });

    Navigator.of(context).pop();
}
```
---

#### Why I Refactored:
This change separates input validation into a dedicated _validateInputs method, adhering to the Single Responsibility Principle. It makes the _saveExpense method cleaner and focuses only on saving the expense. If input validation logic needs to be updated in the future, it can be done in one place.

Example 2: Simplifying Category Total Calculation in ExpenseSummaryScreen

---
#### Original Code:

```dart
Map<String, double> getCategoryTotals() {
    final Map<String, double> categoryTotals = {};

    for (var expense in expenses) {
      if (categoryTotals.containsKey(expense.category)) {
        categoryTotals[expense.category] =
            categoryTotals[expense.category]! + expense.amount;
      } else {
        categoryTotals[expense.category] = expense.amount;
      }
    }

    return categoryTotals;
}
```
---
#### Refactored Code:
```dart
Map<String, double> getCategoryTotals() {
    return expenses.fold(<String, double>{}, (totals, expense) {
      totals[expense.category] = (totals[expense.category] ?? 0) + expense.amount;
      return totals;
    });
}
```
---

#### Why I Refactored:
This refactor applies the DRY (Don’t Repeat Yourself) principle by replacing redundant logic with a functional approach using fold. The result is cleaner, more concise, and easier to maintain. If additional logic is needed for category totals in the future, this method is straightforward to update.

---
### Why this has made my code better than it was previously

- **Performance Optimization with `const`:**
  - Prevents unnecessary widget rebuilds, improving app performance.
  - Reduces memory consumption by reusing immutable widgets.

- **Centralized Widget Constructor Parameters (`Key? key`):**
  - Enhances widget tree identification, particularly during testing.
  - Improves maintainability by preparing the app for complex widget hierarchies.


- **Improved Code Readability:**
  - Logical ordering of widget properties makes code easier to read and follow.
  - Adherence to Dart's linting guidelines ensures standardized formatting.


- **Error Validation and Messaging:**
  - Improved error feedback for incomplete expense details (e.g., empty fields or missing categories).



---

## 9. Build Management
- Employed a build tool (e.g., **Gradle**) to automate processes like:
  - **Documentation generation**
  - **Testing**
  ---
## Key Files

### [`build.gradle`](https://github.com/jude8786/Software-Engineering-Project/blob/master/android/build.gradle)
Handles project-level configurations, including dependencies and build tasks.

### [`settings.gradle`](https://github.com/jude8786/Software-Engineering-Project/blob/master/android/settings.gradle)
Defines project structure and Gradle plugins.

### [`gradle.properties`](https://github.com/jude8786/Software-Engineering-Project/blob/master/android/gradle.properties)
Stores project-specific properties for improved manageability.


---

## 10. Continuous Delivery
- Implemented a CI/CD pipeline using [**GitHub Actions**](https://github.com/jude8786/Software-Engineering-Project/actions) with at least two automated scripts:
  1. Install dependencies.
  2. Run Tests.
  3. Build the release APK.

---

## 11. Unit Tests
Integrated comprehensive **unit tests** within the codebase to ensure robustness and reliability.

### [Home Screen Tests](https://github.com/jude8786/Software-Engineering-Project/blob/master/Test/home_screen_test.dart) (`home_screen_test.dart`):
- **Budget Overview Display**: Verifies that the budget summary (`Total Balance`, `Income`, `Expenses`) is displayed accurately.
- **Transaction List Display**: Confirms that expense titles (e.g., "Dinner", "Taxi") are correctly rendered on the home screen.

### [Add Expense Screen Tests](https://github.com/jude8786/Software-Engineering-Project/blob/master/Test/add_expense_screen_test.dart) (`add_expense_screen_test.dart`):
- **Form Field Validation**: Ensures proper validation of required fields and price input during expense creation.
- **Transaction Addition**: Tests that a new expense is added to the expense list and the budget is updated accordingly.

---

## 12. IDE Proficiency
- Used a preferred IDE (**VSCode**) and documented favorite shortcuts and techniques for efficient development.

### Key Features Used:
- **Extensions**:
  - Flutter, Dart, Flutter Stylizer, GitLens
- **Integrated Terminal**:
  - Running `flutter pub get`, `flutter analyze`, and version control commands.
- **Debugging**:
  - Using the Flutter Inspector, examining widget trees, and stepping through code with breakpoints.

### Favorite Shortcuts:
| Shortcut                  | Functionality                                                       |
|---------------------------|---------------------------------------------------------------------|
| **Ctrl + Shift + O**      | View and navigate to symbols (methods, classes) in the current file. |
| **Alt + Shift + F10**     | Toggle between the Flutter Inspector and Debug Console during debugging. |
| **Ctrl + Shift + K**      | Delete the current line of code.                                    |
| **F6**                    | Rename a variable or method and refactor all occurrences in the project. |
| **Ctrl + Shift + M**      | Open the Problems tab to view errors and warnings across the project. |
| **Ctrl + Shift + T**      | Reopen a recently closed file in your workspace.                   |
| **Shift + Alt + Arrow**   | Expand or shrink the selection scope (e.g., to select a widget or method). |
| **Ctrl + ` (Backtick)**   | Quickly open or hide the integrated terminal.                      |

---

## 13. AI Coding
- Set up an AI-coding environment on my computer using **GitHub Copilot** due to its ability to:
  - Understand the context of my project.
  - Provide logical suggestions tailored to the structure of my application.
  - Versatility across different languages and frameworks.

### Personal Experience:
- **GitHub Copilot** was simple to set up and immediately enhanced my coding experience by:
  - Assisting in **complex logic generation** (e.g., filtering and sorting data).
  - Helping me add **images to categories** for different expenses.

#### Example Contributions:
1. Enhanced efficiency in creating algorithms for filtering and sorting expense data.
2. Helped integrate images for expense categories to improve UI/UX.

#### Screenshots:
![Image](https://github.com/user-attachments/assets/54b226ef-dc37-416b-8a41-4b7d66f56587)
![Image](https://github.com/user-attachments/assets/8fb4bd07-45b9-41c8-b9c8-6701e1b62e01)
![Image](https://github.com/user-attachments/assets/67d779df-dc7a-4070-8d51-55fb3392ac45)

---

### Reflection:
- **Copilot** helped me implement images into my project when I struggled with the integration process.
- It made my life easier by suggesting how to use my existing code for implementation.
- I will continue using this tool for future improvements and efficiency in development.

---



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

---

### My Experience with this project


Working on this project has been an incredible learning experience, allowing me to explore and apply various aspects of software engineering and mobile app development. I gained hands-on experience with Flutter, learning how to create dynamic and responsive UIs while managing state effectively. Implementing clean code principles, such as the Single Responsibility Principle and DRY (Don't Repeat Yourself), helped me write more maintainable and scalable code. I also delved into functional programming concepts like immutability, higher-order functions, and closures, which improved the efficiency and readability of my code. Setting up a CI/CD pipeline with GitHub Actions and using Gradle for build management gave me insight into automating testing, building, and deployment processes, which streamlined the workflow. One of the most challenging yet rewarding parts was debugging issues like asset management and form validation, which strengthened my problem-solving skills. I thoroughly enjoyed designing the user interface, particularly adding images to expense categories to make the app more visually engaging. Testing the application with unit tests and exploring tools like GitHub Copilot further enriched my development experience. Overall, this project not only honed my technical skills but also taught me the importance of organization, attention to detail, and persistence in overcoming challenges. It has been a fulfilling journey, and I am excited to apply these learnings to future projects.





