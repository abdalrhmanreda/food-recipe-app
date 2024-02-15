import 'package:flutter/material.dart';

import '../common/container_with_text_from_feild.dart';

class TitleAndTextFormFeild extends StatelessWidget {
  const TitleAndTextFormFeild({
    super.key,
    required this.nameController,
    required this.hint,
  });

  final TextEditingController nameController;
  final String hint;

  @override
  Widget build(BuildContext context) {
    return ContainerTextFormFeild(
      isPass: false,
      controller: nameController,
      hint: hint,
      keyboardType: TextInputType.emailAddress,
    );
  }
}
