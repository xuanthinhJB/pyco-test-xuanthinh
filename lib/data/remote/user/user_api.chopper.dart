// GENERATED CODE - DO NOT MODIFY BY HAND

part of user_api;

// **************************************************************************
// ChopperGenerator
// **************************************************************************

class _$UserAPI extends UserAPI {
  _$UserAPI([ChopperClient client]) {
    if (client == null) return;
    this.client = client;
  }

  @override
  final definitionType = UserAPI;

  @override
  Future<Response<UserDataRes>> getUserInfo() {
    final $url = 'https://randomuser.me/api/0.4/?randomapi/';
    final $request = Request('GET', $url, client.baseUrl);
    return client.send<UserDataRes, UserDataRes>($request);
  }
}
