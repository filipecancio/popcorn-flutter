enum QueryParameterType {
  apiKey(name:'api_key'),
  query(name:'query');

  const QueryParameterType({
    required this.name,
});

  final String name;
}