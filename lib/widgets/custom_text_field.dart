import 'package:flutter/material.dart';
import 'package:grocery_app/widgets/custom_text.dart';

class CustomTextFormField extends StatelessWidget {
  final String text;
  final Function(String)? onChanged;
  const CustomTextFormField({
    super.key,
    required this.text,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomText(
          text: text,
          theme: Theme.of(context).textTheme.titleSmall,
        ),
        TextFormField(
          validator: (value) {
            if (value?.isEmpty ?? true) {
              return "Field required";
            } else {
              return null;
            }
          },
          onChanged: onChanged,
          decoration: const InputDecoration(
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(
                color: Color.fromRGBO(226, 226, 226, 0.988),
              ),
            ),
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(
                color: Color(0xFFC4C4C4),
                width: 1.5,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
