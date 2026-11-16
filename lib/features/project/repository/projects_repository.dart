import 'package:task_manager/app/auth/model/user_model.dart';
import 'package:task_manager/features/home/models/task/task.dart';
import 'package:task_manager/features/project/models/project/project.dart';
import 'package:task_manager/features/tags/models/tag/tag.dart';

abstract class ProjectsRepository {
  Future<String?> addTask({required String projectId, required TMTask task});

  Future<List<TMTask>> fetchUserTasks(String userId);

  Future<void> deleteTask({required String projectId, required String taskId});

  Future<void> updateTask({required String projectId, required TMTask task});

  Future<List<TMTask>> fetchTasks(List<String> projectIds);

  Future<void> updateProject(TMProject project);

  Future<List<TMUser>> fetchUsers({String? searchQuery, int limit = 20});

  Future<List<TMUser>> fetchAllUsers();

  Future<List<TMUser>?> fetchUsersByIds({required List<String> usersIds});

  Future<List<TMTaskTag>?> fetchAllTags();

  Future<String?> addTag({required String projectId, required TMTaskTag tag});

  Future<List<TMTaskTag>?> fetchTagsFromProject(List<String> tagsIds);
}
