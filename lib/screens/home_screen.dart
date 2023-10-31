import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text('Luke International', style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600),),
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
              SizedBox(
                  height:
                      16.0), // Adding space between the row and the ListView
              ListView(
                shrinkWrap:
                    true, // Ensures that ListView takes only the space it needs
                children: <Widget>[
                  ListTile(
                    title: Text(
                      'Facility A',
                      style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    subtitle: Text(
                      'Location',
                      style: TextStyle(
                        fontSize: 14.0,
                        color: Colors.grey,
                      ),
                    ),
                    leading: CircleAvatar(
                      radius: 20.0,
                      backgroundColor:
                          Colors.blue, // Color of the circle avatar
                      child: Icon(
                        Icons.local_hospital, // Icon inside the circle avatar
                        color: Colors.white, // Color of the icon
                        size: 20.0, // Size of the icon
                      ),
                    ),
                    trailing: Icon(
                      Icons.arrow_circle_right, // Trailing icon
                      color: Colors.blue, // Color of the trailing icon
                      size: 30.0, // Size of the trailing icon
                    ),
                    onTap: () {
                      // Handle tap on the ListTile
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
