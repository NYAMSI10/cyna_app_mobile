class SearchRequestDto {
  final String? text;
  final List<String>? categories;
  final List<String>? services;
  final double? minPrice;
  final double? maxPrice;
  final String? sortBy;
  final String? sortOrder;
  final int page;
  final int limit;

  const SearchRequestDto({
    this.text,
    this.categories,
    this.services,
    this.minPrice,
    this.maxPrice,
    this.sortBy,
    this.sortOrder,
    this.page = 1,
    this.limit = 10,
  });

  Map<String, dynamic> toQueryParams() {
    final params = <String, dynamic>{};
    if (text != null && text!.isNotEmpty) params['text'] = text;
    if (categories != null && categories!.isNotEmpty) {
      params['categories'] = categories;
    }
    if (services != null && services!.isNotEmpty) {
      params['services'] = services;
    }
    if (minPrice != null) params['minPrice'] = minPrice;
    if (maxPrice != null) params['maxPrice'] = maxPrice;
    if (sortBy != null) params['sortBy'] = sortBy;
    if (sortOrder != null) params['sortOrder'] = sortOrder;
    params['page'] = page;
    params['limit'] = limit;
    return params;
  }

  SearchRequestDto copyWith({
    String? text,
    List<String>? categories,
    List<String>? services,
    double? minPrice,
    double? maxPrice,
    String? sortBy,
    String? sortOrder,
    int? page,
    int? limit,
  }) {
    return SearchRequestDto(
      text: text ?? this.text,
      categories: categories ?? this.categories,
      services: services ?? this.services,
      minPrice: minPrice ?? this.minPrice,
      maxPrice: maxPrice ?? this.maxPrice,
      sortBy: sortBy ?? this.sortBy,
      sortOrder: sortOrder ?? this.sortOrder,
      page: page ?? this.page,
      limit: limit ?? this.limit,
    );
  }
}
