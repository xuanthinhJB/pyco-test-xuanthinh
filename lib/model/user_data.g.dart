// GENERATED CODE - DO NOT MODIFY BY HAND

part of user_data;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<UserData> _$userDataSerializer = new _$UserDataSerializer();

class _$UserDataSerializer implements StructuredSerializer<UserData> {
  @override
  final Iterable<Type> types = const [UserData, _$UserData];
  @override
  final String wireName = 'UserData';

  @override
  Iterable<Object> serialize(Serializers serializers, UserData object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[];
    if (object.user != null) {
      result
        ..add('user')
        ..add(serializers.serialize(object.user,
            specifiedType: const FullType(User)));
    }
    if (object.seed != null) {
      result
        ..add('seed')
        ..add(serializers.serialize(object.seed,
            specifiedType: const FullType(String)));
    }
    if (object.version != null) {
      result
        ..add('version')
        ..add(serializers.serialize(object.version,
            specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  UserData deserialize(Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new UserDataBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'user':
          result.user.replace(serializers.deserialize(value,
              specifiedType: const FullType(User)) as User);
          break;
        case 'seed':
          result.seed = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'version':
          result.version = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
      }
    }

    return result.build();
  }
}

class _$UserData extends UserData {
  @override
  final User user;
  @override
  final String seed;
  @override
  final String version;

  factory _$UserData([void Function(UserDataBuilder) updates]) =>
      (new UserDataBuilder()..update(updates)).build();

  _$UserData._({this.user, this.seed, this.version}) : super._();

  @override
  UserData rebuild(void Function(UserDataBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  UserDataBuilder toBuilder() => new UserDataBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is UserData &&
        user == other.user &&
        seed == other.seed &&
        version == other.version;
  }

  @override
  int get hashCode {
    return $jf(
        $jc($jc($jc(0, user.hashCode), seed.hashCode), version.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('UserData')
          ..add('user', user)
          ..add('seed', seed)
          ..add('version', version))
        .toString();
  }
}

class UserDataBuilder implements Builder<UserData, UserDataBuilder> {
  _$UserData _$v;

  UserBuilder _user;
  UserBuilder get user => _$this._user ??= new UserBuilder();
  set user(UserBuilder user) => _$this._user = user;

  String _seed;
  String get seed => _$this._seed;
  set seed(String seed) => _$this._seed = seed;

  String _version;
  String get version => _$this._version;
  set version(String version) => _$this._version = version;

  UserDataBuilder();

  UserDataBuilder get _$this {
    if (_$v != null) {
      _user = _$v.user?.toBuilder();
      _seed = _$v.seed;
      _version = _$v.version;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(UserData other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$UserData;
  }

  @override
  void update(void Function(UserDataBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$UserData build() {
    _$UserData _$result;
    try {
      _$result = _$v ??
          new _$UserData._(user: _user?.build(), seed: seed, version: version);
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'user';
        _user?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'UserData', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
