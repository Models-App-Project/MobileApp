import 'package:flutter/material.dart';
import 'package:flutter_application_1/common/constant/app_colors.dart';
import 'package:flutter_application_1/common/constant/app_text_styles.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    required this.campo,
    required this.hint,
    this.keyboardType = TextInputType.text,
    this.focusNode,
    this.nextFocusNode // Adiciona o FocusNode como parâmetro opcional
  });

  final TextInputType keyboardType;
  final String campo;
  final String hint;
  final FocusNode? focusNode;
  final FocusNode? nextFocusNode; // Declara o FocusNode como uma propriedade opcional

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          campo,
          style: AppTextStyles.formsText,
        ),
        const SizedBox(height: 8),
        SizedBox(
          height: 36,
          child: TextFormField(
            focusNode: focusNode, // Atribui o FocusNode ao TextFormField
            textAlignVertical: TextAlignVertical.center,
            decoration: InputDecoration(
              contentPadding:
                  const EdgeInsets.symmetric(vertical: 0, horizontal: 12),
              hintTextDirection: TextDirection.ltr,
              hintText: hint,
              hintStyle: AppColors.hintText,
              enabledBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: AppColors.borderInput),
              ),
              focusedBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: AppColors.focusedInput),
              ),
            ),
            cursorColor: AppColors.cursor,
            style: AppTextStyles.formshintText,
            keyboardType: keyboardType,
            onFieldSubmitted: (_) => {
              if (nextFocusNode != null) {
                FocusScope.of(context).requestFocus(nextFocusNode)
              } else {
                FocusScope.of(context).unfocus()
              }
            },
          ),
        ),
      ],
    );
  }
}
