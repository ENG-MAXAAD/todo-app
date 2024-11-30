import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {
  final String hintText;
  final String? labelText;
  final IconData icon;
  final bool isPassword;
  final bool hasSuffixIcon;
  final TextEditingController controller;

  const CustomTextField({
    Key? key,
    required this.hintText,
    this.labelText,
    required this.icon,
    this.isPassword = false,
    this.hasSuffixIcon = false,
    required this.controller,
  }) : super(key: key);

  @override
  _CustomTextFieldState createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool _isObscure = true;
  bool _isFocused = false;

  final FocusNode _focusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _isObscure = widget.isPassword;
    _focusNode.addListener(() {
      setState(() {
        _isFocused = _focusNode.hasFocus;
      });
    });
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (widget.labelText != null)
          Padding(
            padding: const EdgeInsets.only(bottom: 4.0),
            child: Text(
              widget.labelText!,
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: Color(0xffA3A3A3),
              ),
            ),
          ),
        SizedBox(
          height: 5,
        ),
        TextField(
          controller: widget.controller,
          focusNode: _focusNode,
          obscureText: _isObscure,
          decoration: InputDecoration(
            hintText: widget.hintText,
            prefixIcon: Icon(widget.icon),
            suffixIcon: widget.isPassword && widget.hasSuffixIcon
                ? IconButton(
                    icon: Icon(
                        _isObscure ? Icons.visibility_off : Icons.visibility),
                    onPressed: () {
                      setState(() {
                        _isObscure = !_isObscure;
                      });
                    },
                  )
                : null,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide:
                  BorderSide(color: _isFocused ? Colors.blue : Colors.grey),
            ),
          ),
        ),
      ],
    );
  }
}
