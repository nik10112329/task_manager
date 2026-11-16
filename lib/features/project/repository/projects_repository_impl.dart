import 'package:task_manager/app/auth/model/user_model.dart';
import 'package:task_manager/app/clients/google_client/firebase_client.dart';
import 'package:task_manager/features/home/models/task/task.dart';
import 'package:task_manager/features/project/models/project/project.dart';
import 'package:task_manager/features/project/repository/projects_repository.dart';
import 'package:task_manager/features/tags/models/tag/tag.dart';

class ProjectsRepositoryImpl implements ProjectsRepository {
  ProjectsRepositoryImpl({required this.client});

  final FirebaseClient client;

  @override
  Future<void> updateProject(TMProject project) async =>
      client.updateProject(project);

  @override
  Future<String?> addTask({
    required String projectId,
    required TMTask task,
  }) async => client.addTask(task: task);

  @override
  Future<void> updateTask({
    required String projectId,
    required TMTask task,
  }) async => client.updateTask(task: task);

  @override
  Future<List<TMTask>> fetchTasks(List<String> projectIds) async =>
      client.fetchTasks(projectIds: projectIds);

  @override
  Future<List<TMTask>> fetchUserTasks(String userId) async =>
      client.fetchUserTasks(userId);

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

  @override
  Future<List<TMTaskTag>?> fetchAllTags() async => client.fetchTags();

  @override
  Future<String?> addTag({
    required TMTaskTag tag,
    required String projectId,
  }) async => client.addTag(tag: tag, projectId: projectId);

  @override
  Future<List<TMTaskTag>?> fetchTagsFromProject(List<String> tagsIds) =>
      client.fetchProjectTags(tagsIds);
}
