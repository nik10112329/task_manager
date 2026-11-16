import 'package:task_manager/app/auth/model/user_model.dart';
import 'package:task_manager/app/clients/google_client/firebase_client.dart';
import 'package:task_manager/features/home/models/task/task.dart';
import 'package:task_manager/features/home/repository/home_repository.dart';
import 'package:task_manager/features/project/models/project/project.dart';

class HomeRepositoryImpl implements HomeRepository {
  HomeRepositoryImpl({required this.client});

  final FirebaseClient client;

  @override
  Future<List<TMProject>> fetchAllProjects() async => client.fetchAllProjects();

  @override
  Future<List<TMProject>> fetchUserProjects({required String userId}) async =>
      client.fetchUserProjects(userId);

  @override
  Future<TMProject> addProject({required TMProject project}) async =>
      client.addProject(project: project);

  @override
  Future<void> updateProject(TMProject project) async =>
      client.updateProject(project);

  // @override
  // Future<List<String>> fetchTags() async => client.fetchTags();

  @override
  Future<List<TMTask>> fetchTasks(List<String> projectIds) async =>
      client.fetchTasks(projectIds: projectIds);

  @override
  Future<List<TMTask>> fetchUserTasks(String userId) async =>
      client.fetchUserTasks(userId);

  @override
  Future<void> addTask({
    required String projectId,
    required TMTask task,
  }) async => client.addTask(task: task);

  @override
  Future<void> updateTask({
    required String projectId,
    required TMTask task,
  }) async => client.updateTask(task: task);

  @override
  Future<void> deleteTask({
    required String projectId,
    required String taskId,
  }) async => client.deleteTask(projectId: projectId, taskId: taskId);

  @override
  Future<List<TMUser>> fetchUsers({
    String? searchQuery,
    int limit = 50,
  }) async => client.fetchUsers(searchQuery: searchQuery, limit: limit);

  @override
  Future<List<TMUser>> fetchAllUsers() async => client.fetchAllUsers();

  @override
  Future<List<TMUser>> fetchUsersByIds({
    required List<String> usersIds,
  }) async => client.fetchUsersByIds(usersIds: usersIds);
}
