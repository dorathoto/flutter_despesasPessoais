import 'package:flutter/material.dart';

class TransactionForm extends StatelessWidget {
  final titleController = TextEditingController();
  final valueController = TextEditingController();

  final void Function(String, double) onSubmit;

  TransactionForm(this.onSubmit);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: <Widget>[
            TextField(
              controller: titleController,
              decoration: InputDecoration(labelText: 'Titulo'),
            ),
            TextField(
              controller: valueController,
              decoration: InputDecoration(labelText: 'Valor (R\$)'),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                  style: TextButton.styleFrom(
                      textStyle: TextStyle(fontSize: 20, color: Colors.purple)),
                  child: Text('Nova transação'),
                  onPressed: () {
                    final title = titleController.text;
                    final valor = double.tryParse(valueController.text) ?? 0;
                    onSubmit(title, valor);
                  },
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
