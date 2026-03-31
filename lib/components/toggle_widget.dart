import 'package:flutter/material.dart';

class ToggleWidget extends StatefulWidget {
  const ToggleWidget({super.key});

  @override
  State<ToggleWidget> createState() => _ToggleWidgetState();
}

class _ToggleWidgetState extends State<ToggleWidget> {
  bool isIced = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: Colors.grey[300],
        borderRadius: BorderRadius.circular(100),
      ),
      child: Row(children: [

         _buildToggleSelection('Hot', isIced),
         _buildToggleSelection('Iced', !isIced),

        ],
      ),
    );
  }

  Widget _buildToggleSelection(label, bool isSelected) {
    return GestureDetector(
      onTap: () {
        setState(() {
          isIced = !isIced;
        });
      },
      child: AnimatedContainer(
        curve: Curves.easeIn,
        padding: EdgeInsets.symmetric(horizontal: 20, ),
        alignment: Alignment.center,
        duration: Duration(milliseconds: 400),
        decoration: BoxDecoration(
          color: isSelected ? Colors.white : Colors.grey[300],
          borderRadius: BorderRadius.circular(100),
        ),
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Text(label),
        ),
      ),
    );
  }
}
