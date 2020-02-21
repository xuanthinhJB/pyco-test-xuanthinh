// GENERATED CODE - DO NOT MODIFY BY HAND

part of location;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<Location> _$locationSerializer = new _$LocationSerializer();

class _$LocationSerializer implements StructuredSerializer<Location> {
  @override
  final Iterable<Type> types = const [Location, _$Location];
  @override
  final String wireName = 'Location';

  @override
  Iterable<Object> serialize(Serializers serializers, Location object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[];
    if (object.street != null) {
      result
        ..add('street')
        ..add(serializers.serialize(object.street,
            specifiedType: const FullType(String)));
    }
    if (object.city != null) {
      result
        ..add('city')
        ..add(serializers.serialize(object.city,
            specifiedType: const FullType(String)));
    }
    if (object.state != null) {
      result
        ..add('state')
        ..add(serializers.serialize(object.state,
            specifiedType: const FullType(String)));
    }
    if (object.zip != null) {
      result
        ..add('zip')
        ..add(serializers.serialize(object.zip,
            specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  Location deserialize(Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new LocationBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'street':
          result.street = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'city':
          result.city = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'state':
          result.state = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'zip':
          result.zip = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
      }
    }

    return result.build();
  }
}

class _$Location extends Location {
  @override
  final String street;
  @override
  final String city;
  @override
  final String state;
  @override
  final String zip;

  factory _$Location([void Function(LocationBuilder) updates]) =>
      (new LocationBuilder()..update(updates)).build();

  _$Location._({this.street, this.city, this.state, this.zip}) : super._();

  @override
  Location rebuild(void Function(LocationBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  LocationBuilder toBuilder() => new LocationBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Location &&
        street == other.street &&
        city == other.city &&
        state == other.state &&
        zip == other.zip;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc($jc($jc(0, street.hashCode), city.hashCode), state.hashCode),
        zip.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('Location')
          ..add('street', street)
          ..add('city', city)
          ..add('state', state)
          ..add('zip', zip))
        .toString();
  }
}

class LocationBuilder implements Builder<Location, LocationBuilder> {
  _$Location _$v;

  String _street;
  String get street => _$this._street;
  set street(String street) => _$this._street = street;

  String _city;
  String get city => _$this._city;
  set city(String city) => _$this._city = city;

  String _state;
  String get state => _$this._state;
  set state(String state) => _$this._state = state;

  String _zip;
  String get zip => _$this._zip;
  set zip(String zip) => _$this._zip = zip;

  LocationBuilder();

  LocationBuilder get _$this {
    if (_$v != null) {
      _street = _$v.street;
      _city = _$v.city;
      _state = _$v.state;
      _zip = _$v.zip;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Location other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$Location;
  }

  @override
  void update(void Function(LocationBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$Location build() {
    final _$result = _$v ??
        new _$Location._(street: street, city: city, state: state, zip: zip);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
