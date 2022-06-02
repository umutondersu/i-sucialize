import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_analytics/observer.dart';

class AnalyticsService {
  final FirebaseAnalytics _analytics = FirebaseAnalytics();

  FirebaseAnalyticsObserver getanalyticsObserver() =>
      FirebaseAnalyticsObserver(analytics: _analytics);
}

/*
void setupLocator() {
  locator.registerLazySingleton(() => AnalyticsService());
}
*/
