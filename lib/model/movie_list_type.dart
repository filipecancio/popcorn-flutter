enum MovieListType {
  popular('Popular Movies'),
  trending('Trending Movies'),
  none('Finding Movies who has:');

  const MovieListType(this.title);

  final String title;
}