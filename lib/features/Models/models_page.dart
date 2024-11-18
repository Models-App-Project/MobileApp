import 'package:flutter/material.dart';
import 'package:flutter_application_1/common/constant/app_colors.dart';
import 'package:flutter_application_1/common/constant/app_text_styles.dart';
import 'package:flutter_application_1/data/Http/http_client.dart';
import 'package:flutter_application_1/data/Repository/model_repository.dart';
import 'package:flutter_application_1/features/stores/model_store.dart';

class ModelsPage extends StatefulWidget {
  ModelsPage({super.key});

  final ModelStore store = ModelStore(
    repository: ModelRepository(
      client: HttpClient(),
    ),
  );

  @override
  State<ModelsPage> createState() => _ModelsPageState();
}

class _ModelsPageState extends State<ModelsPage> {
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
              child: AnimatedBuilder(
                animation: Listenable.merge([
                  widget.store.isLoading,
                  widget.store.erro,
                  widget.store.state,
                ]),
                builder: (context, child) {
                  if (widget.store.isLoading.value) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }

                  if (widget.store.erro.value.isNotEmpty) {
                    WidgetsBinding.instance.addPostFrameCallback((_) {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text(widget.store.erro.value,
                            style: AppTextStyles.smallText
                                .copyWith(color: Colors.black12)),
                        behavior: SnackBarBehavior.floating,
                        backgroundColor: Colors.redAccent,
                        duration: const Duration(seconds: 5),
                        margin: const EdgeInsets.only(
                            bottom: 15, right: 20, left: 20),
                      ));
                    });

                    return _buildErrorCard(
                      message:
                          'Erro ao carregar os dados: ${widget.store.erro.value}',
                      icon: Icons.error,
                    );
                  }

                  if (widget.store.state.value.isEmpty) {
                    WidgetsBinding.instance.addPostFrameCallback((_) {
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        content: Text('Nenhuma modelo foi encontrada.'),
                        behavior: SnackBarBehavior.floating,
                        backgroundColor: Colors.redAccent,
                        duration: Duration(seconds: 5),
                        margin:
                            EdgeInsets.only(bottom: 15, right: 20, left: 20),
                      ));
                    });

                    return _buildErrorCard(
                      message: 'Nenhuma modelo foi encontrada no momento.',
                      icon: Icons.error_outline,
                    );
                  } else {
                    // Carousel-like horizontal list
                    return ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: widget.store.state.value.length,
                      itemBuilder: (_, index) {
                        final model = widget.store.state.value[index];
                        return Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(16),
                            child: Image.network(
                              model.url.first,
                              fit: BoxFit.cover,
                              width: 200,
                              height: 300,
                              errorBuilder: (context, error, stackTrace) =>
                                  const Icon(
                                Icons.broken_image,
                                size: 100,
                                color: Colors.grey,
                              ),
                            ),
                          ),
                        );
                      },
                    );
                  }
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
