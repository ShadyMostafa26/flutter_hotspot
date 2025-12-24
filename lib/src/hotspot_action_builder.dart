import 'package:flutter/material.dart';

import 'hotspot_provider.dart';

class HotspotActionBuilder extends StatelessWidget {
  /// Used on all hotspots, builds the buttons and item indicator.
  HotspotActionBuilder(
    this.controller, {
    this.doneText = "Done",
    this.nextText = "Next",
    this.previousText = "Previous",
    this.endText = "End tour",
  });

  final CalloutActionController controller;

  final String doneText;
  final String nextText;
  final String previousText;
  final String endText;

  final _duration = const Duration(milliseconds: 250);
  final _curve = Curves.easeOutCirc;

  @override
  Widget build(BuildContext context) {
    final fg = controller.foregroundColor ?? Colors.white;

    return Padding(
      padding: EdgeInsets.only(bottom: 16) +
          EdgeInsets.symmetric(
            horizontal: 16,
          ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          /// Page indicators
          Row(
            children: [
              for (var i = 0; i < controller.pages; i++)
                AnimatedContainer(
                  margin: EdgeInsets.symmetric(horizontal: 4),
                  duration: _duration,
                  curve: _curve,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                    color: controller.index == i ? fg : fg.withOpacity(0.3),
                  ),
                  height: 6,
                  width: controller.index == i ? 24 : 6,
                ),
            ],
          ),

          /// Circular next/done button
          Material(
            color: Colors.white,
            shape: CircleBorder(),
            child: InkWell(
              onTap: () {
                controller.next();
              },
              customBorder: CircleBorder(),
              child: Container(
                width: 56,
                height: 56,
                alignment: Alignment.center,
                child: Image.asset(
                  'assets/images/forward.png',
                  color: Colors.red,
                  height: 20,
                  width: 20,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
