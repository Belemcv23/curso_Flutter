import 'package:flutter/material.dart';

class SecondClass extends StatefulWidget {
  const SecondClass({super.key});
  

  @override
  State<SecondClass> createState() => _SecondClassState();
}

class _SecondClassState extends State<SecondClass> {
  final _formKey = GlobalKey<FormState>();

  String name = '';
  int age = 0;
  String password = '';
  String maritalStatus = 'Single';
  bool termsChecked = true;
  String? selectedLocation;

  final List<String> locations = ['A', 'B', 'C', 'D'];

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        elevation: 10.0,
        title:Center(child: Text('Title'),
        ),
        actions:<Widget> [
          Icon(Icons.settings), 
        ],
        // bottom: PreferredSize(
          //     preferredSize: Size.fromHeight(40.0),
          //   child: Text('This is a text in appbar'),
          // ),
        ),
        body: Material(
          child:SingleChildScrollView(
            child: Container(
              margin:EdgeInsets.symmetric(horizontal:10.0),
              child:Form(
                key:_formKey,
                child:Column(
                  children:<Widget> [
                    TextFormField(
                      decoration: InputDecoration(labelText: 'Enter Name', hintText: 'name'),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter a name';
                        }
                        return null;
                      },
                      onSaved: (value) {
                        setState(() {
                          name = value ?? '';
                        });
                      },
                    ),
                    TextFormField(
                      decoration: InputDecoration(hintText: 'Age', labelText: 'Enter Age'),
                      keyboardType: TextInputType.phone,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your age';
                        }
                        return null;
                      },
                      onSaved: (value) {
                        setState(() {
                          age = int.tryParse(value ?? '') ?? 0;
                        });
                      },
                    ),
                    TextFormField(
                      obscureText: true,
                      decoration: InputDecoration(
                        hintText: 'Password', labelText: 'Enter Password'),
                    ),
                    DropdownButton<String>(
                      hint: const Text('Please choose the city you live in'),
                      value: selectedLocation,
                      items: locations.map((location) {
                        return DropdownMenuItem<String>(
                          value: location,
                          child: Text(location),
                        );
                      }).toList(),
                      onChanged: (String? newValue) {
                        setState(() {
                          selectedLocation = newValue;
                        });
                      },
                    ),
                    RadioGroup<String>(
                      groupValue: maritalStatus,
                      onChanged: (String? value) {
                        setState(() {
                          maritalStatus = value ?? 'Single';
                        });
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Expanded(
                            child: RadioListTile<String>(
                              title: const Text('Single'),
                              value: 'Single',
                            ),
                          ),
                          Expanded(
                            child: RadioListTile<String>(
                              title: const Text('Married'),
                              value: 'Married',
                            ),
                          ),
                        ],
                      ),
                    ),
                    CheckboxListTile(
                      value: termsChecked,
                      onChanged: (value) {
                        setState(() {
                          termsChecked = value ?? false;
                        });
                      },
                      title: const Text(
                        'Sign up for the newspaper and related articles',
                      ),
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue,
                        foregroundColor: Colors.white,
                      ),
                      onPressed: () {
                        _submitForm();
                      },
                      child: const Text('Register'),
                    ),
                  ],
                ),
              ),
            ),
          )
        )
    );
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();

      debugPrint('Name: $name');
      debugPrint('Age: $age');
      debugPrint('Password: $password');
      debugPrint('City: ${selectedLocation ?? 'None'}');
      debugPrint('Marital Status: $maritalStatus');
      debugPrint('Terms Checked: $termsChecked');
    }
  }
}
