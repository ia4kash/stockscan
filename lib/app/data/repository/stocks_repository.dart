import 'package:stockscan/app/data/models/dto/response.dart';
import 'package:stockscan/app/data/models/response/stocks_response.dart';
import 'package:stockscan/app/data/values/urls.dart';
import 'package:stockscan/base/base_repository.dart';
import 'package:stockscan/utils/helper/exception_handler.dart';

class StocksRepository extends BaseRepository {
  Future<RepoResponse<List<Stocks>>> getStocksData() async {
    var response = await controller.get(path: URLs.stocksData);

    return response is APIException
        ? RepoResponse(error: response)
        : RepoResponse(data: parseStocksResponse(response));
  }
}
