import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_1/common/constant/app_colors.dart';
import 'package:flutter_application_1/common/widgets/custom_forms_button.dart';
import 'package:flutter_application_1/common/widgets/custom_description_field.dart';
import 'package:flutter_application_1/common/widgets/custom_text_field.dart';

class FormsPage extends StatelessWidget {
  const FormsPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Criação de FocusNode para cada campo de texto
    final focusNodes = List<FocusNode>.generate(12, (_) => FocusNode());

    // Função para ativar o modo imersivo
    void enableImmersiveMode() {
      SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
    }

    // Função para esconder a barra de status quando o foco sai de um campo
    void addFocusListeners() {
      for (var focusNode in focusNodes) {
        focusNode.addListener(() {
          if (!focusNode.hasFocus) {
            enableImmersiveMode();
          }
        });
      }
    }

    // Inicializa os listeners para foco
    addFocusListeners();

    return Scaffold(
      backgroundColor: AppColors.white,
      body: Column(
        children: [
          const SizedBox(
            height: 20,
          ),
          Stack(
            children: [
              // A imagem que fica fixa na parte superior
              Image.asset('assets/images/logo_fernanda2.png'),
              // Botão de voltar posicionado acima da imagem
              Positioned(
                top: 10, // Ajuste conforme necessário para a posição vertical
                left:
                    10, // Ajuste conforme necessário para a posição horizontal
                child: IconButton(
                  icon: const Icon(Icons.arrow_back, color: Colors.black),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ),
            ],
          ),
          // O conteúdo rolável abaixo da imagem
          Expanded(
            child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              children: [
                const SizedBox(height: 20),
                CustomTextField(
                  campo: 'Name',
                  hint: 'Full Name',
                  focusNode: focusNodes[0],
                  nextFocusNode: focusNodes[1],
                ),
                const SizedBox(height: 16),
                CustomTextField(
                  campo: 'Age',
                  hint: 'Age',
                  focusNode: focusNodes[1],
                  keyboardType: TextInputType.number,
                  nextFocusNode: focusNodes[2],
                ),
                const SizedBox(height: 16),
                CustomDescriptionField(
                  focusNode: focusNodes[2],
                ),
                const SizedBox(height: 16),
                CustomTextField(
                  campo: 'Email',
                  hint: 'Email (example@gmail.com)',
                  focusNode: focusNodes[3],
                  nextFocusNode: focusNodes[4],
                ),
                const SizedBox(height: 16),
                CustomTextField(
                    campo: 'Height',
                    hint: 'Height (cm)',
                    focusNode: focusNodes[4],
                    keyboardType: TextInputType.number,
                    nextFocusNode: focusNodes[5]),
                const SizedBox(height: 16),
                CustomTextField(
                    campo: 'Weight',
                    hint: 'Weight (kg)',
                    focusNode: focusNodes[5],
                    keyboardType: TextInputType.number,
                    nextFocusNode: focusNodes[6]),
                const SizedBox(height: 16),
                CustomTextField(
                    campo: 'Eye’s Color',
                    hint: 'Eye’s Color',
                    focusNode: focusNodes[6],
                    nextFocusNode: focusNodes[7]),
                const SizedBox(height: 16),
                CustomTextField(
                    campo: 'Hair’s Color',
                    hint: 'Hair’s Color',
                    focusNode: focusNodes[7],
                    nextFocusNode: focusNodes[8]),
                const SizedBox(height: 16),
                CustomTextField(
                    campo: 'Waistline',
                    hint: 'Waist (cm)',
                    focusNode: focusNodes[8],
                    keyboardType: TextInputType.number,
                    nextFocusNode: focusNodes[9]),
                const SizedBox(height: 16),
                CustomTextField(
                    campo: 'Bust',
                    hint: 'Bust (cm)',
                    focusNode: focusNodes[9],
                    keyboardType: TextInputType.number,
                    nextFocusNode: focusNodes[10]),
                const SizedBox(height: 16),
                CustomTextField(
                    campo: 'Hip',
                    hint: 'Hip (cm)',
                    focusNode: focusNodes[10],
                    keyboardType: TextInputType.number),
                const SizedBox(height: 16),
                const Row(
                  children: [
                    CustomFormsButton(
                      title: 'CANCEL REQUEST',
                      backgroundColor: AppColors.white,
                      titleColor: AppColors.focusedInput,
                    ),
                    SizedBox(width: 20),
                    CustomFormsButton(
                      title: 'SEND REQUEST',
                      backgroundColor: AppColors.focusedInput,
                      titleColor: AppColors.white,
                    ),
                  ],
                ),
                const SizedBox(height: 32),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
