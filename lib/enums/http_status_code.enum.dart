import 'dart:ffi';

enum HttpStatusCode {
  internalServerError,
  badRequest,
}

extension HttpStatusCodeExtension on HttpStatusCode {
  int get value {
    switch (this) {
      case HttpStatusCode.internalServerError:
        return 500;
      case HttpStatusCode.badRequest:
        return 400;
    }
  }
}
