class TasksModel{
  Response? response;
  String? status;
  String? message;

  TasksModel.fromJson(Map<String, dynamic> json){
    response = Response.fromJson(json['response']);
    status = json['status'];
    message = json['message'];
  }
}

class Response{
  int? current_page;
  List<Task>? tasks = [];
  String? first_page_url;
  int? from;
  int? last_page;
  String? last_page_url;
  List<Links>? links = [];
  String? next_page_url;
  String? path;
  int? per_page;
  String? prev_page_url;
  int? to;
  int? total;

  Response.fromJson(Map<String, dynamic> json){
    current_page = json['current_page'];
    json['data'].forEach((element){
      tasks?.add(Task.fromJson(element));
    });
    from = json['from'];
    last_page = json['last_page'];
    last_page_url = json['last_page_url'];
    json['links'].forEach((element){
      links?.add(Links.fromJson(element));
    });
    next_page_url = json['next_page_url'];
    path = json['path'];
    per_page = json['per_page'];
    prev_page_url = json['prev_page_url'];
    to = json['to'];
    from = json['from'];
  }
}

class Task{
  int? id;
  int? user_id;
  String? title;
  String? description;
  String? image;
  String? start_date;
  String? end_date;
  String? status;

  Task.fromJson(Map<String, dynamic> json){
    id = json['id'];
    user_id = json['user_id'];
    title = json['title'];
    description = json['description'];
    image = json['image'];
    start_date = json['start_date'];
    end_date = json['end_date'];
    status = json['status'];
  }
}

class Links{
  String? url;
  String? label;
  bool? active;

  Links.fromJson(Map<String, dynamic> json){
    url = json['url'];
    label = json['label'];
    active = json['active'];
  }
}