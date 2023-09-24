abstract class Output<T, E> {
  T unwrap();
  E error();
  T unwrapOrElse(Function g);
  bool hasError();
}

class Result<T, E> extends Output {
  T? data;
  E? err;

  Result({
    this.data,
    this.err,
  });

  @override
  bool hasError() {
    return err != null;
  }

  // Program may panic if value of `data` is null
  // so when using this function, ensure that value
  // return will alway be non null
  //
  @override
  T? unwrap() {
    return data;
  }

  // If not sure of whether the return
  // value will be null
  //
  @override
  unwrapOrElse(Function g) {
    g();
  }

  @override
  E? error() {
    return err;
  }
}
