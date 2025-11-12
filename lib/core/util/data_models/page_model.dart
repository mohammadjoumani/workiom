class PageModel<T> {
  final List<T> data;
  final bool hasMore;

  PageModel({
    required this.data,
    required this.hasMore,
  });
}
