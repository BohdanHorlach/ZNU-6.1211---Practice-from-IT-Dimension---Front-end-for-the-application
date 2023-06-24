import 'package:flutter/material.dart';

// ignore: must_be_immutable
class Voting extends StatefulWidget {
  String result = '';
  Voting({super.key});

  @override
  String toStringShort() {
    return "Voiting: $result";
  }

  @override
  State<Voting> createState() => _VotingState();
}

class _VotingState extends State<Voting> {
  final listRequiredCntrl = [TextEditingController(), TextEditingController()];
  final listValidateRquired = [false, false];
  List<TextEditingController> listOfPossibleCntrl = [];
  List<bool> listValidatePossible = [];
  double heightList = 0;
  double heightWidget = 70;
  double maxHeightList = 140;
  double freeSpaceFromPossibleField = 120;

  void setResult() {
    widget.result = '';
    for (int i = 0; i < listRequiredCntrl.length; i++) {
      widget.result += "${listRequiredCntrl[i].text}|";
    }
    for (int i = 0; i < listOfPossibleCntrl.length; i++) {
      widget.result += "${listOfPossibleCntrl[i].text}|";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(vertical: 10),
          child: Text(
            'Add those who voted for you',
            style: TextStyle(fontSize: 12, color: Colors.grey),
          ),
        ),
        ListView.builder(
          shrinkWrap: true,
          itemCount: listRequiredCntrl.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: TextField(
                controller: listRequiredCntrl[index],
                decoration: InputDecoration(
                  border: const OutlineInputBorder(),
                  labelText: 'Email ${index + 1}',
                  errorText: listValidateRquired[index]
                      ? 'Email ${index + 1} is Empty'
                      : null,
                ),
                onChanged: (value) {
                  setResult();
                  setState(() {
                    listValidateRquired[index] =
                        listRequiredCntrl[index].text == '';
                  });
                },
              ),
            );
          },
        ),
        SizedBox(
          height: listOfPossibleCntrl.length <= 1 ? heightList : maxHeightList,
          child: ListView.builder(
            shrinkWrap: true,
            itemCount: listOfPossibleCntrl.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Row(
                  children: [
                    Ink(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: IconButton(
                        onPressed: () {
                          setState(() {
                            heightList -= heightWidget;
                            listOfPossibleCntrl.removeAt(index);
                            listValidatePossible.removeAt(index);
                          });
                        },
                        icon: const Icon(Icons.close),
                      ),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width -
                          freeSpaceFromPossibleField,
                      child: TextField(
                        controller: listOfPossibleCntrl[index],
                        decoration: InputDecoration(
                          border: const OutlineInputBorder(),
                          labelText: 'Email ${index + 3}',
                          errorText: listValidatePossible[index]
                              ? 'Email ${index + 3} is Empty'
                              : null,
                        ),
                        onChanged: (value) {
                          setResult();
                          setState(() {
                            listValidatePossible[index] =
                                listOfPossibleCntrl[index].text == '';
                          });
                        },
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
        Ink(
          padding: const EdgeInsets.symmetric(vertical: 10),
          decoration:
              const ShapeDecoration(shape: CircleBorder(), color: Colors.blue),
          child: IconButton(
            icon: const Icon(
              Icons.add,
              color: Colors.white,
            ),
            onPressed: () {
              setState(() {
                heightList += heightWidget;
                listOfPossibleCntrl.add(TextEditingController());
                listValidatePossible.add(false);
              });
            },
          ),
        )
      ],
    );
  }
}
