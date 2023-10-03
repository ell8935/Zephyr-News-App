import 'package:flutter/material.dart';

class RangeDatePicker extends StatefulWidget {
  const RangeDatePicker({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _RangeDatePickerState createState() => _RangeDatePickerState();
}

class _RangeDatePickerState extends State<RangeDatePicker> {
  DateTimeRange selectedDates =
      DateTimeRange(start: DateTime.now(), end: DateTime.now());
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Text("${selectedDates.duration.inDays}"),
        ElevatedButton(
          onPressed: () async {
            final DateTimeRange? dateTimeRange = await showDateRangePicker(
                context: context,
                firstDate: DateTime(2000),
                lastDate: DateTime(3000));
            if (dateTimeRange != null) {
              setState(() {
                selectedDates = dateTimeRange;
              });
            }
          },
          child: const Text('asdasd'),
        )
      ]),
    );
  }
}
