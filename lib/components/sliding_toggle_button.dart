import 'package:flutter/material.dart';

class SlidingToggleButton extends StatefulWidget {
  @override
  _SlidingToggleButtonState createState() => _SlidingToggleButtonState();
}

class _SlidingToggleButtonState extends State<SlidingToggleButton> {
  bool _isToggled = false;

  void _toggle() {
    setState(() {
      _isToggled = !_isToggled;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _toggle,
      child: AnimatedContainer(
        duration: Duration(milliseconds: 300),
        width: 40,
        height: 24,
        padding: EdgeInsets.symmetric(horizontal: 4),
        decoration: BoxDecoration(
          color: _isToggled ? Colors.green : Colors.grey[300],
          borderRadius: BorderRadius.circular(20),
        ),
        child: Stack(
          children: [
            AnimatedAlign(
              duration: Duration(milliseconds: 300),
              alignment: _isToggled
                  ? Alignment.centerRight
                  : Alignment.centerLeft,
              child: Container(
                width: 20,
                height: 20,
                decoration: BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
