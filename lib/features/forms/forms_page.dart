import 'package:flutter/material.dart';
import 'package:flutter_application_1/common/constant/app_colors.dart';
import 'package:flutter_application_1/common/constant/app_text_styles.dart';
import 'package:flutter_application_1/common/widgets/custom_forms_button.dart';
import 'package:flutter_application_1/common/widgets/custom_description_field.dart';
import 'package:flutter_application_1/common/widgets/custom_text_field.dart';
import 'package:flutter_application_1/data/Models/forms_model.dart';
import 'package:flutter_application_1/data/Http/http_client.dart';
import 'package:flutter_application_1/data/Repository/forms_repository.dart';

class FormsPage extends StatefulWidget {
  const FormsPage({super.key});

  @override
  _FormsPageState createState() => _FormsPageState();
}

class _FormsPageState extends State<FormsPage> {
  final nameController = TextEditingController();
  final ageController = TextEditingController();
  final descriptionController = TextEditingController();
  final emailController = TextEditingController();
  final heightController = TextEditingController();
  final weightController = TextEditingController();
  final eyesColorController = TextEditingController();
  final hairsColorController = TextEditingController();
  final waistlineController = TextEditingController();
  final bustController = TextEditingController();
  final hipController = TextEditingController();

  final focusNodes = List<FocusNode>.generate(12, (_) => FocusNode());
  final Map<String, bool> _isFieldValid = {
    'name': true,
    'age': true,
    'description': true,
    'email': true,
    'height': true,
    'weight': true,
    'eyesColor': true,
    'hairsColor': true,
    'waistline': true,
    'bust': true,
    'hip': true,
  };

  final IHttpClient client =
      HttpClient(); // A classe que implementa IHttpClient
  late final FormsRepository formsRepository;

  @override
  void initState() {
    super.initState();
    formsRepository = FormsRepository(client: client);
  }

  bool _validateFields() {
    setState(() {
      _isFieldValid['name'] = nameController.text.trim().isNotEmpty;
      _isFieldValid['age'] = ageController.text.trim().isNotEmpty;
      _isFieldValid['description'] =
          descriptionController.text.trim().isNotEmpty;
      _isFieldValid['email'] = emailController.text.trim().isNotEmpty;
      _isFieldValid['height'] = heightController.text.trim().isNotEmpty;
      _isFieldValid['weight'] = weightController.text.trim().isNotEmpty;
      _isFieldValid['eyesColor'] = eyesColorController.text.trim().isNotEmpty;
      _isFieldValid['hairsColor'] = hairsColorController.text.trim().isNotEmpty;
      _isFieldValid['waistline'] = waistlineController.text.trim().isNotEmpty;
      _isFieldValid['bust'] = bustController.text.trim().isNotEmpty;
      _isFieldValid['hip'] = hipController.text.trim().isNotEmpty;
    });

    // Verifica se todos os campos estão válidos
    return !_isFieldValid.containsValue(false);
  }

