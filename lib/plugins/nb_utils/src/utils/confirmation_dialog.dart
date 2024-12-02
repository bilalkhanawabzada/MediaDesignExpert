// ignore_for_file: constant_identifier_names

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '/plugins/nb_utils/nb_utils.dart';

enum DialogType { CONFIRMATION, ACCEPT, DELETE, UPDATE, ADD, RETRY, fullscreen }

enum DialogAnimation {
  DEFAULT,
  ROTATE,
  SLIDE_TOP_BOTTOM,
  SLIDE_BOTTOM_TOP,
  SLIDE_LEFT_RIGHT,
  SLIDE_RIGHT_LEFT,
  SCALE
}

Color getDialogPrimaryColor(
  BuildContext context,
  DialogType dialogType,
  Color? primaryColor,
) {
  if (primaryColor != null) return primaryColor;
  
  switch (dialogType) {
    case DialogType.DELETE:
      return Colors.red;
    case DialogType.UPDATE:
      return Colors.amber;
    case DialogType.CONFIRMATION:
    case DialogType.ADD:
    case DialogType.RETRY:
      return Colors.blue;
    case DialogType.ACCEPT:
      return Colors.green;
    default:
      return Colors.blue; // Default color
  }
}

String getPositiveText(DialogType dialogType) {
  switch (dialogType) {
    case DialogType.CONFIRMATION:
      return "Yes";
    case DialogType.DELETE:
      return "Delete";
    case DialogType.UPDATE:
      return "Update";
    case DialogType.ADD:
      return "Add";
    case DialogType.ACCEPT:
      return "Accept";
    case DialogType.RETRY:
      return "Retry";
    default:
      return "OK"; // Default positive text
  }
}

String getTitle(DialogType dialogType) {
  switch (dialogType) {
    case DialogType.CONFIRMATION:
      return "Are you sure you want to perform this action?";
    case DialogType.DELETE:
      return "Do you want to delete?";
    case DialogType.UPDATE:
      return "Do you want to update?";
    case DialogType.ADD:
      return "Do you want to add?";
    case DialogType.ACCEPT:
      return "Do you want to accept?";
    case DialogType.RETRY:
      return "Click to retry";
    case DialogType.fullscreen:
      return "Fullscreen Dialog"; // Placeholder title for fullscreen
    default:
      return "Confirmation"; // Default title
  }
}

Widget getIcon(DialogType dialogType, {double? size}) {
  IconData iconData;
  
  switch (dialogType) {
    case DialogType.CONFIRMATION:
    case DialogType.RETRY:
    case DialogType.ACCEPT:
      iconData = Icons.done;
      break;
    case DialogType.DELETE:
      iconData = Icons.delete_forever_outlined;
      break;
    case DialogType.UPDATE:
      iconData = Icons.edit;
      break;
    case DialogType.ADD:
      iconData = Icons.add;
      break;
    case DialogType.fullscreen:
      iconData = Icons.fullscreen; // Placeholder icon for fullscreen
      break;
    default:
      iconData = Icons.help; // Default icon
  }

  return Icon(iconData, size: size ?? 20, color: Colors.white);
}

