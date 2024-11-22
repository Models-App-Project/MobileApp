import 'package:flutter/material.dart';
import 'package:flutter_application_1/common/constant/app_colors.dart';
import 'package:flutter_application_1/common/constant/app_text_styles.dart';
import 'package:flutter_application_1/data/Http/http_client.dart';
import 'package:flutter_application_1/data/Models/model_model.dart';
import 'package:flutter_application_1/data/Repository/model_repository.dart';

class ModelsPage extends StatefulWidget {
  ModelsPage({super.key});

  @override
  State<ModelsPage> createState() => _ModelsPageState();
}

class _ModelsPageState extends State<ModelsPage> {
  final ModelRepository repository = ModelRepository(client: HttpClient());
  List<ModelModel> models = [];
  bool isLoading = false;
  String errorMessage = '';

  @override
  void initState() {
    super.initState();
    _fetchModels();
  }

  Future<void> _fetchModels() async {
    setState(() {
      isLoading = true;
      errorMessage = '';
    });

    try {
      final fetchedModels = await repository.getModels();
      setState(() {
        models = fetchedModels;
      });
    } catch (e) {
      setState(() {
        errorMessage =
            'Erro ao carregar os modelos. Tente novamente mais tarde.';
      });
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Logo
            Flexible(
              flex: 2,
              child: Image.asset(
                'assets/images/logo_fernanda2.png',
                height: 100,
              ),
            ),
            const SizedBox(height: 20),

            // Main Image Section
            Expanded(
              flex: 5,
              child: isLoading
                  ? const Center(
                      child: CircularProgressIndicator(),
                    )
                  : errorMessage.isNotEmpty
                      ? _buildErrorCard(
                          message: errorMessage,
                          icon: Icons.error,
                        )
                      : models.isEmpty
                          ? _buildErrorCard(
                              message:
                                  'Nenhuma modelo foi encontrada no momento.',
                              icon: Icons.error_outline,
                            )
                          : ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: models.length,
                              itemBuilder: (_, index) {
                                final model = models[index];
                                return Padding(
                                  padding:
                                      const EdgeInsets.symmetric(horizontal: 8),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(16),
                                    child: Image.network(
                                      model.photos.first.downloadURL,
                                      fit: BoxFit.cover,
                                      width: 250,
                                      height: 800,
                                      errorBuilder:
                                          (context, error, stackTrace) =>
                                              const Icon(
                                        Icons.broken_image,
                                        size: 100,
                                        color: Colors.grey,
                                      ),
                                    ),
                                  ),
                                );
                              },
                            ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildErrorCard({
    required String message,
    required IconData icon,
  }) {
    return Center(
      child: Card(
        color: AppColors.white,
        elevation: 4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        child: SizedBox(
          width: 250,
          height: 800,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    icon,
                    size: 80,
                    color: const Color(0xFFE6E7E9),
                  ),
                  const SizedBox(height: 16),
                  SizedBox(
                    width: 170,
                    child: Text(
                      message,
                      textAlign: TextAlign.center,
                      style: AppTextStyles.regularText
                          .copyWith(color: Colors.black87),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
