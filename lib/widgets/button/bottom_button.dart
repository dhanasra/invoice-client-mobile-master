import 'package:components/components.dart';
import 'package:flutter/material.dart';

class BottomButton extends StatelessWidget {

  final Widget child;
  final VoidCallback onPressed;
  final String btnText;
  final bool loading;

  const BottomButton({
    Key? key,
    required this.child,
    required this.onPressed,
    this.loading = false,
    required this.btnText}):super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        child,
        Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: PrimaryButton(
                label: "save",
                height: 50,
                isLoading: loading,
                fontWeight: FontWeight.w600,
                fontSize: AppDimen.TEXT_MEDIUM_2,
                buttonColor: AppColors.BUTTON_COLOR,
                radius: sharp,
                onPressed: onPressed
            )
        )
      ],
    );
  }
}
