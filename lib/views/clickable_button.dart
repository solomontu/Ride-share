import 'package:flutter/material.dart';

class ClickableContainer extends StatelessWidget {
  const ClickableContainer(
      {Key? key,
      this.padding = EdgeInsets.zero,
      this.borderRadius = BorderRadius.zero,
      this.alignment,
      this.onPressed,
      this.child,
      this.onLongPress,
      this.backgroundColor,
      this.hoverColor = Colors.transparent,
      this.splashColor = Colors.transparent,
      this.focusColor = Colors.transparent,
      this.width,
      this.borderColor,
      this.borderWidth,
      this.height,
      this.onTapDown,
      this.isDisabled = false})
      : super(key: key);

  final EdgeInsets? padding;
  final VoidCallback? onPressed;
  final VoidCallback? onLongPress;
  final Function(TapDownDetails)? onTapDown;
  final Widget? child;
  final BorderRadius borderRadius;
  final Color? backgroundColor;
  final Color? hoverColor;
  final Color? splashColor;
  final Color? focusColor;
  final double? width;
  final Color? borderColor;
  final double? borderWidth;
  final double? height;
  final AlignmentGeometry? alignment;
  final bool isDisabled;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Ink(
        color: Colors.transparent,
        child: InkWell(
          onTap: isDisabled ? null : onPressed,
          onLongPress: () => onLongPress,
          onTapDown: onTapDown,
          hoverColor: hoverColor,
          splashColor: splashColor,
          focusColor: focusColor,
          child: Container(
            padding: padding,
            width: width,
            height: height,
            alignment: alignment,
            decoration: BoxDecoration(
              borderRadius: borderRadius,
              color: isDisabled
                  ? backgroundColor!.withOpacity(0.2)
                  : backgroundColor ?? Colors.transparent,
              border: Border.all(
                color: borderColor ?? Colors.transparent,
                width: borderWidth ?? 1,
              ),
            ),
            child: child,
          ),
        ),
      ),
    );
  }
}
