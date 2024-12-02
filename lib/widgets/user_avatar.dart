import 'package:flutter/material.dart';

class UserAvatar extends StatelessWidget {
  final String? imageUrl;
  final String firstName;
  final String lastName;

  const UserAvatar({super.key, required this.imageUrl, required this.firstName, required this.lastName});

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 40,
      backgroundColor: Colors.grey[300],
      child: imageUrl != null && imageUrl!.isNotEmpty
          ? ClipOval(
              child: Image.network(
                imageUrl!,
                fit: BoxFit.cover,
                width: 80,
                height: 80,
                errorBuilder: (context, error, stackTrace) {
                  // Show initials if there's an error loading the image
                  return _buildInitialsAvatar();
                },
                loadingBuilder: (BuildContext context, Widget child, ImageChunkEvent? loadingProgress) {
                  if (loadingProgress == null) {
                    return child;
                  } else {
                    return Center(
                      child: CircularProgressIndicator(
                        value: loadingProgress.expectedTotalBytes != null
                            ? loadingProgress.cumulativeBytesLoaded / (loadingProgress.expectedTotalBytes ?? 1)
                            : null,
                      ),
                    );
                  }
                },
              ),
            )
          : _buildInitialsAvatar(), // Show initials if imageUrl is null or empty
    );
  }

  // Function to build the CircleAvatar with initials
  Widget _buildInitialsAvatar() {
    String initials = '${firstName[0]}${lastName[0]}'.toUpperCase();
    return CircleAvatar(
      radius: 40,
      backgroundColor: Colors.blueAccent, // Change the background color as needed
      child: Text(
        initials,
        style: const TextStyle(
          fontSize: 24,
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ), // TextStyle
      ), // Text
    ); // CircleAvatar
  }
}
