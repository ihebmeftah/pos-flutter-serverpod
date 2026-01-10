/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: implementation_imports
// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: non_constant_identifier_names
// ignore_for_file: public_member_api_docs
// ignore_for_file: type_literal_in_constant_pattern
// ignore_for_file: use_super_parameters
// ignore_for_file: invalid_use_of_internal_member

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod_client/serverpod_client.dart' as _i1;
import '../exceptions/exceptiont_enums.dart' as _i2;

abstract class AppException
    implements _i1.SerializableException, _i1.SerializableModel {
  AppException._({
    String? message,
    required this.errorType,
  }) : message = message ?? 'Opps please try again later.';

  factory AppException({
    String? message,
    required _i2.ExceptionType errorType,
  }) = _AppExceptionImpl;

  factory AppException.fromJson(Map<String, dynamic> jsonSerialization) {
    return AppException(
      message: jsonSerialization['message'] as String?,
      errorType: _i2.ExceptionType.fromJson(
        (jsonSerialization['errorType'] as String),
      ),
    );
  }

  String message;

  _i2.ExceptionType errorType;

  /// Returns a shallow copy of this [AppException]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  AppException copyWith({
    String? message,
    _i2.ExceptionType? errorType,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'AppException',
      'message': message,
      'errorType': errorType.toJson(),
    };
  }

  @override
  String toString() {
    return 'AppException(message: $message, errorType: $errorType)';
  }
}

class _AppExceptionImpl extends AppException {
  _AppExceptionImpl({
    String? message,
    required _i2.ExceptionType errorType,
  }) : super._(
         message: message,
         errorType: errorType,
       );

  /// Returns a shallow copy of this [AppException]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  AppException copyWith({
    String? message,
    _i2.ExceptionType? errorType,
  }) {
    return AppException(
      message: message ?? this.message,
      errorType: errorType ?? this.errorType,
    );
  }
}
