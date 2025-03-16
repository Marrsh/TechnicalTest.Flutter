import 'package:flutter/material.dart';

class ListCard extends StatelessWidget {
  final VoidCallback onTap;
  final String title;
  final String body;

  const ListCard(
      {super.key,
      required this.onTap,
      required this.title,
      required this.body});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.only(left: 10, right: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            Text(body),
            const SizedBox(height: 10),
            const Divider(
              thickness: 1,
              color: Colors.grey,
            )
          ],
        ),
      ),
    );
  }
}
