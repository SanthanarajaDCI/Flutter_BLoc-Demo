part of 'product_screen_bloc.dart';

@immutable
sealed class ProductScreenState {}

final class ProductScreenInitial extends ProductScreenState {}

class ProductScreenLoading extends ProductScreenState {}

class ProductScreenLoaded extends ProductScreenState {
  final List<Products> products;

  ProductScreenLoaded({required this.products});
}

class ProductScreenError extends ProductScreenState {
  final String message;

  ProductScreenError({required this.message});
}
