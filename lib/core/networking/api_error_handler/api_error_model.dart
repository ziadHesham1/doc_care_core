import 'package:doc_care_core/core/helpers/app_extensions.dart';
import 'package:json_annotation/json_annotation.dart';

part 'api_error_model.g.dart';

@JsonSerializable()
class ApiErrorModel {
  final String? message;
  @JsonKey(name: 'data')
  final dynamic errors;
  final bool status;
  final int? code;
  ApiErrorModel({
    this.message,
    this.errors,
    this.status = false,
    this.code,
  });
  factory ApiErrorModel.fromJson(Map<String, dynamic> json) =>
      _$ApiErrorModelFromJson(json);

  Map<String, dynamic> toJson() => _$ApiErrorModelToJson(this);
  @override
  toString() {
    if (errors is Map<String, dynamic>) {
      if ((errors as Map<String, dynamic>).isNullOrEmpty) {
        return message ?? 'Unknown error occurred';
      } else {
        // Flatten the lists into a single list of strings
        var flattenedList =
            (errors as Map<String, dynamic>).values.expand((value) => value);

        // Combine all the strings into a single string with a new line as the separator
        return flattenedList.join('\n');
      }
    }
    return 'Unknown error occurred';
  }
}
