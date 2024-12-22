import '../Match/i_match.dart';
import '../api_client.dart';

class MatchRepository {
  final ApiClient client;

  MatchRepository(this.client);

  updateScore(IMatch match) {
    var response = client.get("updateScore/${match.id}");
  }
}