import '../models/plan_model.dart';

class PlanService {
  Future<List<PlanModel>> getPlans() async {
    // Simulating API delay
    await Future.delayed(const Duration(milliseconds: 800));

    final mockData = [
      {
        "id": "p1",
        "name": "EuroConnect",
        "data": "1GB",
        "validity": "7 days",
        "countriesSupported": 32,
        "price": 2.51
      },
      {
        "id": "p2",
        "name": "Global Unlimited",
        "data": "Unlimited",
        "validity": "14 days",
        "countriesSupported": 34,
        "price": 2.99
      },
      {
        "id": "p3",
        "name": "EuroLink",
        "data": "1GB",
        "validity": "7 days",
        "countriesSupported": 34,
        "price": 2.52
      },
      {
        "id": "p4",
        "name": "Worldlysours",
        "data": "1GB",
        "validity": "14 days",
        "countriesSupported": 57,
        "price": 3.00
      }
    ];

    return mockData.map((json) => PlanModel.fromJson(json)).toList();
  }
}
