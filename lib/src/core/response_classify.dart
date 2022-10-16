class ResponseClassify<T> {
  Status status;
  T? data;
  String? error;

  ResponseClassify.loading() : status = Status.loading;

  ResponseClassify.completed(this.data) : status = Status.completed;

  ResponseClassify.error(this.error) : status = Status.error;

  ResponseClassify.initials() : status = Status.initials;

  @override
  String toString() {
    return "Status : $status \n Message :  \n Data : $data error : $error";
  }
}

enum Status { loading, completed, error, initials }
