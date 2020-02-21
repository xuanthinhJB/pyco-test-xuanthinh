// GENERATED CODE - DO NOT MODIFY BY HAND

part of name;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<Name> _$nameSerializer = new _$NameSerializer();

class _$NameSerializer implements StructuredSerializer<Name> {
  @override
  final Iterable<Type> types = const [Name, _$Name];
  @override
  final String wireName = 'Name';

  @override
  Iterable<Object> serialize(Serializers serializers, Name object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[];
    if (object.title != null) {
      result
        ..add('title')
        ..add(serializers.serialize(object.title,
            specifiedType: const FullType(String)));
    }
    if (object.first != null) {
      result
        ..add('first')
        ..add(serializers.serialize(object.first,
            specifiedType: const FullType(String)));
    }
    if (object.last != null) {
      result
        ..add('last')
        ..add(serializers.serialize(object.last,
            specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  Name deserialize(Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new NameBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'title':
          result.title = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'first':
          result.first = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'last':
          result.last = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
      }
    }

    return result.build();
  }
}

class _$Name extends Name {
  @override
  final String title;
  @override
  final String first;
  @override
  final String last;

  factory _$Name([void Function(NameBuilder) updates]) =>
      (new NameBuilder()..update(updates)).build();

  _$Name._({this.title, this.first, this.last}) : super._();

  @override
  Name rebuild(void Function(NameBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  NameBuilder toBuilder() => new NameBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Name &&
        title == other.title &&
        first == other.first &&
        last == other.last;
  }

  @override
  int get hashCode {
    return $jf($jc($jc($jc(0, title.hashCode), first.hashCode), last.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('Name')
          ..add('title', title)
          ..add('first', first)
          ..add('last', last))
        .toString();
  }
}

class NameBuilder implements Builder<Name, NameBuilder> {
  _$Name _$v;

  String _title;
  String get title => _$this._title;
  set title(String title) => _$this._title = title;

  String _first;
  String get first => _$this._first;
  set first(String first) => _$this._first = first;

  String _last;
  String get last => _$this._last;
  set last(String last) => _$this._last = last;

  NameBuilder();

  NameBuilder get _$this {
    if (_$v != null) {
      _title = _$v.title;
      _first = _$v.first;
      _last = _$v.last;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Name other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$Name;
  }

  @override
  void update(void Function(NameBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$Name build() {
    final _$result =
        _$v ?? new _$Name._(title: title, first: first, last: last);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
