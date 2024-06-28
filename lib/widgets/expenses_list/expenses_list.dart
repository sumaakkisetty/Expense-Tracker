import 'package:flutter/material.dart';

import '../../models/expense_model.dart';
import './expense_item.dart';

class ExpensesList extends StatelessWidget {
  const ExpensesList(
      {required this.expenses, required this.onRemoveExpense, super.key});

  final List<Expense> expenses;
  final Function(Expense expense) onRemoveExpense;

  @override
  Widget build(BuildContext context) {
  return Column(
    children: [
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          'Swipe to delete an Expense',
          style: TextStyle(fontSize: 10, fontWeight: FontWeight.normal),
        ),
      ),
      Expanded(
        child: ListView.builder(
          itemCount: expenses.length,
          itemBuilder: (ctx, index) {
            return Dismissible(
              key: ValueKey(expenses[index]),
              background: Container(
                color: Theme.of(context).colorScheme.error.withOpacity(0.75),
                margin: EdgeInsets.symmetric(
                  horizontal: Theme.of(context).cardTheme.margin!.horizontal,
                ),
              ),
              onDismissed: (direction) {
                onRemoveExpense(expenses[index]);
              },
              child: ExpenseItem(expense: expenses[index]),
            );
          },
        ),
      ),
    ],
  );
}
}
