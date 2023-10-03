import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:move_home_assignment/business_logic/bloc/filtered_search/filtered_search_bloc.dart';

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
        Text(DateFormat('yyyy-MM-dd').format(selectedDates.start)),
        Text(DateFormat('yyyy-MM-dd').format(selectedDates.end)),
        ElevatedButton(
          onPressed: () async {
            final DateTimeRange? dateTimeRange = await showDateRangePicker(
                context: context,
                firstDate: DateTime(2000),
                lastDate: DateTime(3000));
            if (dateTimeRange != null) {
              BlocProvider.of<FilteredSearchBloc>(context)
                  .add(LoadFilteredSearchDateRange(
                from: DateFormat('yyyy-MM-dd').format(selectedDates.start),
                to: DateFormat('yyyy-MM-dd').format(selectedDates.end),
              ));
            }
          },
          child: const Text('Date'),
        )
      ]),
    );
  }
}
