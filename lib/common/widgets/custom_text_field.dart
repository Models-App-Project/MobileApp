import 'package:flutter/material.dart';
import 'package:flutter_application_1/common/constant/app_colors.dart';
import 'package:flutter_application_1/common/constant/app_text_styles.dart';

class CustomTextField extends StatefulWidget {
  const CustomTextField({
    super.key,
    required this.campo,
    required this.hint,
    this.keyboardType = TextInputType.text,
    this.focusNode,
    this.nextFocusNode,
    required this.controller,
    required this.hasError, // Parâmetro para erro
  });

  final TextInputType keyboardType;
  final String campo;
  final String hint;
  final FocusNode? focusNode;
  final FocusNode? nextFocusNode;
  final TextEditingController controller;
  final bool hasError; // Indica se o campo tem erro

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  late bool showError; // Para controlar a exibição do erro

  @override
  void initState() {
    super.initState();
    showError = widget.hasError;

    // Adiciona um listener para atualizar a borda ao ganhar/perder foco
    widget.focusNode?.addListener(() {
      if (widget.focusNode!.hasFocus) {
        setState(() {
          showError = false; // Remove o erro quando o campo é focado
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.campo,
          style: AppTextStyles.formsText,
        ),
        const SizedBox(height: 8),
        SizedBox(
          height: 36,
          child: TextFormField(
            style: AppTextStyles.formshintText,
            cursorColor: AppColors.hintText,
            focusNode: widget.focusNode,
            controller: widget.controller,
            textAlignVertical: TextAlignVertical.center,
            keyboardType: widget.keyboardType,
            onFieldSubmitted: (_) {
              // Move para o próximo campo, se houver
              widget.nextFocusNode?.requestFocus();
            },
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.symmetric(
                vertical: 0,
                horizontal: 12,
              ),
              hintText: widget.hint,
              hintStyle: AppTextStyles.formshintText.copyWith(color: AppColors.hintText),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(6),
                borderSide: const BorderSide(color: AppColors.borderInput),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(6),
                borderSide: const BorderSide(color: AppColors.borderInput),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(6),
                borderSide: const BorderSide(color: AppColors.focusedInput),
              ),
              errorBorder: showError
                  ? OutlineInputBorder(
                      borderRadius: BorderRadius.circular(6),
                      borderSide: const BorderSide(color: Colors.red),
                    )
                  : null,
            ),
          ),
        ),
      ],
    );
  }

  @override
  void dispose() {
    widget.focusNode?.removeListener(() {}); // Remove listener ao descartar
    super.dispose();
  }
}
