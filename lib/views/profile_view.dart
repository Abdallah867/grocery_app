import 'package:flutter/material.dart';
import 'package:grocery_app/constants.dart';
import 'package:grocery_app/custom_app_bar.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar('Profile'),
      body: ListView(
        children: const [
          MenuWidget(icon: Icons.shopping_bag_outlined, name: 'Orders'),
          MenuWidget(icon: Icons.location_pin, name: 'Delivery Address'),
          MenuWidget(icon: Icons.credit_card_outlined, name: 'Payment Methods'),
          MenuWidget(icon: Icons.discount_outlined, name: 'Promo Cord'),
          MenuWidget(
              icon: Icons.notifications_none_outlined, name: 'Notifications'),
          MenuWidget(icon: Icons.help_outline, name: 'Help'),
          MenuWidget(icon: Icons.info_outline, name: 'About '),
        ],
      ),
    );
  }
}

class MenuWidget extends StatelessWidget {
  final IconData icon;
  final String name;
  const MenuWidget({
    super.key,
    required this.icon,
    required this.name,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      shape: const Border.symmetric(
          horizontal: BorderSide(color: Color(0xFFE2E2E2))),
      leading: Icon(
        icon,
        color: Colors.black,
      ),
      title: Text(name),
      trailing: const Icon(Icons.arrow_forward_ios),
      minVerticalPadding: 20.0,
    );
  }
}
