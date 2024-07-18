import 'dart:convert';

import 'package:integration/data/http/exceptions.dart';
import 'package:integration/data/http/http_client.dart';
import 'package:integration/data/models/produto_model.dart';

abstract class IprodutoRepository {
  Future<List<ProdutoModel>> getProdutos();
}

class ProdutoRepository implements IprodutoRepository {
  final IHttpClient client;

  ProdutoRepository({required this.client});

  @override
  Future<List<ProdutoModel>> getProdutos() async {
    final response = await client.get(url: 'https://dummyjson.com/products');
    if (response.statusCode == 200) {
      final List<ProdutoModel> produtos = [];
      final body = jsonDecode(response.body);

      for (var item in body['products']) {
        produtos.add(ProdutoModel.fromJson(item));
      }

      return produtos;
    } else if (response.statusCode == 404) {
      throw NotFoundException('A URL informada não é válida');
    } else {
      throw Exception('Não foi possível carregar os produtos');
    }
  }
}


// import 'dart:convert';

// import 'package:integration/data/http/exceptions.dart';
// import 'package:integration/data/http/http_client.dart';
// import 'package:integration/data/models/produto_model.dart';

// abstract class IprodutoRepository {
//   Future<List<ProdutoModel>> getProdutos();
// }

// class ProdutoRepository implements IprodutoRepository {
//   final IHttpClient client;

//   ProdutoRepository({required this.client});

//   @override
//   Future<List<ProdutoModel>> getProdutos() async {
//     final response = await client.get(
//       url: 'https://dummyjson.com/products',
//     );
//     if (response.statusCode == 200) {
//       final List<ProdutoModel> produtos = [];

//       final body = jsonDecode(response.body);

//       body['products'].map((item) {
//         final ProdutoModel produto = ProdutoModel.fromMap(item);
//         produtos.add(produto);
//       }).toList();
//       return produtos;
//     } else if (response.statusCode == 404) {
//       throw NotFoundException(' A Url informada não é válida');
//     } else {
//       throw Exception('Não foi possível carregar os produtos');
//     }
//   }
// }