Widget? getCenteredImage(
    BuildContext context, DialogType dialogType, Color? primaryColor) {
  Widget? widget;

  switch (dialogType) {
    case DialogType.CONFIRMATION:
      widget = Container(
        decoration: BoxDecoration(
          color: getDialogPrimaryColor(context, dialogType, primaryColor)
              .withOpacity(0.2),
          shape: BoxShape.circle,
        ),
        padding: const EdgeInsets.all(16),
        child: Icon(Icons.warning_amber_rounded,
            color: getDialogPrimaryColor(context, dialogType, primaryColor),
            size: 40),
      );
      break;
    case DialogType.DELETE:
      widget = Container(
        decoration: BoxDecoration(
            color: getDialogPrimaryColor(context, dialogType, primaryColor)
                .withOpacity(0.2),
            shape: BoxShape.circle),
        padding: const EdgeInsets.all(16),
        child: Icon(Icons.close,
            color: getDialogPrimaryColor(context, dialogType, primaryColor),
            size: 40),
      );
      break;
    case DialogType.UPDATE:
      widget = Container(
        decoration: BoxDecoration(
            color: getDialogPrimaryColor(context, dialogType, primaryColor)
                .withOpacity(0.2),
            shape: BoxShape.circle),
        padding: const EdgeInsets.all(16),
        child: Icon(Icons.edit_outlined,
            color: getDialogPrimaryColor(context, dialogType, primaryColor),
            size: 40),
      );
      break;
    case DialogType.ADD:
    case DialogType.ACCEPT:
      widget = Container(
        decoration: BoxDecoration(
          color: getDialogPrimaryColor(context, dialogType, primaryColor)
              .withOpacity(0.2),
          shape: BoxShape.circle,
        ),
        padding: const EdgeInsets.all(16),
        child: Icon(Icons.done_outline,
            color: getDialogPrimaryColor(context, dialogType, primaryColor),
            size: 40),
      );
      break;
    case DialogType.RETRY:
      widget = Container(
        decoration: BoxDecoration(
          color: getDialogPrimaryColor(context, dialogType, primaryColor)
              .withOpacity(0.2),
          shape: BoxShape.circle,
        ),
        padding: const EdgeInsets.all(16),
        child: Icon(Icons.refresh_rounded,
            color: getDialogPrimaryColor(context, dialogType, primaryColor),
            size: 40),
      );
      break;
    case DialogType.fullscreen:
      widget = null; // No default image for fullscreen dialog
      break;
  }
  return widget;
}

Widget defaultPlaceHolder(
  BuildContext context,
  DialogType dialogType,
  double? height,
  double? width,
  Color? primaryColor, {
  Widget? child,
  ShapeBorder? shape,
}) {
  return Container(
    height: height,
    width: width,
    decoration: BoxDecoration(
      color: getDialogPrimaryColor(context, dialogType, primaryColor)
          .withOpacity(0.2),
    ),
    alignment: Alignment.center,
    child: child ?? getCenteredImage(context, dialogType, primaryColor),
  );
}

Widget buildTitleWidget(
  BuildContext context,
  DialogType dialogType,
  Color? primaryColor,
  Widget? customCenterWidget,
  double height,
  double width,
  String? centerImage,
  ShapeBorder? shape,
) {
  if (customCenterWidget != null) {
    return Container(
      constraints: BoxConstraints(maxHeight: height, maxWidth: width),
      child: customCenterWidget,
    );
  } else {
    if (centerImage != null) {
      return Image.network(
        centerImage,
        height: height,
        width: width,
        fit: BoxFit.cover,
        errorBuilder: (_, object, stack) {
          if (kDebugMode) {
            print(object.toString());
          } // Log errors for debugging
          return defaultPlaceHolder(
              context, dialogType, height, width, primaryColor,
              shape: shape);
        },
        loadingBuilder: (_, child, loadingProgress) {
          if (loadingProgress == null) {
            return child;
          }
          return defaultPlaceHolder(
            context,
            dialogType,
            height,
            width,
            primaryColor,
            shape: shape,
            child: Center(
              child: CircularProgressIndicator(
                value: loadingProgress.expectedTotalBytes != null
                    ? loadingProgress.cumulativeBytesLoaded /
                        loadingProgress.expectedTotalBytes!
                    : null,
              ),
            ),
          );
        },
      );
    } else {
      return defaultPlaceHolder(
          context, dialogType, height, width, primaryColor,
          shape: shape);
    }
  }
}

