
import 'package:flutter/material.dart';
import 'package:signals_flutter/signals_flutter.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';


final class Messages {

  static void showError(String message, BuildContext context) {
    showTopSnackBar(Overlay.of(context), 
    CustomSnackBar.error(message: message),
    );
  }
  static void showInfo(String message, BuildContext context) {
    showTopSnackBar(Overlay.of(context), 
    CustomSnackBar.info(message: message),
    );
  }
  static void showSuccess(String message, BuildContext context) {
    showTopSnackBar(Overlay.of(context), 
    CustomSnackBar.success(message: message),
    );
  }

}

mixin MessageStateMixin{
  final Signal<String?> _errorMessage = signal(null);
  Signal<String?> get errorMessage => _errorMessage;

  final Signal<String?> _infoMessage = signal(null);
  Signal<String?> get infoMessage => _infoMessage;

  final Signal<String?> _successMessage = signal(null);
  Signal<String?> get successMessage => _successMessage;

  void clearError() {
    _errorMessage.value = null;
  }
  void clearInfo() {
    _infoMessage.value = null;
  }
  void clearSuccess() {
    _successMessage.value = null;
  } 

  void showError(String message) {
     untracked(() => clearError());
    _errorMessage.value = message;
  }
  void showInfo(String message) {
     untracked(() => clearInfo());
    _infoMessage.value = message;
  }
  void showSuccess(String message) {
      untracked(() => clearSuccess());
    _successMessage.value = message;
  }

  void clearMessages() {
    untracked(() => clearError());
    untracked(() => clearInfo());
    untracked(() => clearSuccess());
  }

}


mixin MessagesViewMixin<T extends StatefulWidget> on State<T> {
  void messagesListener(MessageStateMixin state) {
   
    effect(() {
      final errorMessage = state.errorMessage.value;
      if (errorMessage != null) {
        Messages.showError(errorMessage, context);
      }
    });

    effect(() {
      final infoMessage = state.infoMessage.value;
      if (infoMessage != null) {
        Messages.showInfo(infoMessage, context);
       
      }
    });

    effect(() {
      final successMessage = state.successMessage.value;
      if (successMessage != null) {
        Messages.showSuccess(successMessage, context);
        
        
      }
    });
  }
}
