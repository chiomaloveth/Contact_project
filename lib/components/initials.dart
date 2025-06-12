import 'package:flutter/material.dart';
import 'package:luffgiff_sidebar_menu/components/custom_text.dart';

class InitialsAvatar extends StatelessWidget {
  final String firstName;
  final String lastName;

  Color getColorFromInitials(String initials) {
    final hash = initials.codeUnits.fold(0, (prev, elem) => prev + elem);
    final colors = [
      Colors.purple,
      Colors.orange,
      Colors.teal,
      Colors.blue,
      Colors.green,
      Colors.red,
      Colors.brown,
      Colors.indigo,
    ];
    return colors[hash % colors.length];
  }

  const InitialsAvatar({
    super.key,
    required this.firstName,
    required this.lastName,
  });

  @override
  Widget build(BuildContext context) {
    String initials = '';
    if (firstName.isNotEmpty) initials += firstName[0].toUpperCase();
    if (lastName.isNotEmpty) initials += lastName[0].toUpperCase();

    return CircleAvatar(
      radius: 43,
      backgroundColor: getColorFromInitials(initials),
      child: CustomText(text: initials),
    );
  }
}
