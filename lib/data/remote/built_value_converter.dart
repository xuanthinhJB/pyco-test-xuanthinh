import 'package:built_collection/built_collection.dart';
import 'package:chopper/chopper.dart';
import 'package:pyco_test_tony/data/serializers.dart';

class BuiltValueConverter extends JsonConverter {
  @override
  Request convertRequest(Request request) {
    if (request.body is List<int> || request.body is List<String>)
      return super.convertRequest(request);

    if (request.multipart)
      return super.convertRequest(request);

    if (request.body is Map)
      return super.convertRequest(request);

    return super.convertRequest(
      request.replace(
        body: serializers.serializeWith(
          serializers.serializerForType(request.body.runtimeType),
          request.body,
        ),
      ),
    );
  }

  @override
  Response<BodyType> convertResponse<BodyType, SingleItemType>(
      Response response) {
    final Response dynamicResponse = super.convertResponse(response);
    final BodyType customBody =
        _convertToCustomerObject<SingleItemType>(dynamicResponse.body);
    return dynamicResponse.replace<BodyType>(body: customBody);
  }

  dynamic _convertToCustomerObject<SingleItemType>(dynamic element) {
    if (element is SingleItemType) return element;
    if (element is List)
      return _deserializeListOf<SingleItemType>(element);
    else
      return _deserialize<SingleItemType>(element);
  }

  BuiltList<SingleItemType> _deserializeListOf<SingleItemType>(
      List dynamicList) {
    return BuiltList<SingleItemType>(
      dynamicList.map((e) => _deserialize<SingleItemType>(e)),
    );
  }

  SingleItemType _deserialize<SingleItemType>(Map<String, dynamic> value) {
    return serializers.deserializeWith(
        serializers.serializerForType(SingleItemType), value);
  }
}
