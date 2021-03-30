part of '../helper.dart';

/// `TextInputTransparent` digunakan untuk membuat Custom TextField
class TextInputTransparent extends StatelessWidget {
  final String hint;
  final TextInputType keyboard;
  final TextInputAction inputAction;
  final Function(String) onSubmit, onChanged;
  final bool autofocus, enabled, obsecure;
  final FocusNode node;
  final TextEditingController controller;
  final TextAlign textAlign;
  final int length, maxLines;
  final List<TextInputFormatter> formatters;

  TextInputTransparent(
      {this.hint,
      this.keyboard,
      this.inputAction,
      this.onSubmit,
      this.obsecure: false,
      this.onChanged,
      this.autofocus: false,
      this.node,
      this.controller,
      this.textAlign,
      this.enabled: true,
      this.length: 255,
      this.formatters: const [],
      this.maxLines});

  @override
  Widget build(BuildContext context) => TextField(
        style: Config.font,
        keyboardType: keyboard,
        textInputAction: inputAction,
        onSubmitted: onSubmit,
        onChanged: onChanged,
        autofocus: autofocus,
        focusNode: node,
        obscureText: obsecure,
        enabled: enabled,
        textAlign: textAlign ?? TextAlign.start,
        controller: controller,
        maxLines: maxLines == null ? 1 : maxLines,
        minLines: 1,
        inputFormatters: [LengthLimitingTextInputFormatter(length)]..addAll(formatters),
        decoration: InputDecoration(
          hintText: hint,
          hintStyle: Config.font.copyWith(color: Colors.black26, fontSize: 15),
          border: InputBorder.none,
          focusedBorder: InputBorder.none,
          enabledBorder: InputBorder.none,
          errorBorder: InputBorder.none,
          disabledBorder: InputBorder.none,
        ),
      );
}
