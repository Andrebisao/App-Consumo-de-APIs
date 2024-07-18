import 'package:flutter/material.dart';
import 'package:integration/data/http/exceptions.dart';
import 'package:integration/data/models/produto_model.dart';
import 'package:integration/data/repositories/produto_repository.dart';

class ProdutoStore {
  final IprodutoRepository repository;

  final ValueNotifier<bool> isLoading = ValueNotifier<bool>(true);

  final ValueNotifier<List<ProdutoModel>> state =
      ValueNotifier<List<ProdutoModel>>([]);

  final ValueNotifier erro = ValueNotifier('');

  ProdutoStore({required this.repository});

  Future getProdutos() async {
    isLoading.value = true;

    try {
      final result = await repository.getProdutos();
      state.value = result;
    } on NotFoundException catch (e) {
      erro.value = e.message;
    } catch (e) {
      erro.value = e.toString();
    }
    isLoading.value = false;
  }
}
