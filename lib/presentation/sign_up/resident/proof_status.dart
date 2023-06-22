import 'package:flutter/material.dart';
import 'dart:developer';
import '../../widgets/main_name_page.dart';
import '../../widgets/check_status/verifying_for_document.dart';

class ProofStatus extends StatefulWidget {
  const ProofStatus({super.key});

  @override
  State<ProofStatus> createState() => _ProofStatusState();
}

class _ProofStatusState extends State<ProofStatus> {
  final verifyingDocument = VerifyingDocument();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: ListView(
          shrinkWrap: true,
          children: [
            const MainNamePageSignUp(text: 'Proof your status'),
            const Padding(padding: EdgeInsets.only(top: 20), child: Divider()),
            verifyingDocument,
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 40),
              child: ElevatedButton(
                  child: const Text('Save'),
                  onPressed: () {
                    log(verifyingDocument.toStringShort());
                  }),
            ),
            const Padding(
                padding: EdgeInsets.only(top: 20, bottom: 10),
                child: Divider()),
            const Text(
              'If your apartment was previously registered in the system. But you cannot access the QR code.',
              style: TextStyle(fontSize: 12, color: Colors.grey),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
