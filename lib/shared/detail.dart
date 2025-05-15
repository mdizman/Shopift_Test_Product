
import 'package:flutter/material.dart';

class DetailWidget extends StatelessWidget {
  final IconData icon;
  final String data;

  const DetailWidget({
    super.key,
    required this.icon,
    required this.data,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, size: 20),
        const SizedBox(width: 6),
        Text(data),
      ],
    );
  }
}

