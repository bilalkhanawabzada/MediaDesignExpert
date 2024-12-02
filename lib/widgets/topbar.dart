import 'package:flutter/material.dart';

class TopBarWidget extends StatelessWidget {
  final String imageUrl="null";
  final String placeholder;

  const TopBarWidget({super.key, 
    // required this.imageUrl,
    this.placeholder = 'assets/placeholder.png',
  });

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Flexible(
            flex: 2,
            child: TextField(
              decoration: InputDecoration(
               filled: true,
               fillColor: const Color.fromARGB(255, 255, 255, 255),
                // enabledBorder: InputBorder.none,
                hintText: 'Saint Petersburg',
               border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(1.0), // Set border radius here
                borderSide: const BorderSide(color: Color.fromARGB(255, 255, 255, 255)),
              ),
               focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15.0), // Set border radius here
                borderSide: const BorderSide(color: Color.fromARGB(255, 239, 240, 239)), // Set border color for focused state
              ),
               
                prefixIcon: const Icon(Icons.location_on,),
              ),
            ),
          ),
          const Flexible(
            flex: 1,
            child: SizedBox(width: 30)
            ), // Add some spacing between the search bar and the avatar
          Flexible(
            flex: 2,
            child: CircleAvatar(
              radius: 25,
              // backgroundColor: Colors.grey[200],
              backgroundImage: const AssetImage("assets/images/profile.jpg"),
              onBackgroundImageError: (_, __) {
                // Error handling: Fallback to placeholder image
                Image.asset("assets/images/profile.jpg",
            width: 200, // Adjust as needed
            height: 200, // Adjust as needed
            fit: BoxFit.cover, // Adjust as needed
          );
              },
              child: imageUrl.isEmpty
                  ? Image.asset(placeholder)
                  : null,
            ),
          ),
        ],
      ),
    );
  }
}