import 'package:shelf_modular/shelf_modular.dart';

import '../../src/controllers/products_controller.dart';
import '../../src/services/products/products_service.dart';

class AppModule extends Module {
  @override
  List<Bind<Object>> get binds => [
        Bind.factory((i) => ProductsService()),
        Bind.factory((i) => ProductsController(i())),
      ];

  @override
  List<ModularRoute> get routes => [
        Route.get(
            '/products', Modular.get<ProductsController>().getAllProducts),
        Route.get(
            '/products/<id>', Modular.get<ProductsController>().getProductById),
        Route.post(
            '/products', Modular.get<ProductsController>().createProduct),
      ];
}
