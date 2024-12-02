import 'package:flutter/material.dart';
import 'package:jaat_app/core/res/utils/app_colors.dart';

class OrderRow extends StatelessWidget {
  final String heading;
  final String details;
  final Color? textColor;
   const OrderRow({
    super.key,
    required this.heading,
    required this.details,
     this.textColor,
    });

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.symmetric(vertical:10, horizontal: 0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width*0.4,
            child: Text(
              heading,
              style: const TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 14,
                color: AppColors.textHeadingColor,
              ),
            ),
          ),
          const SizedBox(
            // width: 10,
          ),
           SizedBox(
            width: MediaQuery.of(context).size.width*0.4,
             child: Text(
              details,
              style:  TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 16,
                // color: (textColor == null || textColor?.isEmpty == true) ? AppColors.black : textColor,
                color: textColor?? AppColors.black,

              ),
                       ),
           ),
           const SizedBox(
            width: 30,
          ),
        ],
      ),
    );
  }
}
