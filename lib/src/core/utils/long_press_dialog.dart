import 'package:flutter/material.dart';

void showLongPressDialogButton(
  BuildContext context, {
  required List<LongPressDialogButton> buttons,
}) {
  showDialog(
    context: context,
    builder: (context) => _LongPressDialog(buttons),
  );
}

class _LongPressDialog extends StatelessWidget {
  final List<LongPressDialogButton> buttons;

  const _LongPressDialog(this.buttons, {super.key});

  @override
  Widget build(BuildContext context) {
    return Theme.of(context).useMaterial3
        ? CustomDialog(buttons: buttons)
        : Theme(
            data: ThemeData(
              colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
              useMaterial3: true,
            ),
            child: CustomDialog(buttons: buttons),
          );
  }
}

class CustomDialog extends StatelessWidget {
  const CustomDialog({
    super.key,
    required this.buttons,
  });

  final List<LongPressDialogButton> buttons;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      contentPadding: const EdgeInsets.symmetric(
        horizontal: 0,
        vertical: 5,
      ),
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10), // <-- Radius
      ),
      content: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Column(children: buttons),
          // LongPressDialogButton(
          //   button: Button(
          //     name: "Cancel",
          //     onPressed: () {
          //       if (ScaffoldMessenger.of(context).mounted) {
          //         ScaffoldMessenger.of(context).clearSnackBars();
          //       }
          //       Navigator.pop(context);
          //     },
          //   ),
          // ),
        ],
      ),
    );
  }
}

class LongPressDialogButton extends StatelessWidget {
  final Button button;

  const LongPressDialogButton({super.key, required this.button});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      margin: const EdgeInsets.symmetric(
        vertical: 10,
        horizontal: 15,
      ),
      width: double.infinity,
      child: ElevatedButton(
        onPressed: button.onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          elevation: 0,
        ),
        child: Text(
          button.name,
          style: const TextStyle(
            color: Colors.black,
            fontSize: 15,
          ),
        ),
      ),
    );
  }
}

class Button {
  const Button({
    required this.name,
    this.onPressed,
  });

  final String name;
  final void Function()? onPressed;
}
