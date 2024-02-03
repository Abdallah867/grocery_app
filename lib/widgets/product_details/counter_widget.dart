import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grocery_app/cubits/cart_cubit/cart_cubit.dart';
import 'package:grocery_app/cubits/counter_cubit/counter_cubit.dart';

class CounterWidget extends StatelessWidget {
  final int counter;
  const CounterWidget({
    super.key,
    this.counter = 1,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CartCubit(),
      child: BlocProvider(
        create: (context) => CounterCubit(),
        child: BlocBuilder<CounterCubit, CounterState>(
          builder: (context, state) {
            return Row(
              children: [
                IconButton(
                  onPressed: () {
                    BlocProvider.of<CounterCubit>(context).decrementCounter(
                        state is CounterUpdate ? state.count : counter);
                    // BlocProvider.of<CartCubit>(context).counter = state.;
                  },
                  icon: const Icon(
                    Icons.remove,
                    size: 30,
                    color: Color(0xFFB3B3B3),
                  ),
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
                  child: Center(
                      child: Text(
                          "${state is CounterUpdate ? state.count : counter}")),
                ),
                const SizedBox(width: 14),
                IconButton(
                  onPressed: () {
                    BlocProvider.of<CounterCubit>(context).incrementCounter(
                        state is CounterUpdate ? state.count : counter);
                  },
                  icon: const Icon(
                    Icons.add,
                    size: 30,
                    color: Color(0xFFB3B3B3),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
