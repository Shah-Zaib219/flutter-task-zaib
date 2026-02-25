import '../models/bundle_model.dart';

class BundleService {
  Future<List<BundleModel>> getBundles() async {
    // Simulating API delay
    await Future.delayed(const Duration(milliseconds: 800));

    final mockData = [
      {"id": "1", "data": "3 GB", "validity": "30 days", "price": 2.99},
      {"id": "2", "data": "5 GB", "validity": "7 days", "price": 3.50},
      {"id": "3", "data": "5 GB", "validity": "15 days", "price": 3.99},
      {"id": "4", "data": "5 GB", "validity": "30 days", "price": 4.25},
      {"id": "5", "data": "10 GB", "validity": "10 days", "price": 5.50},
      {"id": "6", "data": "10 GB", "validity": "15 days", "price": 5.75},
      {"id": "7", "data": "20 GB", "validity": "30 days", "price": 7.48},
      {"id": "8", "data": "Unlimited", "validity": "10 days", "price": 5.50}
    ];

    return mockData.map((json) => BundleModel.fromJson(json)).toList();
  }
}
