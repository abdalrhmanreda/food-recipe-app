import 'package:flutter/material.dart';

class LanguageRadio extends StatelessWidget {
  const LanguageRadio({
    super.key,
    required this.language,
    required this.value,
  });
  final String language;
  final String value;

  @override
  Widget build(BuildContext context) {
    return RadioListTile(
      title: Text(language),
      value: value,
      onChanged: (value) {},
      groupValue: '',
    );
  }
}
