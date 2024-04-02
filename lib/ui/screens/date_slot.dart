import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:horizontal_calendar/horizontal_calendar.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:http/http.dart' as http;

class DateSlot extends StatefulWidget {
  const DateSlot({super.key});

  @override
  State<DateSlot> createState() => _DateSlotState();
}

class _DateSlotState extends State<DateSlot> {
  late List<String> slotsData = [];

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

        List<dynamic> slots = jsonResponse['slots'];

        setState(() {
          slotsData =
              slots.map((slot) => slot['slot_name'].toString()).toList();
        });
        print(slotsData);
      } else {
        print('Request failed with status: ${response.statusCode}');
      }
    } catch (e) {
      print('Error: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    initializeDateFormatting('en');

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Select Date and Slot'),
          leading: Icon(Icons.arrow_back),
        ),
        body: Column(
          children: [
            HorizontalCalendar(
              date: DateTime.now(),
              textColor: Colors.black45,
              backgroundColor: Colors.white,
              selectedColor: Colors.blue,
              showMonth: true,
              onDateSelected: (date) {},
            ),
            SizedBox(
              height: 20.0,
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.all(10.0),
                child: GridView.builder(
                    padding: EdgeInsets.all(10.0),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing: 5,
                        crossAxisSpacing: 5,
                        childAspectRatio: 4),
                    itemCount: slotsData.length,
                    itemBuilder: (BuildContext context, int index) {
                      String time = slotsData[index];
                      return Card(
                        child: GestureDetector(
                          onTap: null,
                          child: Center(
                            child: Text(time),
                          ),
                        ),
                      );
                    }),
              ),
            )
          ],
        ),
      ),
    );
  }
}
