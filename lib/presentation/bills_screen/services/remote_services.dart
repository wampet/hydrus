// import 'dart:convert';

// import 'package:flutter_dotenv/flutter_dotenv.dart';
// import 'package:http/http.dart' as http;
// import 'package:hydrus/presentation/bills_screen/widgets/bills_model.dart';

// class RemoteServices {
//   var client = http.Client();
//   List<ProductsModel> _productsList = [];
//   Future<List> fetchProducts() async {
//     var baseUrl = dotenv.env['API_URL'];

//     var response = await client.get(Uri.parse(baseUrl));
//     if (response.statusCode == 200) {
//       var jsonData = json.decode(response.body);
//       // print('The body of this get is ${json.toString()}');
//       // List<ProductsModel> cryptos = response.data['data']
//       //     .map((json) => ProductsModel.fromJson(json))
//       //     .toList()
//       //     .cast<ProductsModel>();

//       // setState(() {
//       //   _cryptos = cryptos;
//       // });
//     } else {
//       print("API response code ${response.statusCode}");

//       throw Exception('Failed to load data');
//     }

//     return response.contentLength;
//   }
// }
