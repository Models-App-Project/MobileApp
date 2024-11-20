import 'package:flutter/material.dart';
import 'package:flutter_application_1/common/constant/app_colors.dart';
import 'package:flutter_application_1/common/constant/app_text_styles.dart';

class CustomDescriptionField extends StatefulWidget {
  const CustomDescriptionField({
    super.key,
    this.focusNode,
    required this.controller,
    required this.hasError,
  });

  final FocusNode? focusNode;
  final TextEditingController controller; // Agora recebe o controller.
  final bool hasError; // Parâmetro para indicar erro.

  @override
  State<CustomDescriptionField> createState() => _CustomDescriptionFieldState();
}

class _CustomDescriptionFieldState extends State<CustomDescriptionField> {
  late int _characterCount;

  @override
  void initState() {
    super.initState();
    _characterCount = widget.controller.text.length; // Inicializa o contador.

    // Adiciona um listener ao controller para atualizar o contador em tempo real.
    widget.controller.addListener(() {
      setState(() {
        _characterCount = widget.controller.text.length;
      });
    });
  }

  @override
  void dispose() {
    // Remove o listener ao descartar o widget.
    widget.controller.removeListener(() {});
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Description',
          style: AppTextStyles.formsText,
        ),
        const SizedBox(height: 8),
        TextFormField(
          style: AppTextStyles.formshintText,
          controller: widget.controller,
          focusNode: widget.focusNode,
          maxLines: 8,
          maxLength: 200, // Limita a 200 caracteres.
          decoration: InputDecoration(
            hintText:
                'Talk a little about you and why do you want to work here',
            hintStyle:
                AppTextStyles.formshintText.copyWith(color: AppColors.hintText),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color:
                    widget.hasError ? Colors.redAccent : AppColors.borderInput,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color:
                    widget.hasError ? Colors.redAccent : AppColors.focusedInput,
              ),
            ),
            errorBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.redAccent),
            ),
            counterText: '$_characterCount/200', // Atualiza o contador.
            counterStyle: AppTextStyles.smallText.copyWith(
              color: widget.hasError ? Colors.redAccent : AppColors.hintText,
            ),
          ),
        ),
      ],
    );
  }
}