/// Show confirm dialog box
Future<bool?> showConfirmDialogCustom(
  BuildContext context, {
  required Function(BuildContext) onAccept,
  String? title,
  String? subTitle,
  String? positiveText,
  String? negativeText,
  String? centerImage,
  Widget? customCenterWidget,
  Color? primaryColor,
  Color? positiveTextColor,
  Color? negativeTextColor,
  ShapeBorder? shape,
  Function(BuildContext)? onCancel,
  bool barrierDismissible = true,
  double? height,
  double? width,
  bool cancelable = true,
  Color? barrierColor,
  DialogType dialogType = DialogType.CONFIRMATION,
  DialogAnimation dialogAnimation = DialogAnimation.DEFAULT,
  Duration? transitionDuration,
  Curve curve = Curves.easeInBack,
}) async {
  hideKeyboard(context);

  return await showGeneralDialog(
    context: context,
    barrierColor: barrierColor ?? Colors.black54,
    pageBuilder: (context, animation, secondaryAnimation) {
      return Container();
    },
    barrierDismissible: barrierDismissible,
    barrierLabel: '',
    transitionDuration: transitionDuration ?? const Duration(milliseconds: 400),
    transitionBuilder: (_, animation, secondaryAnimation, child) {
      return dialogAnimatedWrapperWidget(
        animation: animation,
        dialogAnimation: dialogAnimation,
        curve: curve,
        child: AlertDialog(
          shape: shape ?? RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          titlePadding: EdgeInsets.zero,
          backgroundColor: Colors.white,
          elevation: 8.0,
          title: buildTitleWidget(
            _,
            dialogType,
            primaryColor,
            customCenterWidget,
            height ?? 200,
            width ?? 300,
            centerImage,
            shape,
          ).cornerRadiusWithClipRRectOnly(
              topLeft: 16, topRight: 16),
          content: SizedBox(
            width: width ?? 300,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  title ?? getTitle(dialogType),
                  style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  textAlign: TextAlign.center,
                ),
                if (subTitle?.isNotEmpty ?? false) const SizedBox(height: 8),
                Text(
                  subTitle ?? '',
                  style: const TextStyle(fontSize: 16),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 16),
                Row(
                  children: [
                    if (cancelable)
                      Expanded(
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            foregroundColor: Colors.black, 
                            backgroundColor: Colors.white,
                            side: const BorderSide(color: Colors.grey),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              const Icon(Icons.close, size: 20),
                              const SizedBox(width: 6),
                              Text(
                                negativeText ?? 'Cancel',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: negativeTextColor ?? Colors.black),
                              ),
                            ],
                          ),
                          onPressed: () {
                            if (cancelable) Navigator.of(_).pop(false);
                            onCancel?.call(_);
                          },
                        ),
                      ),
                    if (cancelable) const SizedBox(width: 16),
                    Expanded(
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: getDialogPrimaryColor(_, dialogType, primaryColor),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            getIcon(dialogType),
                            const SizedBox(width: 6),
                            Text(
                              positiveText ?? getPositiveText(dialogType),
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: positiveTextColor ?? Colors.white),
                            ),
                          ],
                        ),
                        onPressed: () {
                          onAccept.call(_);
                          if (cancelable) Navigator.of(_).pop(true);
                        },
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      );
    },
  );
}


// // ignore_for_file: constant_identifier_names

// import 'package:flutter/material.dart';

// import '/plugins/nb_utils/nb_utils.dart';

// enum DialogType { CONFIRMATION, ACCEPT, DELETE, UPDATE, ADD, RETRY, fullscreen }

// enum DialogAnimation {
//   DEFAULT,
//   ROTATE,
//   SLIDE_TOP_BOTTOM,
//   SLIDE_BOTTOM_TOP,
//   SLIDE_LEFT_RIGHT,
//   SLIDE_RIGHT_LEFT,
//   SCALE
// }

// Color getDialogPrimaryColor(
//   BuildContext context,
//   DialogType dialogType,
//   Color? primaryColor,
// ) {
//   if (primaryColor != null) return primaryColor;
//   Color color;

