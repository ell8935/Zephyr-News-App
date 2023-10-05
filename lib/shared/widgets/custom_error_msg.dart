import 'package:flutter/material.dart';

class CustomErrorMsg extends StatelessWidget {
  final String errorMsg;

  const CustomErrorMsg({
    super.key,
    required this.errorMsg,
  });

  @override
  Widget build(BuildContext context) {
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
            errorMsg,
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
