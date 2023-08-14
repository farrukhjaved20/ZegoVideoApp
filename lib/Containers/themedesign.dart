import 'package:flutter/material.dart';

class ItemDashboard extends StatelessWidget {
  final String title;
  final IconData iconData;
  final Color background;
  final Function() ontap;
  const ItemDashboard(
      {super.key,
      required this.title,
      required this.iconData,
      required this.background,
      required this.ontap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ontap,
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                  offset: const Offset(0, 7),
                  color: Colors.indigo.withOpacity(.2),
                  spreadRadius: 2,
                  blurRadius: 5)
            ]),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: background,
                  shape: BoxShape.circle,
                ),
                child: Icon(iconData, color: Colors.white)),
            const SizedBox(height: 10),
            Text(
              title.toUpperCase(),
            )
          ],
        ),
      ),
    );
  }
}
