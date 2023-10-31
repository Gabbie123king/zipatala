import 'package:flutter/material.dart';

class Archive extends StatefulWidget {
  const Archive({Key? key}) : super(key: key);

  @override
  State<Archive> createState() => _ArchiveState();
}

class _ArchiveState extends State<Archive> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text('Facility Archive', style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600),),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: <Widget>[

            ],
          ),
        ),
      ),
    );
  }
}
