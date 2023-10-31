import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:zipatala/model/facility.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late List<Facility> facilities = [];

  Future<void> fetchData() async {
    final response = await http.get(Uri.parse(
        'https://c68d-137-64-0-28.ngrok-free.app/api/v1/facilities'));

    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body);
      print('API Response: $data'); // Print API response
      setState(() {
        facilities = data.map((json) => Facility.fromJson(json)).toList();
      });
    } else {
      print('Failed to load facilities. Status code: ${response.statusCode}');
      throw Exception('Failed to load facilities');
    }
    print('Facilities Length: ${facilities.length}');
  }

  @override
  void initState() {
    super.initState();
    fetchData();
    print('object');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text(
          'Luke International',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: <Widget>[
              Container(
                width: double.infinity, // Maximize the width of the card
                child: Center(
                  child: Card(
                    elevation: 3.0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    color: Colors.blue,
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        children: <Widget>[
                          Icon(
                            Icons.account_circle,
                            size: 80.0,
                            color: Colors.white,
                          ),
                          SizedBox(height: 16.0),
                          Text(
                            'Welcome',
                            style: TextStyle(
                              fontSize: 24.0,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 8.0),
                          Text(
                            'Master Health Facility Registry',
                            style: TextStyle(
                              fontSize: 16.0,
                              color: Colors.white,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                  height:
                      16.0), // Adding space between the welcome card and the row
              Row(
                mainAxisAlignment: MainAxisAlignment
                    .spaceBetween, // Align texts to the start and end of the row
                children: <Widget>[
                  Text('Facilities',
                      style: TextStyle(
                          fontSize: 18.0, fontWeight: FontWeight.bold)),
                  GestureDetector(
                    onTap: () {
                      // Handle "See All" tap
                    },
                    child: Text('See All',
                        style: TextStyle(fontSize: 16.0, color: Colors.blue)),
                  ),
                ],
              ),
              SizedBox(height: 16.0),
              // Adding space between the row and the ListView
              facilities == null || facilities.isEmpty
                  ? Center(child: CircularProgressIndicator())
                  : ListView.builder(
                      shrinkWrap: true,
                      itemCount: facilities.length,
                      itemBuilder: (context, index) {
                        final facility = facilities[index];
                        return ListTile(
                          title: Text(
                            facility.facilityName,
                            style: TextStyle(
                              fontSize: 16.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          subtitle: Text(
                            facility.facilityCode,
                            style: TextStyle(
                              fontSize: 14.0,
                              color: Colors.grey,
                            ),
                          ),
                          leading: CircleAvatar(
                            radius: 20.0,
                            backgroundColor: Colors.blue,
                            child: Icon(
                              Icons.local_hospital,
                              color: Colors.white,
                              size: 20.0,
                            ),
                          ),
                          trailing: Icon(
                            Icons.arrow_circle_right,
                            color: Colors.blue,
                            size: 30.0,
                          ),
                          onTap: () {
                            // Handle tap on the ListTile
                          },
                        );
                      },
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
