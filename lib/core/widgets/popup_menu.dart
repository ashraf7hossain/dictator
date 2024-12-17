import 'package:flutter/material.dart';
import 'package:flutter_overlay_window/flutter_overlay_window.dart';

class PopupMenu extends StatelessWidget {
  const PopupMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
        icon: const Icon(Icons.more_vert),
        itemBuilder: (context) => [
              PopupMenuItem(
                  value: 1,
                  child: TextButton(
                      onPressed: () async {
                        final status =
                            await FlutterOverlayWindow.isPermissionGranted();
                        if (!status) {
                          await FlutterOverlayWindow.requestPermission();
                        }
                      },
                      child: const Text("Start Overlay"))),
              PopupMenuItem(
                value: 2,
                child: TextButton(
                    onPressed: () async {
                      if (await FlutterOverlayWindow.isActive()) return;
                      await FlutterOverlayWindow.showOverlay(
                        enableDrag: true,
                        overlayTitle: "DICTATOR",
                        overlayContent: 'Overlay Enabled',
                        flag: OverlayFlag.defaultFlag,
                        visibility: NotificationVisibility.visibilityPublic,
                        positionGravity: PositionGravity.auto,
                        height:
                            (MediaQuery.of(context).size.height * 0.6).toInt(),
                        width: WindowSize.matchParent,
                        startPosition: const OverlayPosition(0, -259),
                      );
                    },
                    child: const Text("Floating")),
              ),
              PopupMenuItem(
                  value: 3,
                  child: TextButton(
                      onPressed: () {}, child: const Text("Floating"))),
            ]);
  }
}
