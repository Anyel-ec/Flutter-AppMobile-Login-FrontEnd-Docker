import 'package:teslo_shop/features/products/domain/datasources/products_datasource.dart';
import 'package:teslo_shop/features/products/domain/entities/Product.dart';
import 'package:teslo_shop/features/products/domain/repositories/products_repository.dart';

class ProductsRepositoryImpl implements ProductsRepository {

  final ProductsDataSource dataSource;

  ProductsRepositoryImpl(this.dataSource);

  @override
  Future<Product> createUpdateProduct(Map<String, dynamic> productLike) {
    return dataSource.createUpdateProduct(productLike);
  }

  @override
  Future<Product> getProductById(String id) {
    return dataSource.getProductById(id);
  }

  @override
  Future<List<Product>> getProductByPage({int limit = 10, int offset = 0}) {
   return dataSource.getProductByPage(limit: limit, offset: offset);
  }

  @override
  Future<List<Product>> searchProductByTerm(String term) {
    return dataSource.searchProductByTerm(term);
  }
  
}