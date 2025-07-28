import 'package:flutter/material.dart';

class InkwellWidget extends StatelessWidget {
  const InkwellWidget({super.key, this.onTap, this.child});
  final Function()? onTap;
  final Widget? child;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Colors.transparent,
      overlayColor: const WidgetStatePropertyAll(
        Colors.transparent,
      ),
      onTap: onTap,
      child: child,
    );
  }
}
