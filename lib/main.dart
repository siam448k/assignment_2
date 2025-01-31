import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ContactListScreen(),
    );
  }
}

class ContactListScreen extends StatefulWidget {
  @override
  _ContactListScreenState createState() => _ContactListScreenState();
}

class _ContactListScreenState extends State<ContactListScreen> {
  final TextEditingController nameController
                            = TextEditingController();
  final TextEditingController numberController
                            = TextEditingController();
  List<Map<String, String>> contactList = [];

  void addContact() {
    String name =
                nameController.text.trim();
    String number =
                numberController.text.trim();
    if (name.isNotEmpty && number.isNotEmpty) {
      setState(() {
        contactList.add({'name': name,
                        'number': number});
      });
      nameController.clear();
      numberController.clear();
    }
  }

  void deleteContact(int index) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text("Confirmation"),
        content: Text("Are you sure for Delete?"),
        actions: [
          TextButton(
            onPressed: () =>
                           Navigator.of(context).pop(),
            child: Text("Cancel"),
          ),
          TextButton(
            onPressed: () {
              setState(() {
                contactList.removeAt(index);
              });
              Navigator.of(context).pop();
            },
            child: Text("Delete", style: TextStyle(color: Colors.red)),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(


      appBar: AppBar(
        title: Text("Contact List"),
        backgroundColor: Colors.blueGrey,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [


            TextField(
              controller: nameController,
              decoration: InputDecoration(
                labelText: "Name",
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 5),


            TextField(
              controller: numberController,
              decoration: InputDecoration(
                labelText: "Number",
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.phone,
            ),
            SizedBox(height: 5),


            ElevatedButton(
              onPressed: addContact,
              child: Text("Add"),
              style: ElevatedButton.styleFrom(
                minimumSize: Size(double.infinity, 50),
              ),
            ),
            SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
              itemCount: contactList.length,
              itemBuilder: (context, index) {
              return Card(
              child: ListTile(
              leading: CircleAvatar(
              child: Icon(Icons.person),
                      ),


                      title: Text(
                        contactList[index]['name']!,
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),


                      subtitle: Text(contactList[index]['number']!),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [


                          IconButton(
                            icon: Icon(Icons.call, color: Colors.blue),
                            onPressed: () {

                            },
                          ),
                          IconButton(
                            icon: Icon(Icons.delete, color: Colors.red),
                            onPressed: () => deleteContact(index),
                          ),
                        ],
                      ),
                      onLongPress: () => deleteContact(index),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}