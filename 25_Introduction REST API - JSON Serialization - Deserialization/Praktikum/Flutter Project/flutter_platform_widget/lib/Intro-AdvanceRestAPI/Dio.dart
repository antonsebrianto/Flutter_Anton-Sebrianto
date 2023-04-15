import 'package:dio/dio.dart';

class DioService {
  final dio = Dio();

  PostContacts(String id, String name, String phone) async {
    Response response;
    response = await dio.post(
      'https://my-json-server.typicode.com/hadihammurabi/flutter-webservice/contacts',
      queryParameters: {'id': id, 'name': name, 'phone': phone},
    );
    if (response.statusCode == 201) {
      print(response.statusCode.toString());
      print(response.data.toString());
    } else {
      print('Gagal post contact');
    }
  }

  JSONtoObject() async {
    Response response;
    response = await dio.get(
        'https://my-json-server.typicode.com/hadihammurabi/flutter-webservice/contacts/2');
    if (response.statusCode == 200) {
      print(response.data.toString());
    }
  }

  PutRequestDio(int userId, String title, String body) async {
    Response response;
    response = await dio.put(
      'https://jsonplaceholder.typicode.com/posts/1',
      data: {
        'title': title,
        'body': body,
        'userId': userId,
      },
    );
    if (response.statusCode == 200) {
      print(response.data.toString());
    }
  }
}
