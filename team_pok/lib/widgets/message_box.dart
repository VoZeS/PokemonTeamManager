import 'package:flutter/material.dart';

class MessageBox extends StatefulWidget {
  const MessageBox({super.key, required this.onSendMessage});
  final void Function(String message) onSendMessage;

  @override
  State<MessageBox> createState() => _MessageBoxState();
}

class _MessageBoxState extends State<MessageBox> {
  final TextEditingController controller = TextEditingController();

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 10,
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Row(
          children: [
            Expanded(
                child: TextField(
              controller: controller,
              onSubmitted: (msg) {
                if (msg.isNotEmpty) {
                  widget.onSendMessage(msg);
                  controller.clear();
                }
              },
            )),
            IconButton(
              icon: const Icon(Icons.send),
              onPressed: (() {
                if (controller.text.isNotEmpty) {
                  widget.onSendMessage(controller.text);
                  controller.clear();
                }
              }),
            )
          ],
        ),
      ),
    );
  }
}
