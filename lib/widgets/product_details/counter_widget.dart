import 'package:flutter/material.dart';

class CounterWidget extends StatelessWidget {
  const CounterWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Icon(
          Icons.remove,
          size: 30,
          color: Color(0xFFB3B3B3),
        ),
        const SizedBox(width: 14),
        Container(
          height: 45,
          width: 45,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(17),
            border: Border.all(
              color: const Color(0xFFE2E2E2),
            ),
          ),
          child: const Center(child: Text("1")),
        ),
        const SizedBox(width: 14),
        const Icon(
          Icons.add,
          size: 30,
          color: Color(0xFFB3B3B3),
        ),
      ],
    );
  }
}
