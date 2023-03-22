import 'package:hive/hive.dart';

part 'request_types.g.dart';

@HiveType(typeId: 4)
enum RequestType {
  @HiveField(0)
  underReviewRequest,
  @HiveField(1)
  inExecutionRequest,
  @HiveField(2)
  completedRequest,
  @HiveField(3)
  draftRequest
}
