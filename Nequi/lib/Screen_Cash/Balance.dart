import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class BalanceCard extends StatelessWidget {
  final String title;
  final String amount;
  final Widget icon; 
  final double imageSize; 
  final Color color;
  final double height;
  final IconData? trailingIcon; 

  BalanceCard({
    required this.title,
    required this.amount,
    required this.icon,
    required this.imageSize,
    required this.color,
    required this.height,
    this.trailingIcon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      margin: EdgeInsets.symmetric(vertical: 5.0, horizontal: 18.0),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(8.0),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            spreadRadius: 2,
            blurRadius: 5,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        children: [
          SizedBox(width: 25),
          SizedBox(
            width: imageSize,
            height: imageSize,
            child: icon,
          ),
          SizedBox(width: 25),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 1), // Separar título y descripción
                Text(
                  amount,
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
          if (trailingIcon != null) 
            Padding(
              padding: const EdgeInsets.only(right: 5.0), 
              child: Icon(
                trailingIcon,
                size: 24,
                color: Colors.white,
              ),
            ),
          SizedBox(width: 16),
        ],
      ),
    );
  }
}

