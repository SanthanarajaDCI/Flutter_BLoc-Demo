part of 'product_screen_bloc.dart';

@immutable
sealed class ProductScreenEvent {}

class FetchProduct extends ProductScreenEvent {}
