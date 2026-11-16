import 'package:task_manager/app/auth/model/user_model.dart';
import 'package:task_manager/app/extensions/date_time.dart';
import 'package:task_manager/features/home/models/task/task.dart';
import 'package:task_manager/features/home/view/models/home_card_data.dart';
import 'package:task_manager/features/home/view/models/user_entity.dart';
import 'package:task_manager/features/project/models/project/project.dart';

class HomeUtils {
  static HomeUserProfileData? fetchProfileData(TMUser? user) {
    if (user == null || user.displayName == null) return null;

    final displayName = user.displayName!.split(' ');
    return HomeUserProfileData(
      firstName: displayName.isNotEmpty ? displayName[0] : '',
      profileImage: user.photoUrl,
    );
  }

  static List<TMHomeCardData> fetchProjectsData(List<TMProject>? projects) {
    if (projects == null || projects.isEmpty) return [];

    return projects.map((project) {
      return TMHomeCardData(
        id: project.id,
        name: project.name,
        topTitle: 'Project ${projects.indexOf(project) + 1}',
        date: project.startDate?.toRuDate,
      );
    }).toList();
  }

  static Map<String, List<TMHomeCardData>> fetchTasksFromProject(
    List<TMTask>? tasks,
  ) {
    if (tasks == null || tasks.isEmpty) return {};
    final Map<String, List<TMHomeCardData>> result = {};
    for (final task in tasks) {
      result
          .putIfAbsent(task.projectId, () => [])
          .add(
            TMHomeCardData(
              id: task.id,
              name: task.name,
              topTitle: 'task.status.toString()',
              date: task.endDate?.toRuDate,
            ),
          );
    }

    return result;
  }

  static List<TMHomeCardData> fetchTasksFromProjectInProgress(
    List<TMTask>? tasks,
  ) {
    if (tasks == null || tasks.isEmpty) return [];

    return tasks.map((task) {
      return TMHomeCardData(
        id: task.id,
        name: task.name,
        topTitle: task.status.toString(),
        date: task.endDate?.toRuDate,
      );
    }).toList();
  }
}
