import 'package:equatable/equatable.dart';

class ProductFailure extends Equatable {
  final String message;

  const ProductFailure({required this.message});

  @override
  List<Object?> get props => [message];
}