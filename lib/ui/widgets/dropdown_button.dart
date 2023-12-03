import 'package:flutter/material.dart';

class DropDownButton extends StatefulWidget {
  const DropDownButton({
    required this.controller,
    required this.controllerParametro1,
    required this.controllerParametro2,
    required this.list,
    super.key,
  });

  final List<String> list;
  final TextEditingController controller;
  final TextEditingController controllerParametro1;
  final TextEditingController controllerParametro2;

  @override
  State<DropDownButton> createState() => _DropDownButtonState();
}

class _DropDownButtonState extends State<DropDownButton> {
  @override
  Widget build(BuildContext context) {
    String dropdownValue = widget.list.first;

    return DropdownMenu<String>(
      controller: widget.controller,
      textStyle: Theme.of(context).textTheme.bodySmall,
      width: 300,
      initialSelection: dropdownValue,
      onSelected: (String? value) {
        // This is called when the user selects an item.
        setState(
          () {
            dropdownValue = value!;
            // Annullo gli altri 2 controller in modo da aver 1 solo parametro di selezione
            widget.controllerParametro1.text = '';
            widget.controllerParametro2.text = '';
          },
        );
      },
      dropdownMenuEntries: widget.list.map<DropdownMenuEntry<String>>(
        (String value) {
          return DropdownMenuEntry<String>(
            style: ButtonStyle(
              textStyle: MaterialStatePropertyAll(
                Theme.of(context).textTheme.bodySmall!.copyWith(fontSize: 15),
              ),
            ),
            value: value,
            label: value,
          );
        },
      ).toList(),
    );
  }
}
