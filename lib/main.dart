import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: AddEmployeeScreen(),
    );
  }
}

class AddEmployeeScreen extends StatefulWidget {
  @override
  _AddEmployeeScreenState createState() => _AddEmployeeScreenState();
}

class _AddEmployeeScreenState
    extends State<AddEmployeeScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _ageController = TextEditingController();
  final _salaryController = TextEditingController();

  void _addEmployee() {
    if (_formKey.currentState!.validate()) {
      print('Name: ${_nameController.text},'
          ' Age: ${_ageController.text},'
          ' Salary: ${_salaryController.text}');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Add Employee')),


      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _nameController,


                decoration: InputDecoration(labelText: 'Name'),
                validator: (value) => value!.isEmpty ? 'Enter a name' : null,
              ),


              TextFormField(
                controller: _ageController,
                decoration: InputDecoration(labelText: 'Age'),
                keyboardType: TextInputType.number,
                validator: (value) => value!.isEmpty || int.tryParse(value) == null ? 'Enter a valid age' : null,
              ),


              TextFormField(
                controller: _salaryController,
                decoration: InputDecoration(labelText: 'Salary'),
                keyboardType: TextInputType.number,
                validator: (value) => value!.isEmpty || double.tryParse(value) == null ? 'Enter a valid salary' : null,
              ),


              SizedBox(height: 20),
              ElevatedButton(
                onPressed: _addEmployee,
                child: Text('Add Employee'),


              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _nameController.dispose();
    _ageController.dispose();
    _salaryController.dispose();
    super.dispose();
  }
}