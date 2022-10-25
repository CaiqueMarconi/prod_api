import '../../data/fake_data.dart';
import '../../dto/product_dto.dart';
import '../../models/product_model.dart';
import 'i_products_service.dart';

class ProductsService implements IProductService {
  @override
  Future<List<ProductModel>> findAllProducts() async {
    await Future.delayed(Duration(microseconds: 500));
    final List<ProductModel> allProducts =
        products.map((e) => ProductModel.fromMap(e)).toList();
    return allProducts;
  }

  @override
  Future<ProductModel> findProductById(int id) async {
    await Future.delayed(Duration(microseconds: 500));
    final List<ProductModel> allProducts =
        products.map((e) => ProductModel.fromMap(e)).toList();
    final selectProd = allProducts.firstWhere((element) => element.id == id);
    return selectProd;
  }

  @override
  Future<ProductModel> createProduct(ProductDTO productDTO) async {
    await Future.delayed(Duration(microseconds: 500));

    final newProductMap = productDTO.toMap();
    products.add(newProductMap);
    return ProductModel.fromMap(newProductMap);
  }
}
