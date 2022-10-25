import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:shelf/shelf.dart';

import '../dto/product_dto.dart';
import '../models/product_model.dart';
import '../services/products/products_service.dart';

class ProductsController {
  final ProductsService _productsService;

  ProductsController(this._productsService);

  FutureOr<Response> getAllProducts(Request request) async {
    try {
      final List<ProductModel> allProducts =
          await _productsService.findAllProducts();
      return Response.ok(
        jsonEncode(
          {
            'products': allProducts.map((e) => e.toMap()).toList(),
          },
        ),
        headers: {
          HttpHeaders.contentTypeHeader: 'application/json',
        },
      );
    } catch (e) {
      return Response.internalServerError(
        body: jsonEncode(
          {
            'error': e.toString(),
          },
        ),
      );
    }
  }

  FutureOr<Response> getProductById(Request request, String id) async {
    final productId = int.parse(id);
    try {
      final ProductModel product =
          await _productsService.findProductById(productId);
      return Response.ok(
        jsonEncode(
          {
            'product': product.toMap(),
          },
        ),
        headers: {
          HttpHeaders.contentTypeHeader: 'application/json',
        },
      );
    } catch (e) {
      return Response.internalServerError(
        body: jsonEncode(
          {
            'error': e,
          },
        ),
      );
    }
  }

  FutureOr<Response> createProduct(Request request) async {
    try {
      final body = await request.readAsString();
      final productData = jsonDecode(body);
      final newProductDTO = ProductDTO.fromMap(productData);
      final newProduct = await _productsService.createProduct(newProductDTO);
      return Response.ok(
        jsonEncode(
          {
            'product': newProduct.toMap(),
          },
        ),
        headers: {
          HttpHeaders.contentTypeHeader: 'application/json',
        },
      );
    } catch (e) {
      return Response.internalServerError(
        body: jsonEncode(
          {
            'error': e,
          },
        ),
      );
    }
  }
}