//   switch (dialogType) {
//     case DialogType.DELETE:
//       color = Colors.red;
//       break;
//     case DialogType.UPDATE:
//       color = Colors.amber;
//       break;
//     case DialogType.CONFIRMATION:
//     case DialogType.ADD:
//     case DialogType.RETRY:
//       color = Colors.blue;
//       break;
//     case DialogType.ACCEPT:
//       color = Colors.green;
//       break;
//   }
//   return color;
// }

// String getPositiveText(DialogType dialogType) {
//   String positiveText = "";

//   switch (dialogType) {
//     case DialogType.CONFIRMATION:
//       positiveText = "Yes";
//       break;
//     case DialogType.DELETE:
//       positiveText = "Delete";
//       break;
//     case DialogType.UPDATE:
//       positiveText = "Update";
//       break;
//     case DialogType.ADD:
//       positiveText = "Add";
//       break;
//     case DialogType.ACCEPT:
//       positiveText = "Accept";
//       break;
//     case DialogType.RETRY:
//       positiveText = "Retry";
//       break;
//   }
//   return positiveText;
// }

// String getTitle(DialogType dialogType) {
//   String titleText = "";

//   switch (dialogType) {
//     case DialogType.CONFIRMATION:
//       titleText = "Are you sure want to perform this action?";
//       break;
//     case DialogType.DELETE:
//       titleText = "Do you want to delete?";
//       break;
//     case DialogType.UPDATE:
//       titleText = "Do you want to update?";
//       break;
//     case DialogType.ADD:
//       titleText = "Do you want to add?";
//       break;
//     case DialogType.ACCEPT:
//       titleText = "Do you want to accept?";
//       break;
//     case DialogType.RETRY:
//       titleText = "Click to retry";
//       break;
//     case DialogType.fullscreen:
//       // TODO: Handle this case.
//       break;
//   }
//   return titleText;
// }

// Widget getIcon(DialogType dialogType, {double? size}) {
//   Icon icon;

//   switch (dialogType) {
//     case DialogType.CONFIRMATION:
//     case DialogType.RETRY:
//     case DialogType.ACCEPT:
//       icon = Icon(Icons.done, size: size ?? 20, color: Colors.white);
//       break;
//     case DialogType.DELETE:
//       icon = Icon(Icons.delete_forever_outlined,
//           size: size ?? 20, color: Colors.white);
//       break;
//     case DialogType.UPDATE:
//       icon = Icon(Icons.edit, size: size ?? 20, color: Colors.white);
//       break;
//     case DialogType.ADD:
//       icon = Icon(Icons.add, size: size ?? 20, color: Colors.white);
//       break;
//     case DialogType.fullscreen:
//       // TODO: Handle this case.
//       break;
//   }
//   return icon;
// }

// Widget? getCenteredImage(
//     BuildContext context, DialogType dialogType, Color? primaryColor) {
//   Widget? widget;

