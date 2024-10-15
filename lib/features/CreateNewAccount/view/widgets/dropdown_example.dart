import 'package:flutter/material.dart';
import 'package:dropdown_button2/dropdown_button2.dart';

class CustomDropdownButton extends StatefulWidget {
  final List<String> items;
  final String hintText;
  final Function(String) onChanged;

  const CustomDropdownButton({
    Key? key,
    required this.items,
    required this.hintText,
    required this.onChanged,
  }) : super(key: key);

  @override
  _CustomDropdownButtonState createState() => _CustomDropdownButtonState();
}

class _CustomDropdownButtonState extends State<CustomDropdownButton> {
  String? selectedValue;

  @override
  Widget build(BuildContext context) {
    return DropdownButtonHideUnderline(
      child: DropdownButton2(
        isExpanded: true,
        hint: Text(
          widget.hintText,
          style: TextStyle(
            fontSize: 16,
            color: Theme.of(context).hintColor,
          ),
        ),
        items: widget.items
            .map((item) => DropdownMenuItem<String>(
          value: item,
          child: Text(
            item,
            style: const TextStyle(
              fontSize: 14,
            ),
          ),
        ))
            .toList(),
        value: selectedValue,
        onChanged: (value) {
          setState(() {
            selectedValue = value as String?;
          });
          widget.onChanged(selectedValue!);
        },
        buttonStyleData: const ButtonStyleData(
          height: 50,
          padding: EdgeInsets.only(left: 16, right: 8),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(30)),
            border: Border(
              top: BorderSide(color: Colors.grey),
              bottom: BorderSide(color: Colors.grey),
              left: BorderSide(color: Colors.grey),
              right: BorderSide(color: Colors.grey),
            ),
          ),
        ),
        iconStyleData: const IconStyleData(
          icon: Icon(
            Icons.arrow_drop_down,
            color: Colors.grey,
          ),
        ),
        dropdownStyleData: DropdownStyleData(
          maxHeight: 200,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(14),
          ),
          offset: const Offset(0, 0),
          scrollbarTheme: ScrollbarThemeData(
            thickness: MaterialStateProperty.all(6),
            thumbVisibility: MaterialStateProperty.all(true),
          ),
        ),
        menuItemStyleData: const MenuItemStyleData(
          height: 48,
          padding: EdgeInsets.symmetric(horizontal: 16),
        ),
      ),
    );
  }
}

// import 'package:flutter/material.dart';
// import 'package:dropdown_button2/dropdown_button2.dart';
//
// class CustomDropdownButton extends StatefulWidget {
//   final List<String> items;
//   final String hintText;
//   final Function(String) onChanged;
//
//   const CustomDropdownButton({
//     Key? key,
//     required this.items,
//     required this.hintText,
//     required this.onChanged,
//   }) : super(key: key);
//
//   @override
//   _CustomDropdownButtonState createState() => _CustomDropdownButtonState();
// }
//
// class _CustomDropdownButtonState extends State<CustomDropdownButton> {
//   String? selectedValue;
//
//   @override
//   Widget build(BuildContext context) {
//     return DropdownButtonHideUnderline(
//       child: DropdownButton2(
//         isExpanded: true,
//         hint: Text(
//           widget.hintText,
//           style: TextStyle(
//             fontSize: 16,
//             color: Theme.of(context).hintColor,
//           ),
//         ),
//         items: widget.items
//             .map((item) => DropdownMenuItem<String>(
//           value: item,
//           child: Text(
//             item,
//             style: const TextStyle(
//               fontSize: 14,
//             ),
//           ),
//         ))
//             .toList(),
//         value: selectedValue,
//         onChanged: (value) {
//           setState(() {
//             selectedValue = value as String?;
//           });
//           widget.onChanged(selectedValue!);
//         },
//         buttonStyleData: ButtonStyleData(
//           height: 50,
//           padding: const EdgeInsets.symmetric(horizontal: 16),
//           decoration: BoxDecoration(
//             borderRadius: BorderRadius.circular(30),
//             border: Border.all(color: Colors.grey), // Change to your desired color
//           ),
//         ),
//         iconStyleData: const IconStyleData(
//           icon: Icon(
//             Icons.arrow_drop_down,
//             color: Colors.grey,
//           ),
//         ),
//         dropdownStyleData: DropdownStyleData(
//           maxHeight: 200,
//           decoration: BoxDecoration(
//             borderRadius: BorderRadius.circular(14),
//             border: Border.all(color: Colors.grey), // Change to your desired color
//           ),
//           scrollbarTheme: ScrollbarThemeData(
//             thickness: MaterialStateProperty.all(6),
//             thumbVisibility: MaterialStateProperty.all(true),
//           ),
//         ),
//         menuItemStyleData: const MenuItemStyleData(
//           height: 48,
//           padding: EdgeInsets.symmetric(horizontal: 16),
//         ),
//       ),
//     );
//   }
// }
