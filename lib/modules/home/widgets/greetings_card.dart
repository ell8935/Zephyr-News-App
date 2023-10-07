import 'package:intl/intl.dart';
import 'package:flutter/material.dart';

class GreetingsCard extends StatelessWidget {
  const GreetingsCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final today = DateFormat('EEEE').format(DateTime.now());

    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 16),
      child: SizedBox(
        height: MediaQuery.of(context).size.height * 0.15,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "$today's Top Stories",
              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w900,
                color: Colors.black,
              ),
            ),
            const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "HERE'S THE DEAL",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w900,
                    color: Colors.black,
                  ),
                ),
                Divider(
                  color: Colors.black,
                  thickness: 2,
                  height: 0,
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
