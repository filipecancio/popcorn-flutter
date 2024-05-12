import 'package:popcorn/repository/query_parameter_type.dart';

class QueryParameter {
  final QueryParameterType key;
  final String value;

  QueryParameter(this.key, this.value);

  @override
  String toString() => '${key.name}=$value';
}