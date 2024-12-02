import 'dart:async';

import 'package:flutter/material.dart';


class ProfileAvatar extends StatelessWidget {
  final String? imageUrl;
  final double radius;
  final String placeholderAsset;

  const ProfileAvatar({
    Key? key,
    this.imageUrl,
    this.radius = 50.0,
    this.placeholderAsset = 'assets/images/profile.png',
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: radius,
      backgroundColor: Colors.grey[200], // Optional: Adds a subtle background color during loading
      child: imageUrl != null && imageUrl!.isNotEmpty
          ? FutureBuilder(
              future: _loadImage(imageUrl!),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  if (snapshot.hasError) {
                    return _buildPlaceholder();
                  } else {
                    return CircleAvatar(
                      radius: radius,
                      backgroundImage: NetworkImage(imageUrl!),
                    );
                  }
                } else {
                  return const CircularProgressIndicator(); // Show loading indicator
                }
              },
            )
          : _buildPlaceholder(),
    );
  }

  Widget _buildPlaceholder() {
    return CircleAvatar(
      radius: radius,
      backgroundImage: AssetImage(placeholderAsset),
    );
  }

  Future<void> _loadImage(String url) {
    Completer<void> completer = Completer<void>();

    // Resolve the image and complete the completer when done
    NetworkImage(url).resolve(const ImageConfiguration()).addListener(
      ImageStreamListener(
        (ImageInfo image, bool synchronousCall) {
          completer.complete(); // Mark the future as complete when the image loads
        },
        onError: (dynamic error, StackTrace? stackTrace) {
          completer.completeError(error); // Mark the future as failed if there's an error
        },
      ),
    );

    return completer.future; // Return the Future that completes when the image has loaded
  }
}



// import 'package:flutter/material.dart';

// class ProfileAvatar extends StatelessWidget {
//   final String? imageUrl;
//   final double radius;
//   final String placeholderAsset;

//   const ProfileAvatar({
//     Key? key,
//     this.imageUrl,
//     this.radius = 50.0,
//     this.placeholderAsset = 'assets/images/profile.png',
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Stack(
//       children: [
//         // Fallback placeholder CircleAvatar
//         CircleAvatar(
//           radius: radius,
//           backgroundImage: AssetImage(placeholderAsset),
//         ),
        
//         // Positioned fill will take the space of CircleAvatar
//         Positioned.fill(
//           child: ClipOval(
//             child: imageUrl != null && imageUrl!.isNotEmpty
//                 ? Image.network(
//                     imageUrl!,
//                     fit: BoxFit.cover,
//                     loadingBuilder: (BuildContext context, Widget child, ImageChunkEvent? loadingProgress) {
//                       if (loadingProgress == null) {
//                         return child; // Image loaded successfully
//                       } else {
//                         // Show loading indicator while the image is being fetched
//                         return Center(
//                           child: CircularProgressIndicator(
//                             value: loadingProgress.expectedTotalBytes != null
//                                 ? loadingProgress.cumulativeBytesLoaded /
//                                     (loadingProgress.expectedTotalBytes ?? 1)
//                                 : null,
//                           ),
//                         );
//                       }
//                     },
//                     errorBuilder: (context, error, stackTrace) {
//                       // Show placeholder on error
//                       return Image.asset(
//                         placeholderAsset,
//                         fit: BoxFit.cover,
//                       );
//                     },
//                   )
//                 : Image.asset(
//                     placeholderAsset,
//                     fit: BoxFit.cover,
//                   ),
//           ),
//         ),
//       ],
//     );
//   }
// }
