class PlanModel {
  final String id;
  final String name;
  final String dataAmount;
  final String validity;
  final int supportedCountriesCount;
  final double price;
  final String currency;
  final bool isSelected;

  PlanModel({
    required this.id,
    required this.name,
    required this.dataAmount,
    required this.validity,
    required this.supportedCountriesCount,
    required this.price,
    this.currency = 'USD',
    this.isSelected = false,
  });

  factory PlanModel.fromJson(Map<String, dynamic> json) {
    return PlanModel(
      id: json['id'] as String? ?? '',
      name: json['name'] as String? ?? '',
      dataAmount:
          json['data'] as String? ?? json['dataAmount'] as String? ?? '',
      validity: json['validity'] as String? ?? '',
      supportedCountriesCount: json['countriesSupported'] as int? ??
          json['supportedCountriesCount'] as int? ??
          0,
      price: (json['price'] as num?)?.toDouble() ?? 0.0,
      currency: json['currency'] as String? ?? 'USD',
      isSelected: json['isSelected'] as bool? ?? false,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'data': dataAmount,
      'validity': validity,
      'countriesSupported': supportedCountriesCount,
      'price': price,
      'currency': currency,
      'isSelected': isSelected,
    };
  }

  PlanModel copyWith({
    String? id,
    String? name,
    String? dataAmount,
    String? validity,
    int? supportedCountriesCount,
    double? price,
    String? currency,
    bool? isSelected,
  }) {
    return PlanModel(
      id: id ?? this.id,
      name: name ?? this.name,
      dataAmount: dataAmount ?? this.dataAmount,
      validity: validity ?? this.validity,
      supportedCountriesCount:
          supportedCountriesCount ?? this.supportedCountriesCount,
      price: price ?? this.price,
      currency: currency ?? this.currency,
      isSelected: isSelected ?? this.isSelected,
    );
  }
}
