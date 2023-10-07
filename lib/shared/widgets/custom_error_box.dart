import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:move_home_assignment/bloc/articles/articles_bloc.dart';
import 'package:move_home_assignment/shared/constants/custom_error_msg_constants.dart';

class CustomErrorBox extends StatelessWidget {
  final String errorMessage;
  final String? statusCode;

  const CustomErrorBox({
    super.key,
    required this.errorMessage,
    required this.statusCode,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CustomErrorMsg(
          errorMsg: errorMessage,
          statusCode: statusCode,
        ),
        ElevatedButton(
          style: ButtonStyle(
            padding: MaterialStateProperty.all(const EdgeInsets.all(10)),
          ),
          onPressed: () {
            context.read<ArticlesBloc>().add(const LoadArticlesWithFilters());
          },
          child: const Text(
            'Retry',
            style: TextStyle(fontSize: 26),
          ),
        ),
      ],
    );
  }
}

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
            customMessage ?? errorMsg,
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
