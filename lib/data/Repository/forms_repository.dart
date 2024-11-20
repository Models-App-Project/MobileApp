import 'package:flutter_application_1/data/Http/exceptions.dart';
import 'package:flutter_application_1/data/Http/http_client.dart';
import 'package:flutter_application_1/data/Models/forms_model.dart';

abstract class IFormsRepository {
  Future<int> postForms(FormsModel forms);
}

class FormsRepository implements IFormsRepository {
  final IHttpClient client;

  FormsRepository({required this.client});

  @override
  Future<int> postForms(FormsModel forms) async {
    final response = await client.post(
        url:
            "https://models-api-production.up.railway.app/modelsforms/sendForm",
        body: forms.toJson());

    if (response.statusCode == 200) {
      return response.statusCode;
    } else if (response.statusCode == 404) {
      throw NotFoundException('A url informada não é válida');
    } else {
      throw Exception('Não foi possível enviar o formulário');
    }
  }
}
