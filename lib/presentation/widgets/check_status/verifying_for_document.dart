import 'package:flutter/material.dart';

// ignore: must_be_immutable
class VerifyingDocument extends StatefulWidget {
  String result = '';

  VerifyingDocument({super.key});

  @override
  String toStringShort() {
    return "Verifying Document: $result";
  }

  @override
  State<VerifyingDocument> createState() => _VerifyingDocumentState();
}

class _VerifyingDocumentState extends State<VerifyingDocument> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Center(
        child: Column(
          children: [
            const Text(
              'The system will check if you are the only tenant of the house.',
              style: TextStyle(fontSize: 12, color: Colors.grey),
            ),
            const Padding(padding: EdgeInsets.all(10)),
            Ink(
              decoration: const ShapeDecoration(
                  shape: CircleBorder(), color: Colors.blue),
              child: IconButton(
                icon: const Icon(Icons.attach_file),
                onPressed: () {
                  setState(() {
                    widget.result = 'path file';
                  });
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
