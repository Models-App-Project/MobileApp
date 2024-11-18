import 'package:flutter/material.dart';
import 'package:flutter_application_1/data/Http/exceptions.dart';
import 'package:flutter_application_1/data/Models/model_model.dart';
import 'package:flutter_application_1/data/Repository/model_repository.dart';

class ModelStore {
  final IModelRepository repository;

  final ValueNotifier<bool> isLoading = ValueNotifier<bool>(false);

  final ValueNotifier<List<ModelModel>> state =
      ValueNotifier<List<ModelModel>>([]);

  final ValueNotifier<String> erro = ValueNotifier<String>('');

  ModelStore({required this.repository});

  Future getModels() async {
    isLoading.value = true;

    try {
      final result = await repository.getModels();
      state.value = result;
    } on NotFoundException catch (e) {
      erro.value = e.message;
    } catch (e) {
      erro.value = e.toString();
    }

    isLoading.value = false;
  }
}
