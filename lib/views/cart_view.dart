import 'package:flutter/material.dart';
import 'package:grocery_app/constants.dart';
import 'package:grocery_app/widgets/custom_button.dart';
import 'package:grocery_app/widgets/product_details/counter_widget.dart';

class CartView extends StatelessWidget {
  const CartView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        scrolledUnderElevation: 0,
        centerTitle: true,
        title: const Text(
          "My Cart",
          style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w900),
        ),
      ),
      body: const CartListView(),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(
          left: 24.0,
          right: 24.0,
          bottom: 24,
          top: 8,
        ),
        child: CustomButton(text: "Go to Checkout", onPressed: () {}),
      ),
    );
  }
}

class CartItem extends StatelessWidget {
  const CartItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 15),
      child: Row(
        children: [
          Expanded(
            child: ListTile(
              contentPadding: const EdgeInsets.all(0),
              title: const Text('Bell Pepper Red'),
              subtitle: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '1kg, Price',
                    style: TextStyle(
                      fontSize: 14,
                      color: kGreyColor,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(
                    height: 12.0,
                  ),
                  CounterWidget(),
                ],
              ),
              leading: Image.asset("assets/images/banana.png"),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.close,
                  color: Color(0xFFB3B3B3),
                ),
              ),
              const SizedBox(
                height: 43,
              ),
              const Text(
                "4,99\$",
                style: TextStyle(fontSize: 16.0),
              ),
              const SizedBox(
                height: 20,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class CartListView extends StatelessWidget {
  const CartListView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      separatorBuilder: (context, int) => const Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: Divider(),
      ),
      itemBuilder: (context, index) => const CartItem(),
      itemCount: 4,
    );
  }
}
