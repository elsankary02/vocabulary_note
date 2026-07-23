import 'package:flutter/material.dart';

import '../../../../../core/components/default_text_form_feild.dart';

class TextFormFieldWidget extends StatelessWidget {
  final TextEditingController textController;
  final String lable, validatorOne, validatorTwo;
  const TextFormFieldWidget({
    super.key,
    required this.textController,
    required this.lable,
    required this.validatorOne,
    required this.validatorTwo,
  });

  @override
  Widget build(BuildContext context) {
    return DefaultTextFormField(
      labelText: lable,
      controller: textController,
      validator: (value) {
        if (value == null || value.trim().isEmpty) {
          return validatorOne;
        }

        if (value.trim().length < 2) {
          return validatorTwo;
        }

        return null;
      },
    );
  }
}
