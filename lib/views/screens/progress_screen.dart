import 'package:flutter/material.dart';
import 'package:flutter_diet_planner/models/progress_model.dart';
import 'package:flutter_diet_planner/views/provider/progress_provider.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class ProgressScreen extends StatefulWidget {
  @override
  _ProgressScreenState createState() => _ProgressScreenState();
}

class _ProgressScreenState extends State<ProgressScreen> {
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ProgressProvider>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Progress Screen'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const Text(
              'Input Progress',
              style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16.0),
            Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  const Text('Date'),
                  InkWell(
                    onTap: () async {
                      DateTime? pickedDate = await showDatePicker(
                        context: context,
                        initialDate: provider.selectedDate,
                        firstDate: DateTime(1900),
                        lastDate: DateTime.now(),
                      );
                      if (pickedDate != null) {
                        setState(() {
                          provider.selectedDate = pickedDate;
                        });
                      }
                    },
                    child: Container(
                      padding: const EdgeInsets.all(16.0),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                      ),
                      child: Row(
                        children: <Widget>[
                          const Icon(Icons.calendar_today),
                          const SizedBox(width: 16.0),
                          Text(
                            DateFormat('yyyy-MM-dd')
                                .format(provider.selectedDate),
                            style: const TextStyle(fontSize: 16.0),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 16.0),
                  TextFormField(
                    controller: provider.weightController,
                    decoration: const InputDecoration(labelText: 'Weight'),
                    keyboardType: TextInputType.number,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter weight';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 16.0),
                  TextFormField(
                    controller: provider.heightController,
                    decoration: const InputDecoration(labelText: 'Height'),
                    keyboardType: TextInputType.number,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter height';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 16.0),
                  ElevatedButton(
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        provider.addProgress();
                      }
                    },
                    child: const Text('Save'),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 32.0),
            const Text(
              'Progress List',
              style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16.0),
            Consumer<ProgressProvider>(builder: (context, provider, _) {
              return Expanded(
                child: ListView.builder(
                  itemCount: provider.listprogress.length,
                  itemBuilder: (context, index) {
                    Progress progress = provider.listprogress[index];
                    return ListTile(
                      title: Text(progress.date),
                      subtitle: Text(
                          'Weight: ${progress.weight}, Height: ${progress.height}'),
                      trailing: IconButton(
                        icon: const Icon(Icons.delete),
                        onPressed: () async {
                          await provider.deleteProgress(progress.id ?? 0);
                        },
                      ),
                    );
                  },
                ),
              );
            }),
          ],
        ),
      ),
    );
  }
}
