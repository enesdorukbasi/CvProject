// ignore: avoid_web_libraries_in_flutter
import 'dart:html';

import 'package:cv_project/models/github_repo_json_model.dart';
import 'package:dio/dio.dart';

class GithubRepoService {
  String yourUsername = "enesdorukbasi";

  Future<List<GithubRepoJsonModel>> getRepos() async {
    List<GithubRepoJsonModel> githubRepos = [];
    String getRepoApi = 'https://api.github.com/users/$yourUsername/repos';

    try {
      var response = await Dio().get(getRepoApi);
      if (response.statusCode == HttpStatus.ok) {
        final responseDatas = response.data as List;

        githubRepos = responseDatas
            .map((data) => GithubRepoJsonModel.fromJson(data))
            .toList();
      }
      return githubRepos;
    } catch (e) {
      return githubRepos;
    }
  }
}
