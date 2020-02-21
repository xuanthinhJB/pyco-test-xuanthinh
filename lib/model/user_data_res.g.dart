// GENERATED CODE - DO NOT MODIFY BY HAND

part of user_data_res;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<UserDataRes> _$userDataResSerializer = new _$UserDataResSerializer();

class _$UserDataResSerializer implements StructuredSerializer<UserDataRes> {
  @override
  final Iterable<Type> types = const [UserDataRes, _$UserDataRes];
  @override
  final String wireName = 'UserDataRes';

  @override
  Iterable<Object> serialize(Serializers serializers, UserDataRes object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[];
    if (object.results != null) {
      result
        ..add('results')
        ..add(serializers.serialize(object.results,
            specifiedType:
                const FullType(BuiltList, const [const FullType(UserData)])));
    }
    return result;
  }

  @override
  UserDataRes deserialize(Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new UserDataResBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'results':
          result.results.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(UserData)]))
              as BuiltList<dynamic>);
          break;
      }
    }

    return result.build();
  }
}

class _$UserDataRes extends UserDataRes {
  @override
  final BuiltList<UserData> results;

  factory _$UserDataRes([void Function(UserDataResBuilder) updates]) =>
      (new UserDataResBuilder()..update(updates)).build();

  _$UserDataRes._({this.results}) : super._();

  @override
  UserDataRes rebuild(void Function(UserDataResBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  UserDataResBuilder toBuilder() => new UserDataResBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is UserDataRes && results == other.results;
  }

  @override
  int get hashCode {
    return $jf($jc(0, results.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('UserDataRes')..add('results', results))
        .toString();
  }
}

class UserDataResBuilder implements Builder<UserDataRes, UserDataResBuilder> {
  _$UserDataRes _$v;

  ListBuilder<UserData> _results;
  ListBuilder<UserData> get results =>
      _$this._results ??= new ListBuilder<UserData>();
  set results(ListBuilder<UserData> results) => _$this._results = results;

  UserDataResBuilder();

  UserDataResBuilder get _$this {
    if (_$v != null) {
      _results = _$v.results?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(UserDataRes other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$UserDataRes;
  }

  @override
  void update(void Function(UserDataResBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$UserDataRes build() {
    _$UserDataRes _$result;
    try {
      _$result = _$v ?? new _$UserDataRes._(results: _results?.build());
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'results';
        _results?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'UserDataRes', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
