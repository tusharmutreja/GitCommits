class Commits {
  String sha;
  String node_id;
  CommitsMessages commitMsg;

  Commits(String sha, String node_id, CommitsMessages commitMsg) {
    this.sha = sha;
    this.node_id = node_id;
    this.commitMsg = commitMsg;
  }

  Commits.fromJson(Map json)
      : sha = json['sha'],
        node_id = json['node_id'],
        commitMsg = CommitsMessages.fromJson(json['commit']);

  Map toJson() {
    return {'sha': sha, 'node_id': node_id};
  }
}

class CommitsMessages {
  String message;

  CommitsMessages({this.message});

  CommitsMessages.fromJson(Map json) : message = json['message'];
}
