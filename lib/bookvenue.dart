import 'package:flutter/material.dart';

class BookVenue extends StatefulWidget {
  const BookVenue({super.key});

  @override
  State<BookVenue> createState() => _BookVenueState();
}

class _BookVenueState extends State<BookVenue> {
  DateTime? _dateTime = DateTime.now();
  TimeOfDay? _timeOfDay = TimeOfDay.now();
  int? _venueNumber;

  //function to show date picker
  void _showDateTimePicker(int venueNumber) async {
  final selectedDate = await showDatePicker(
    context: context,
    initialDate: DateTime.now(),
    firstDate: DateTime(2024),
    lastDate: DateTime(2030),
  );

  if (selectedDate == null) return; // the user didn't select a date

  final selectedTime = await showTimePicker(
    context: context,
    initialTime: TimeOfDay.now(),
  );

  if (selectedTime == null) return; // the user didn't select a time

  setState(() {
    _dateTime = DateTime(
      selectedDate.year,
      selectedDate.month,
      selectedDate.day,
      selectedTime.hour,
      selectedTime.minute,
    );
    _venueNumber = venueNumber;
  });

  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: Text('Venue booked'),
        content: Text('Venue $venueNumber has been booked for $_dateTime'),
        actions: <Widget>[
          TextButton(
            child: Text('OK'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}
  
  //function to build venue button
  Widget buildVenueButton(int venueNumber) {
    return Column(
      children: [
        ElevatedButton(
          onPressed: () {
            _showDateTimePicker(venueNumber);
          },
          child: Text('Venue $venueNumber'),
        ),
      ],
    );
  }

  
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Book Venue'),
      ),

      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              buildVenueButton(1),
              buildVenueButton(2),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              buildVenueButton(3),
              buildVenueButton(4),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              buildVenueButton(5),
              buildVenueButton(6),
            ],
          ),
          SizedBox(height: 20),
        ],
      ),
    );
  }
}
