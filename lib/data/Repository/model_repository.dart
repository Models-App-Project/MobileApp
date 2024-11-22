import 'dart:convert';

import 'package:flutter_application_1/data/Http/exceptions.dart';
import 'package:flutter_application_1/data/Http/http_client.dart';
import 'package:flutter_application_1/data/Models/model_model.dart';

abstract class IModelRepository {
  Future<List<ModelModel>> getModels();
}

class ModelRepository implements IModelRepository {
  final IHttpClient client;

  ModelRepository({required this.client});

  @override
  Future<List<ModelModel>> getModels() async {
    final response = await client.get(
      url:
          'https://models-api-production.up.railway.app/models/getModels/findAll',
    );

    if (response.statusCode == 200) {
      final List<ModelModel> modelos = [];

      final body = jsonDecode(response.body) as List;

      for (var item in body) {
        modelos.add(ModelModel.fromMap(item));
      }

      return modelos;
    } else if (response.statusCode == 404) {
      throw NotFoundException("A url informada não é válida");
    } else {
      throw Exception('Não foi possível carregar as modelos');
    }
  }
}
