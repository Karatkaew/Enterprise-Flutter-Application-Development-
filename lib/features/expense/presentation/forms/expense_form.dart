import 'package:flutter/material.dart';

class ExpenseForm extends StatefulWidget {

  const ExpenseForm({super.key});

  @override
  State<ExpenseForm> createState() => _ExpenseFormState();
}

class _ExpenseFormState extends State<ExpenseForm> {

  final _formKey = GlobalKey<FormState>();

  final storeController = TextEditingController();
  final amountController = TextEditingController();

  @override
  Widget build(BuildContext context) {

    return Form(
      key: _formKey,
      child: Column(
        children: [

          TextFormField(
            controller: storeController,
            decoration: const InputDecoration(
              labelText: "Store Name",
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return "Enter store name";
              }
              return null;
            },
          ),

          TextFormField(
            controller: amountController,
            decoration: const InputDecoration(
              labelText: "Amount",
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return "Enter amount";
              }
              return null;
            },
          ),

          ElevatedButton(
            onPressed: () {

              if (_formKey.currentState!.validate()) {

              }

            },
            child: const Text("Save"),
          )

        ],
      ),
    );
  }
}