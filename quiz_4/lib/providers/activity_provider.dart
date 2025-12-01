import '../model/activity_model.dart';

class ActivityProvider {
  static List<ActivityModel> activities = [];

  static void addActivity(ActivityModel a) {
    activities.add(a);
    if (activities.length > 5) {
      activities.removeAt(0);
    }
  }
}
