import 'package:task_manager/app/auth/model/user_model.dart';
import 'package:task_manager/features/home/models/task/task.dart';
import 'package:task_manager/features/project/models/project/project.dart';

abstract class HomeRepository {
  Future<List<TMProject>?> fetchUserProjects({required String userId});

  Future<List<TMProject>?> fetchAllProjects();

  Future<List<TMTask>> fetchTasks(List<String> projectIds);

  Future<void> addTask({required String projectId, required TMTask task});


  Future<List<TMTask>> fetchUserTasks(String userId);

  Future<void> deleteTask({required String projectId, required String taskId});

  Future<void> updateTask({required String projectId, required TMTask task});

  Future<void> updateProject(TMProject project);

  Future<TMProject> addProject({required TMProject project});

  Future<List<TMUser>> fetchUsers({String? searchQuery, int limit = 20});

  Future<List<TMUser>> fetchAllUsers();

  Future<List<TMUser>?> fetchUsersByIds({required List<String> usersIds});
}
