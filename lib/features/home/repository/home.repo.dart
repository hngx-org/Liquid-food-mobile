import 'package:free_lunch_app/features/home/models/co_worker.model.dart';
import 'package:free_lunch_app/features/home/repository/irepository.home.dart';

class HomeRepository extends IRepositoryHome {
  @override
  Future<List<CoWorker>> defaultCoworkerItems() async {
    return Future.delayed(const Duration(seconds: 2), () {
      return [
        CoWorker(
            name: 'Momi',
            designation: 'Developer',
            profilePath: 'assets/images/dp.png'),
        CoWorker(
            name: 'Dilo',
            designation: 'Developer',
            profilePath: 'assets/images/dp.png'),
        CoWorker(
            name: 'Ruth',
            designation: 'Developer',
            profilePath: 'assets/images/dp.png'),
        CoWorker(
            name: 'Tevin',
            designation: 'Developer',
            profilePath: 'assets/images/dp.png'),
        CoWorker(
            name: 'Daniel',
            designation: 'Developer',
            profilePath: 'assets/images/dp.png'),
      ];
    });
  }
}
