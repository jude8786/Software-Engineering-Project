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
Simple Tool Trello

Requirements in the begining 

![Image](https://github.com/user-attachments/assets/1dcc0e34-4049-4a64-b2fb-fb1b3de20878)


Requirements currently

[Expense Tracker Requirements- Trello tool](https://trello.com/invite/b/6789867899c4728f8e4a732f/ATTIcff9c7eae0a753f74e7ad8290f92e3007D121905/expense-tracker)


Professional Tool Jira

Requirements in the begining


![Image](https://github.com/user-attachments/assets/437faed0-1bb5-42d9-9fd9-bfbd24cb130f)

Requirements currently
![Image](https://github.com/user-attachments/assets/6bd789bb-996d-41a6-afca-cb7877cf3861)


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



6. Metrics
Included project metrics such as SonarQube analysis and additional non-trivial metrics.

I used Dart's linter to ensure the codebase adheres to industry best practices and maintains a high standard of quality throughout the development process. Dart's linter is a powerful tool that helps identify potential issues and encourages clean, efficient, and maintainable code.

My issues throughout my project

![Image](https://github.com/user-attachments/assets/cf9c1dbb-ccd5-433e-81dd-f0a0a5077670)

![Image](https://github.com/user-attachments/assets/abdc880d-7d5f-45d6-aba9-9935cbf29430)

![Image](https://github.com/user-attachments/assets/c21f63cc-ad10-4445-b3a6-af5c11acb6b5)




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

8. REFACTORING: Show me two (non-trivial) Refactoring Examples of your code! Showing the original content and the refactored code! Explain what happened, why and how it has improved! Again: do not send me pure AI work!

Original Code

Issues
Repetition: The logic for building each transaction card was repeated for every item in the list.
Limited Reusability: If a similar card UI was needed elsewhere, you’d have to duplicate the code.
Readability: The method was cluttered, mixing UI layout with list logic, making it harder to understand.


## Transaction List Widget

This widget dynamically generates a transaction list displaying expense details like amount, title, category, and date. Each entry also includes a delete button.

```dart
Widget _buildTransactionList() {
  return ListView.builder(
    itemCount: widget.expenses.length,
    itemBuilder: (ctx, index) {
      final expense = widget.expenses[index];
      return Card(
        elevation: 3,
        margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        child: ListTile(
          leading: CircleAvatar(
            radius: 30,
            backgroundColor: Colors.teal,
            child: Padding(
              padding: const EdgeInsets.all(6),
              child: FittedBox(
                child: Text('\$${expense.amount.toStringAsFixed(2)}'),
              ),
            ),
          ),
          title: Text(expense.title, style: const TextStyle(fontWeight: FontWeight.bold)),
          subtitle: Text('${expense.category} - ${DateFormat.yMMMd().format(expense.date)}'),
          trailing: IconButton(
            icon: const Icon(Icons.delete, color: Colors.red),
            onPressed: () => _deleteExpense(index),
          ),
        ),
      );
    },
  );
}dart```

Refactored Code

How It Was Fixed
Created a reusable TransactionCard widget to handle the card UI.
Simplified _buildTransactionList() by delegating the card-building logic to TransactionCard.

## Transaction List and Card Widgets

The transaction list has been refactored to improve readability and reusability. The `TransactionCard` widget separates the logic for each individual transaction into its own reusable component.

### Code Implementation

```dart
// Transaction List Widget
Widget _buildTransactionList() {
  return ListView.builder(
    itemCount: widget.expenses.length,
    itemBuilder: (ctx, index) {
      final expense = widget.expenses[index];
      return TransactionCard(
        expense: expense,
        onDelete: () => _deleteExpense(index),
      );
    },
  );
}

// Transaction Card Widget
class TransactionCard extends StatelessWidget {
  final Expense expense;
  final VoidCallback onDelete;

  const TransactionCard({
    Key? key,
    required this.expense,
    required this.onDelete,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      child: ListTile(
        leading: CircleAvatar(
          radius: 30,
          backgroundColor: Colors.teal,
          child: Padding(
            padding: const EdgeInsets.all(6),
            child: FittedBox(
              child: Text('\$${expense.amount.toStringAsFixed(2)}'),
            ),
          ),
        ),
        title: Text(
          expense.title,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Text(
          '${expense.category} - ${DateFormat.yMMMd().format(expense.date)}',
        ),
        trailing: IconButton(
          icon: const Icon(Icons.delete, color: Colors.red),
          onPressed: onDelete,
        ),
      ),
    );
  }
}```


9. Build Management
Employed a build tool (e.g., Maven or Gradle) to automate processes like documentation generation and testing.

10. Continuous Delivery
Implemented a CI/CD pipeline using tools like GitHub Actions, with at least two automated scripts.

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
    
    You can also do it outside of your project. Even in other languages such as F#, Clojure, Julia, etc.










🏆 Bonus
Set up and documented an AI-powered coding environment.

⚠️ Submission Reminder
Ensure all related documents, code snippets, and screenshots are accessible and organized within the README. The project and documentation aim to share personal experiences and practical insights gained during the process.

Submit only a public link to your GitHub repository in Moodle for evaluation. Repositories should remain public until grading is complete, then may be switched to private.
