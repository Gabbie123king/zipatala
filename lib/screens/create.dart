import 'package:flutter/material.dart';
import 'package:zipatala/screens/home_screen.dart';

import '../Database/DatabaseService.dart';

class Create extends StatefulWidget {
  const Create({Key? key}) : super(key: key);

  @override
  State<Create> createState() => _CreateState();
}

class _CreateState extends State<Create> {

  final _formKey = GlobalKey<FormState>();
  final dbHelper = DatabaseHelper.instance;

  TextEditingController _facilityCodeController = TextEditingController();
  TextEditingController _facilityNameController = TextEditingController();
  TextEditingController _districtNameController = TextEditingController();
  TextEditingController _ownerController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text('Create Facility', style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600),),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: <Widget>[
              Form(
                key: _formKey,
                child: Column(
                  children: <Widget>[
                    TextFormField(
                      controller: _facilityCodeController,
                      decoration: InputDecoration(labelText: 'Facility Code'),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter facility code';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 16),
                    TextFormField(
                      controller: _facilityNameController,
                      decoration: InputDecoration(labelText: 'Facility Name'),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter facility name';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 16),
                    TextFormField(
                      controller: _districtNameController,
                      decoration: InputDecoration(labelText: 'District Name'),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter district name';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 16),
                    TextFormField(
                      controller: _ownerController,
                      decoration: InputDecoration(labelText: 'Owner'),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter owner name';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 32),
                    ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          // Insert data into the database
                          Map<String, dynamic> row = {
                            DatabaseHelper.columnFacilityCode: _facilityCodeController.text,
                            DatabaseHelper.columnFacilityName: _facilityNameController.text,
                            DatabaseHelper.columnDistrictName: _districtNameController.text,
                            DatabaseHelper.columnOwner: _ownerController.text,
                          };
                          dbHelper.insert(row).then((id) {
                            print('Inserted row id: $id');
                            ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(content: Text('Facility details inserted')));
                          });
                        }
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Home()),
                        );
                      },
                      child: Text('Submit'),
                      style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