//   switch (dialogType) {
//     case DialogType.CONFIRMATION:
//       widget = Container(
//         decoration: BoxDecoration(
//           color: getDialogPrimaryColor(context, dialogType, primaryColor)
//               .withOpacity(0.2),
//           shape: BoxShape.circle,
//         ),
//         padding: const EdgeInsets.all(16),
//         child: Icon(Icons.warning_amber_rounded,
//             color: getDialogPrimaryColor(context, dialogType, primaryColor),
//             size: 40),
//       );
//       break;
//     case DialogType.DELETE:
//       widget = Container(
//         decoration: BoxDecoration(
//             color: getDialogPrimaryColor(context, dialogType, primaryColor)
//                 .withOpacity(0.2),
//             shape: BoxShape.circle),
//         padding: const EdgeInsets.all(16),
//         child: Icon(Icons.close,
//             color: getDialogPrimaryColor(context, dialogType, primaryColor),
//             size: 40),
//       );
//       break;
//     case DialogType.UPDATE:
//       widget = Container(
//         decoration: BoxDecoration(
//             color: getDialogPrimaryColor(context, dialogType, primaryColor)
//                 .withOpacity(0.2),
//             shape: BoxShape.circle),
//         padding: const EdgeInsets.all(16),
//         child: Icon(Icons.edit_outlined,
//             color: getDialogPrimaryColor(context, dialogType, primaryColor),
//             size: 40),
//       );
//       break;
//     case DialogType.ADD:
//     case DialogType.ACCEPT:
//       widget = Container(
//         decoration: BoxDecoration(
//           color: getDialogPrimaryColor(context, dialogType, primaryColor)
//               .withOpacity(0.2),
//           shape: BoxShape.circle,
//         ),
//         padding: const EdgeInsets.all(16),
//         child: Icon(Icons.done_outline,
//             color: getDialogPrimaryColor(context, dialogType, primaryColor),
//             size: 40),
//       );
//       break;
//     case DialogType.RETRY:
//       widget = Container(
//         decoration: BoxDecoration(
//           color: getDialogPrimaryColor(context, dialogType, primaryColor)
//               .withOpacity(0.2),
//           shape: BoxShape.circle,
//         ),
//         padding: const EdgeInsets.all(16),
//         child: Icon(Icons.refresh_rounded,
//             color: getDialogPrimaryColor(context, dialogType, primaryColor),
//             size: 40),
//       );
//       break;
//   }
//   return widget;
// }

// Widget defaultPlaceHolder(
//   BuildContext context,
//   DialogType dialogType,
//   double? height,
//   double? width,
//   Color? primaryColor, {
//   Widget? child,
//   ShapeBorder? shape,
// }) {
//   return Container(
//     height: height,
//     width: width,
//     decoration: BoxDecoration(
//       color: getDialogPrimaryColor(context, dialogType, primaryColor)
//           .withOpacity(0.2),
//     ),
//     alignment: Alignment.center,
//     child: child ?? getCenteredImage(context, dialogType, primaryColor),
//   );
// }

// Widget buildTitleWidget(
//   BuildContext context,
//   DialogType dialogType,
//   Color? primaryColor,
//   Widget? customCenterWidget,
//   double height,
//   double width,
//   String? centerImage,
//   ShapeBorder? shape,
// ) {
//   if (customCenterWidget != null) {
//     return Container(
//       constraints: BoxConstraints(maxHeight: height, maxWidth: width),
//       child: customCenterWidget,
//     );
//   } else {
//     if (centerImage != null) {
//       return Image.network(
//         centerImage,
//         height: height,
//         width: width,
//         fit: BoxFit.cover,
//         errorBuilder: (_, object, stack) {
//           log(object.toString());
//           return defaultPlaceHolder(
//               context, dialogType, height, width, primaryColor,
//               shape: shape);
//         },
//         loadingBuilder: (_, child, loadingProgress) {
//           if (loadingProgress == null) {
//             return child;
//           }
//           return defaultPlaceHolder(
//             context,
//             dialogType,
//             height,
//             width,
//             primaryColor,
//             shape: shape,
//             child: Loader(
//               value: loadingProgress.expectedTotalBytes != null
//                   ? loadingProgress.cumulativeBytesLoaded /
//                       loadingProgress.expectedTotalBytes!
//                   : null,
//             ),
//           );
//         },
//       );
//     } else {
//       return defaultPlaceHolder(
//           context, dialogType, height, width, primaryColor,
//           shape: shape);
//     }
//   }
// }

// /// show confirm dialog box
// Future<bool?> showConfirmDialogCustom(
//   BuildContext context, {
//   required Function(BuildContext) onAccept,
//   String? title,
//   String? subTitle,
//   String? positiveText,
//   String? negativeText,
//   String? centerImage,
//   Widget? customCenterWidget,
//   Color? primaryColor,
//   Color? positiveTextColor,
//   Color? negativeTextColor,
//   ShapeBorder? shape,
//   Function(BuildContext)? onCancel,
//   bool barrierDismissible = true,
//   double? height,
//   double? width,
//   bool cancelable = true,
//   Color? barrierColor,
//   DialogType dialogType = DialogType.CONFIRMATION,
//   DialogAnimation dialogAnimation = DialogAnimation.DEFAULT,
//   Duration? transitionDuration,
//   Curve curve = Curves.easeInBack,
// }) async {
//   hideKeyboard(context);

