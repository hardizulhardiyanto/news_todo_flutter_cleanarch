import 'package:flutter/material.dart';
import 'package:todo_app/src/component/base_modal/hadling_error_message.dart';

class BaseModal {
  static Widget? showHandlingError(BuildContext context, {
    String? errorMessage,
    Function? onTapProps,
    String? tittleBtn
  }) {
    showModalBottomSheet<void>(
      backgroundColor: Colors.transparent,
      context: context,
      builder: (context) {
        return HandlingErrorWidget(
            errorMessage: errorMessage,
            onTapProps: onTapProps,
            tittleBtn: tittleBtn
        );
      },
      isScrollControlled: true,
      isDismissible: false,
    );
    return null;
  }
}