import 'package:flutter/material.dart';
import 'package:move_home_assignment/shared/constants/custom_error_msg_constants.dart';

class CustomErrorMsg extends StatelessWidget {
  final String errorMsg;
  final String? statusCode;

  const CustomErrorMsg({
    Key? key,
    required this.errorMsg,
    required this.statusCode,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final customMessage = customErrorMessages[statusCode];

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset('assets/images/WentWrong.png'),
          const Text(
            'Oops!\nSomething went wrong',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.blue,
              fontSize: 22,
            ),
          ),
          const SizedBox(
            height: 25,
          ),
          Text(
            customMessage ??
                errorMsg, // Use the custom message if available, else display the error code.
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: Colors.blueGrey,
              fontSize: 20,
            ),
          ),
          Text(
            'Status Code: $statusCode',
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: Colors.blueGrey,
              fontSize: 20,
            ),
          ),
        ],
      ),
    );
  }
}