  void sendRequest() async {
    if (!_validateFields()) {
      return; // Não envia o formulário se algum campo for inválido
    }

    final form = FormsModel(
        name: nameController.value.text,
        age: int.tryParse(ageController.value.text) ?? 0,
        description: descriptionController.value.text,
        email: emailController.value.text,
        height: double.tryParse(heightController.value.text) ?? 0,
        weight: double.tryParse(weightController.value.text) ?? 0,
        eyesColor: eyesColorController.value.text,
        hairsColor: hairsColorController.value.text,
        waistline: double.tryParse(waistlineController.value.text) ?? 0,
        bust: double.tryParse(bustController.value.text) ?? 0,
        hip: double.tryParse(hipController.value.text) ?? 0);

    try {
      final response = await formsRepository.postForms(form);

      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (response == 200) {
          // Limpa todos os campos
          nameController.clear();
          ageController.clear();
          descriptionController.clear();
          emailController.clear();
          heightController.clear();
          weightController.clear();
          eyesColorController.clear();
          hairsColorController.clear();
          waistlineController.clear();
          bustController.clear();
          hipController.clear();

          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text('Formulário enviado com sucesso!',
                style:
                    AppTextStyles.regularText.copyWith(color: AppColors.white)),
            behavior: SnackBarBehavior.floating,
            backgroundColor: Colors.green,
            duration: const Duration(seconds: 5),
            margin: const EdgeInsets.only(bottom: 15, right: 20, left: 20),
          ));
        } else {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text('Não foi possível enviar o formulário.',
                style:
                    AppTextStyles.regularText.copyWith(color: AppColors.white)),
            behavior: SnackBarBehavior.floating,
            backgroundColor: Colors.orange,
            duration: const Duration(seconds: 5),
            margin: const EdgeInsets.only(bottom: 15, right: 20, left: 20),
          ));
        }
      });
    } catch (error) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text('Erro ao enviar formulário: $error',
              style:
                  AppTextStyles.regularText.copyWith(color: AppColors.white)),
          behavior: SnackBarBehavior.floating,
          backgroundColor: Colors.redAccent,
          duration: const Duration(seconds: 5),
          margin: const EdgeInsets.only(bottom: 15, right: 20, left: 20),
        ));
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: Column(
        children: [
          const SizedBox(height: 20),
          Stack(
            children: [
              Image.asset('assets/images/logo_fernanda2.png'),
              Positioned(
                top: 10,
                left: 10,
                child: IconButton(
                  icon: const Icon(Icons.arrow_back, color: Colors.black),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ),
            ],
          ),
          Expanded(
            child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              children: [
                const SizedBox(height: 20),
                CustomTextField(
                  campo: 'Name',
                  hint: 'Full Name',
                  controller: nameController,
                  focusNode: focusNodes[0],
                  nextFocusNode: focusNodes[1],
                  hasError: _isFieldValid['name'] == false,
                ),
                const SizedBox(height: 16),
                CustomTextField(
                  campo: 'Age',
                  hint: 'Age',
                  controller: ageController,
                  focusNode: focusNodes[1],
                  keyboardType: TextInputType.number,
                  nextFocusNode: focusNodes[2],
                  hasError: _isFieldValid['age'] == false,
                ),
                const SizedBox(height: 16),
                CustomDescriptionField(
                  controller: descriptionController,
                  focusNode: focusNodes[2],
                  hasError: _isFieldValid['description'] == false,
                ),
                const SizedBox(height: 16),
                CustomTextField(
                  campo: 'Email',
                  hint: 'Email (example@gmail.com)',
                  controller: emailController,
                  focusNode: focusNodes[3],
                  nextFocusNode: focusNodes[4],
                  hasError: _isFieldValid['email'] == false,
                ),
                const SizedBox(height: 16),
                CustomTextField(
                  campo: 'Height',
                  hint: 'Height (cm)',
                  controller: heightController,
                  focusNode: focusNodes[4],
                  keyboardType: TextInputType.number,
                  nextFocusNode: focusNodes[5],
                  hasError: _isFieldValid['height'] == false,
                ),
                const SizedBox(height: 16),
                CustomTextField(
                  campo: 'Weight',
                  hint: 'Weight (kg)',
                  controller: weightController,
                  focusNode: focusNodes[5],
                  keyboardType: TextInputType.number,
                  nextFocusNode: focusNodes[6],
                  hasError: _isFieldValid['weight'] == false,
                ),
                const SizedBox(height: 16),
                CustomTextField(
                  campo: 'Eye’s Color',
                  hint: 'Eye’s Color',
                  controller: eyesColorController,
                  focusNode: focusNodes[6],
                  nextFocusNode: focusNodes[7],
                  hasError: _isFieldValid['eyesColor'] == false,
                ),
                const SizedBox(height: 16),
                CustomTextField(
                  campo: 'Hair’s Color',
                  hint: 'Hair’s Color',
                  controller: hairsColorController,
                  focusNode: focusNodes[7],
                  nextFocusNode: focusNodes[8],
                  hasError: _isFieldValid['hairsColor'] == false,
                ),
                const SizedBox(height: 16),
                CustomTextField(
                  campo: 'Waistline',
                  hint: 'Waist (cm)',
                  controller: waistlineController,
                  focusNode: focusNodes[8],
                  keyboardType: TextInputType.number,
                  nextFocusNode: focusNodes[9],
                  hasError: _isFieldValid['waistline'] == false,
                ),
                const SizedBox(height: 16),
                CustomTextField(
                  campo: 'Bust',
                  hint: 'Bust (cm)',
                  controller: bustController,
                  focusNode: focusNodes[9],
                  keyboardType: TextInputType.number,
                  nextFocusNode: focusNodes[10],
                  hasError: _isFieldValid['bust'] == false,
                ),
                const SizedBox(height: 16),
                CustomTextField(
                  campo: 'Hip',
                  hint: 'Hip (cm)',
                  controller: hipController,
                  focusNode: focusNodes[10],
                  keyboardType: TextInputType.number,
                  nextFocusNode: focusNodes[11],
                  hasError: _isFieldValid['hip'] == false,
                ),
                const SizedBox(height: 16),
                Row(
                  children: [
                    CustomFormsButton(
                      title: 'CANCEL REQUEST',
                      backgroundColor: AppColors.white,
                      titleColor: AppColors.focusedInput,
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                    const SizedBox(width: 20),
                    CustomFormsButton(
                      title: 'SEND REQUEST',
                      backgroundColor: AppColors.focusedInput,
                      titleColor: AppColors.white,
                      onPressed: () async {
                        // Verifica se os campos são válidos
                        if (_validateFields()) {
                          // Exibe o pop-up de confirmação
                          final bool? confirm = await showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                backgroundColor: AppColors.white,
                                title: const Text(
                                  'Confirm Submission',
                                  style: AppTextStyles.buttonFormsText,
                                ),
                                content: const Text(
                                  'Do you want to submit the form?',
                                  style: AppTextStyles.regularTextSerif,
                                ),
                                actions: [
                                  TextButton(
                                    onPressed: () =>
                                        Navigator.of(context).pop(false),
                                    child: const Text('Cancel',
                                        style: AppTextStyles.buttonText),
                                  ),
                                  TextButton(
                                    onPressed: () =>
                                        Navigator.of(context).pop(true),
                                    child: const Text(
                                      'Confirm',
                                      style: AppTextStyles.buttonText,
                                    ),
                                  ),
                                ],
                              );
                            },
                          );

                          // Se o usuário confirmar, envia a requisição
                          if (confirm == true) {
                            sendRequest();
                          }
                        } else {
                          // Exibe uma mensagem de erro se houver campos inválidos
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content: Text(
                              'Please fill in all the required fields.',
                              style: AppTextStyles.regularText
                                  .copyWith(color: AppColors.white),
                            ),
                            behavior: SnackBarBehavior.floating,
                            backgroundColor: Colors.redAccent,
                            duration: const Duration(seconds: 2),
                            margin: const EdgeInsets.only(
                                bottom: 15, right: 20, left: 20),
                          ));
                        }
                      },
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
