import 'package:flutter/material.dart';

import '/plugins/nb_utils/nb_utils.dart';

// SnapHelperWidget makes easy implementation for future or stream builder
class SnapHelperWidget<T> extends StatelessWidget {
  final dynamic initialData;
  final Future<T>? future;
  final Widget Function(T data) onSuccess;
  final Widget? loadingWidget;
  final Widget? errorWidget;
  final String? defaultErrorMessage;
  final bool useConnectionStateForLoader;

  const SnapHelperWidget({
    required this.future,
    required this.onSuccess,
    this.loadingWidget,
    this.errorWidget,
    this.initialData,
    this.defaultErrorMessage,
    this.useConnectionStateForLoader = false,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<T>(
      future: future,
      initialData: initialData,
      builder: (BuildContext context, AsyncSnapshot<T> snap) {
        if (!useConnectionStateForLoader) {
          if (snap.hasData) {
            if (snap.data != null) {
              return onSuccess(snap.data as T);
            } else {
              return snapWidgetHelper(
                snap,
                errorWidget: errorWidget,
                loadingWidget: loadingWidget,
                defaultErrorMessage: defaultErrorMessage,
              );
            }
          } else {
            return snapWidgetHelper(
              snap,
              errorWidget: errorWidget,
              loadingWidget: loadingWidget,
              defaultErrorMessage: defaultErrorMessage,
            );
          }
        } else {
          switch (snap.connectionState) {
            case ConnectionState.waiting:
            case ConnectionState.active:
              return loadingWidget ?? const Loader();
            case ConnectionState.done:
              if (snap.hasData) {
                if (snap.data != null) {
                  return onSuccess(snap.data as T);
                } else {
                  return snapWidgetHelper(
                    snap,
                    errorWidget: errorWidget,
                    loadingWidget: loadingWidget,
                    defaultErrorMessage: defaultErrorMessage,
                  );
                }
              } else {
                return errorWidget ??
                    Text(defaultErrorMessage ?? snap.error.toString(), style: primaryTextStyle())
                        .center();
              }
            default:
              return const SizedBox();
          }
        }
      },
    );
  }
}
