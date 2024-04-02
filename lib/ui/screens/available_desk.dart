import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class AvailableDesk extends StatefulWidget {
  const AvailableDesk({super.key});

  @override
  State<AvailableDesk> createState() => _AvailableDeskState();
}

class _AvailableDeskState extends State<AvailableDesk> {
  List<dynamic> availableDesk = [];

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  Future<void> _loadData() async {
    String url =
        'https://demo0413095.mockable.io/digitalflake/api/get_slots?date=2023-05-01';
    try {
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        var jsonResponse = jsonDecode(response.body);

        List<dynamic> slots = jsonResponse['availability'];

        setState(() {
          availableDesk =
              slots.map((slot) => slot['workspace_name'].toString()).toList();
        });
        print(availableDesk);
      } else {
        print('Request failed with status: ${response.statusCode}');
      }
    } catch (e) {
      print('Error: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Available Desk'),
          leading: Icon(Icons.arrow_back),
        ),
        body: Padding(
          padding: EdgeInsets.all(10.0),
          child: GridView.builder(
              padding: EdgeInsets.all(10.0),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 6,
                  mainAxisSpacing: 5,
                  crossAxisSpacing: 5,
                  childAspectRatio: 1),
              itemCount: availableDesk.length,
              itemBuilder: (BuildContext context, int index) {
                final deskNo = availableDesk[index];
                return Card(
                  child: GestureDetector(
                    onTap: null,
                    child: Center(
                      child: Text(deskNo),
                    ),
                  ),
                );
              }),
        ),
      ),
    );
  }
}
