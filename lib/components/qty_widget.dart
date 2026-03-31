import 'package:flutter/material.dart';

class QtyWidget extends StatefulWidget {
  const QtyWidget({super.key});

  @override
  State<QtyWidget> createState() => _QtyWidgetState();
}

class _QtyWidgetState extends State<QtyWidget> {
  int qty = 1;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(100)),

      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 4),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GestureDetector(
              onTap: () {
                setState(() {
                  if (qty > 1) {
                    qty--;
                  }
                });
              },

              child: Text(
                '-',
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.w400),
              ),
            ),
            Text(
              qty.toString(),
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.w400),
            ),
            GestureDetector(
              onTap: () {
                setState(() {
                  qty++;
                });
              },
              child: Text(
                '+',
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.w400),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
