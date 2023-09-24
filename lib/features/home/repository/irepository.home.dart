import 'package:free_lunch_app/features/home/models/co_worker.model.dart';

abstract class IRepositoryHome {
  Future<List<CoWorker>> defaultCoworkerItems();
}
