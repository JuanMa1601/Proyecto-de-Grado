import 'package:flutter/material.dart';

class CustomBottomNavBar extends StatelessWidget {
  final Function(int) onItemSelected;
  final int currentIndex;

  const CustomBottomNavBar({
    Key? key,
    required this.onItemSelected,
    this.currentIndex = 0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white70.withOpacity(0.8), // Color de fondo
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          IconButton(
            icon: Icon(Icons.home),
            color: Colors.black,
            onPressed: () => onItemSelected(0),
          ),
          IconButton(
            icon: Icon(Icons.image),
            color: Colors.black,
            onPressed: () => onItemSelected(1),
          ),
          IconButton(
            icon: Icon(Icons.list),
            color: Colors.black,
            onPressed: () => onItemSelected(2),
          ),
          IconButton(
            icon: Icon(Icons.phone),
            color: Colors.black,
            onPressed: () => onItemSelected(3),
          ),
          IconButton(
            icon: Icon(Icons.person),
            color: Colors.black,
            onPressed: () => onItemSelected(4),
          ),
        ],
      ),
    );
  }
}

