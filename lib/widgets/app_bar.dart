import 'package:flutter/material.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  const MyAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: const Color.fromARGB(255, 16, 2, 22), // Dark theme
      title:const Row(
        children: [
          // YouTube icon
          Icon(
            Icons.play_circle, // Use the play_circle icon
            color: Colors.red,  // YouTube's color theme is red
            size: 30, // Set the size of the icon
          ),
           SizedBox(width: 10), // Add spacing between the icon and title
           Text(
            'YouTube', // App name
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
        ],
      ),
      actions: [
        IconButton(
          icon: const Icon(Icons.search, color: Colors.white),
          onPressed: () {
            // Add search functionality here
          },
        ),
        IconButton(
          icon: const Icon(Icons.notifications, color: Colors.white),
          onPressed: () {
            // Add notification functionality here
          },
        ),
        IconButton(
          icon: const Icon(Icons.account_circle, color: Colors.white),
          onPressed: () {
            // Add profile functionality here
          },
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
