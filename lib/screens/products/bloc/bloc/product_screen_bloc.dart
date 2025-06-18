import 'package:bloc/bloc.dart';
import 'package:bloc_app/screens/products/model/product.dart';
import 'package:bloc_app/screens/products/repository/post_repository.dart';
import 'package:meta/meta.dart';

part 'product_screen_event.dart';
part 'product_screen_state.dart';

class ProductScreenBloc extends Bloc<ProductScreenEvent, ProductScreenState> {
  final ProductRepository _productRepository;

  ProductScreenBloc(this._productRepository) : super(ProductScreenInitial()) {
    on<FetchProduct>((event, emit) async {
      try {
        emit(ProductScreenLoading());
        List<Products> products = await _productRepository.fetchProduct();
        emit(ProductScreenLoaded(products: products));
      } catch (e) {
        print(e);

        emit(ProductScreenError(message: "Something Went Wrong..."));
      }
    });
  }
}