//   return await showGeneralDialog(
//     context: context,
//     barrierColor: barrierColor ?? Colors.black54,
//     pageBuilder: (context, animation, secondaryAnimation) {
//       return Container();
//     },
//     barrierDismissible: barrierDismissible,
//     barrierLabel: '',
//     transitionDuration: transitionDuration ?? 400.milliseconds,
//     transitionBuilder: (_, animation, secondaryAnimation, child) {
//       return dialogAnimatedWrapperWidget(
//         animation: animation,
//         dialogAnimation: dialogAnimation,
//         curve: curve,
//         child: AlertDialog(
//           shape: shape ?? dialogShape(),
//           titlePadding: EdgeInsets.zero,
//           backgroundColor: _.cardColor,
//           elevation: defaultElevation.toDouble(),
//           title: buildTitleWidget(
//             _,
//             dialogType,
//             primaryColor,
//             customCenterWidget,
//             height ?? customDialogHeight,
//             width ?? customDialogWidth,
//             centerImage,
//             shape,
//           ).cornerRadiusWithClipRRectOnly(
//               topLeft: defaultRadius.toInt(), topRight: defaultRadius.toInt()),
//           content: SizedBox(
//             width: width ?? customDialogWidth,
//             // color: _.cardColor,
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.center,
//               mainAxisSize: MainAxisSize.min,
//               children: [
//                 Text(
//                   title ?? getTitle(dialogType),
//                   style: boldTextStyle(size: 16),
//                   textAlign: TextAlign.center,
//                 ),
//                 8.height.visible(subTitle.validate().isNotEmpty),
//                 Text(
//                   subTitle.validate(),
//                   style: secondaryTextStyle(size: 16),
//                   textAlign: TextAlign.center,
//                 ).visible(subTitle.validate().isNotEmpty),
//                 16.height,
//                 Row(
//                   children: [
//                     if (cancelable)
//                       AppButton(
//                         elevation: 0,
//                         shapeBorder: RoundedRectangleBorder(
//                           borderRadius: radius(defaultAppButtonRadius),
//                           side: const BorderSide(color: viewLineColor),
//                         ),
//                         color: _.scaffoldBackgroundColor,
//                         child: Row(
//                           mainAxisSize: MainAxisSize.min,
//                           children: [
//                             const Icon(
//                               Icons.close,
//                               /*color: textPrimaryColorGlobal,*/
//                               size: 20,
//                             ),
//                             6.width,
//                             Text(
//                               negativeText ?? 'Cancel',
//                               style: boldTextStyle(
//                                   color:
//                                       negativeTextColor /* ?? textPrimaryColorGlobal*/),
//                             ),
//                           ],
//                         ).fit(),
//                         onTap: () {
//                           if (cancelable) finish(_, false);

//                           onCancel?.call(_);
//                         },
//                       ).expand(),
//                     if (cancelable) 16.width,
//                     AppButton(
//                       elevation: 0,
//                       color: getDialogPrimaryColor(_, dialogType, primaryColor),
//                       child: Row(
//                         mainAxisSize: MainAxisSize.min,
//                         children: [
//                           getIcon(dialogType),
//                           6.width,
//                           Text(
//                             positiveText ?? getPositiveText(dialogType),
//                             style: boldTextStyle(
//                                 color: positiveTextColor ?? Colors.white),
//                           ),
//                         ],
//                       ).fit(),
//                       onTap: () {
//                         onAccept.call(_);

//                         if (cancelable) finish(_, true);
//                       },
//                     ).expand(),
//                   ],
//                 ),
//               ],
//             ),
//           ),
//         ),
//       );
//     },
//   );
// }
