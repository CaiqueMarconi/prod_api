import '../../dto/product_dto.dart';
import '../../models/product_model.dart';

abstract class IProductService {
  Future<List<ProductModel>> findAllProducts();
  Future<ProductModel> findProductById(int id);
  Future<ProductModel> createProduct(ProductDTO productDTO);
}
