import 'package:flutter/material.dart';

class PrimaryButton extends StatelessWidget {
  final String text;
  final IconData iconData;
  final VoidCallback onPress;

  const PrimaryButton({
    super.key,
    required this.text,
    required this.iconData,
    required this.onPress,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
          fixedSize: const Size(double.maxFinite, 50),
          backgroundColor: const Color.fromARGB(255, 127, 202, 40)),
      onPressed: onPress,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(iconData),
          const SizedBox(width: 10),
          Text(
            text,
            style: const TextStyle(fontSize: 17, color: Colors.white),
          )
        ],
      ),
    );
  }
}
