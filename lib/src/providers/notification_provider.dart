import 'package:flutter/material.dart';

class NotificationProvider extends ChangeNotifier {
  OverlayEntry? _overlayEntry;

  void showNotification(BuildContext context, String message) {
    _overlayEntry = _createOverlayEntry(context, message);
    Overlay.of(context).insert(_overlayEntry!);
    notifyListeners();

    Future.delayed(const Duration(seconds: 3), () {
      _overlayEntry?.remove();
      _overlayEntry = null;
      notifyListeners();
    });
  }

  OverlayEntry _createOverlayEntry(BuildContext context, String message) {
    return OverlayEntry(
      builder: (context) => Positioned(
        top: 50,
        right: 20,
        child: Material(
          color: Colors.transparent,
          child: Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.7),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Icon(Icons.info, color: Colors.white),
                const SizedBox(width: 10),
                Text(message, style: const TextStyle(color: Colors.white)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
