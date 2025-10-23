// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'metric.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetMetricCollection on Isar {
  IsarCollection<Metric> get metrics => this.collection();
}

const MetricSchema = CollectionSchema(
  name: r'Metric',
  id: -2918904481911474793,
  properties: {
    r'milestoneNames': PropertySchema(
      id: 0,
      name: r'milestoneNames',
      type: IsarType.stringList,
    ),
    r'milestonesDone': PropertySchema(
      id: 1,
      name: r'milestonesDone',
      type: IsarType.boolList,
    ),
    r'motivation': PropertySchema(
      id: 2,
      name: r'motivation',
      type: IsarType.longList,
    ),
    r'name': PropertySchema(
      id: 3,
      name: r'name',
      type: IsarType.string,
    ),
    r'progressDone': PropertySchema(
      id: 4,
      name: r'progressDone',
      type: IsarType.boolList,
    ),
    r'progressTimeInterval': PropertySchema(
      id: 5,
      name: r'progressTimeInterval',
      type: IsarType.byte,
      enumMap: _MetricprogressTimeIntervalEnumValueMap,
    ),
    r'progressValues': PropertySchema(
      id: 6,
      name: r'progressValues',
      type: IsarType.stringList,
    ),
    r'relevance': PropertySchema(
      id: 7,
      name: r'relevance',
      type: IsarType.longList,
    ),
    r'results': PropertySchema(
      id: 8,
      name: r'results',
      type: IsarType.stringList,
    ),
    r'setbackNames': PropertySchema(
      id: 9,
      name: r'setbackNames',
      type: IsarType.stringList,
    ),
    r'setbackTimeIntervalStages': PropertySchema(
      id: 10,
      name: r'setbackTimeIntervalStages',
      type: IsarType.longList,
    ),
    r'storyId': PropertySchema(
      id: 11,
      name: r'storyId',
      type: IsarType.long,
    ),
    r'target': PropertySchema(
      id: 12,
      name: r'target',
      type: IsarType.string,
    )
  },
  estimateSize: _metricEstimateSize,
  serialize: _metricSerialize,
  deserialize: _metricDeserialize,
  deserializeProp: _metricDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _metricGetId,
  getLinks: _metricGetLinks,
  attach: _metricAttach,
  version: '3.1.0',
);

int _metricEstimateSize(
  Metric object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final list = object.milestoneNames;
    if (list != null) {
      bytesCount += 3 + list.length * 3;
      {
        for (var i = 0; i < list.length; i++) {
          final value = list[i];
          bytesCount += value.length * 3;
        }
      }
    }
  }
  {
    final value = object.milestonesDone;
    if (value != null) {
      bytesCount += 3 + value.length;
    }
  }
  {
    final value = object.motivation;
    if (value != null) {
      bytesCount += 3 + value.length * 8;
    }
  }
  {
    final value = object.name;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.progressDone;
    if (value != null) {
      bytesCount += 3 + value.length;
    }
  }
  {
    final list = object.progressValues;
    if (list != null) {
      bytesCount += 3 + list.length * 3;
      {
        for (var i = 0; i < list.length; i++) {
          final value = list[i];
          bytesCount += value.length * 3;
        }
      }
    }
  }
  {
    final value = object.relevance;
    if (value != null) {
      bytesCount += 3 + value.length * 8;
    }
  }
  {
    final list = object.results;
    if (list != null) {
      bytesCount += 3 + list.length * 3;
      {
        for (var i = 0; i < list.length; i++) {
          final value = list[i];
          bytesCount += value.length * 3;
        }
      }
    }
  }
  {
    final list = object.setbackNames;
    if (list != null) {
      bytesCount += 3 + list.length * 3;
      {
        for (var i = 0; i < list.length; i++) {
          final value = list[i];
          bytesCount += value.length * 3;
        }
      }
    }
  }
  {
    final value = object.setbackTimeIntervalStages;
    if (value != null) {
      bytesCount += 3 + value.length * 8;
    }
  }
  {
    final value = object.target;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  return bytesCount;
}

void _metricSerialize(
  Metric object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeStringList(offsets[0], object.milestoneNames);
  writer.writeBoolList(offsets[1], object.milestonesDone);
  writer.writeLongList(offsets[2], object.motivation);
  writer.writeString(offsets[3], object.name);
  writer.writeBoolList(offsets[4], object.progressDone);
  writer.writeByte(offsets[5], object.progressTimeInterval.index);
  writer.writeStringList(offsets[6], object.progressValues);
  writer.writeLongList(offsets[7], object.relevance);
  writer.writeStringList(offsets[8], object.results);
  writer.writeStringList(offsets[9], object.setbackNames);
  writer.writeLongList(offsets[10], object.setbackTimeIntervalStages);
  writer.writeLong(offsets[11], object.storyId);
  writer.writeString(offsets[12], object.target);
}

Metric _metricDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = Metric();
  object.id = id;
  object.milestoneNames = reader.readStringList(offsets[0]);
  object.milestonesDone = reader.readBoolList(offsets[1]);
  object.motivation = reader.readLongList(offsets[2]);
  object.name = reader.readStringOrNull(offsets[3]);
  object.progressDone = reader.readBoolList(offsets[4]);
  object.progressTimeInterval = _MetricprogressTimeIntervalValueEnumMap[
          reader.readByteOrNull(offsets[5])] ??
      TimeInterval.daily;
  object.progressValues = reader.readStringList(offsets[6]);
  object.relevance = reader.readLongList(offsets[7]);
  object.results = reader.readStringList(offsets[8]);
  object.setbackNames = reader.readStringList(offsets[9]);
  object.setbackTimeIntervalStages = reader.readLongList(offsets[10]);
  object.storyId = reader.readLongOrNull(offsets[11]);
  object.target = reader.readStringOrNull(offsets[12]);
  return object;
}

P _metricDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readStringList(offset)) as P;
    case 1:
      return (reader.readBoolList(offset)) as P;
    case 2:
      return (reader.readLongList(offset)) as P;
    case 3:
      return (reader.readStringOrNull(offset)) as P;
    case 4:
      return (reader.readBoolList(offset)) as P;
    case 5:
      return (_MetricprogressTimeIntervalValueEnumMap[
              reader.readByteOrNull(offset)] ??
          TimeInterval.daily) as P;
    case 6:
      return (reader.readStringList(offset)) as P;
    case 7:
      return (reader.readLongList(offset)) as P;
    case 8:
      return (reader.readStringList(offset)) as P;
    case 9:
      return (reader.readStringList(offset)) as P;
    case 10:
      return (reader.readLongList(offset)) as P;
    case 11:
      return (reader.readLongOrNull(offset)) as P;
    case 12:
      return (reader.readStringOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

const _MetricprogressTimeIntervalEnumValueMap = {
  'daily': 0,
  'weekly': 1,
  'monthly': 2,
};
const _MetricprogressTimeIntervalValueEnumMap = {
  0: TimeInterval.daily,
  1: TimeInterval.weekly,
  2: TimeInterval.monthly,
};

Id _metricGetId(Metric object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _metricGetLinks(Metric object) {
  return [];
}

void _metricAttach(IsarCollection<dynamic> col, Id id, Metric object) {
  object.id = id;
}

extension MetricQueryWhereSort on QueryBuilder<Metric, Metric, QWhere> {
  QueryBuilder<Metric, Metric, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension MetricQueryWhere on QueryBuilder<Metric, Metric, QWhereClause> {
  QueryBuilder<Metric, Metric, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<Metric, Metric, QAfterWhereClause> idNotEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            )
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            );
      } else {
        return query
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            )
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            );
      }
    });
  }

  QueryBuilder<Metric, Metric, QAfterWhereClause> idGreaterThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<Metric, Metric, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<Metric, Metric, QAfterWhereClause> idBetween(
    Id lowerId,
    Id upperId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: lowerId,
        includeLower: includeLower,
        upper: upperId,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension MetricQueryFilter on QueryBuilder<Metric, Metric, QFilterCondition> {
  QueryBuilder<Metric, Metric, QAfterFilterCondition> idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<Metric, Metric, QAfterFilterCondition> idGreaterThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<Metric, Metric, QAfterFilterCondition> idLessThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<Metric, Metric, QAfterFilterCondition> idBetween(
    Id lower,
    Id upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'id',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Metric, Metric, QAfterFilterCondition> milestoneNamesIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'milestoneNames',
      ));
    });
  }

  QueryBuilder<Metric, Metric, QAfterFilterCondition>
      milestoneNamesIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'milestoneNames',
      ));
    });
  }

  QueryBuilder<Metric, Metric, QAfterFilterCondition>
      milestoneNamesElementEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'milestoneNames',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Metric, Metric, QAfterFilterCondition>
      milestoneNamesElementGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'milestoneNames',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Metric, Metric, QAfterFilterCondition>
      milestoneNamesElementLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'milestoneNames',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Metric, Metric, QAfterFilterCondition>
      milestoneNamesElementBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'milestoneNames',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Metric, Metric, QAfterFilterCondition>
      milestoneNamesElementStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'milestoneNames',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Metric, Metric, QAfterFilterCondition>
      milestoneNamesElementEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'milestoneNames',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Metric, Metric, QAfterFilterCondition>
      milestoneNamesElementContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'milestoneNames',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Metric, Metric, QAfterFilterCondition>
      milestoneNamesElementMatches(String pattern,
          {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'milestoneNames',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Metric, Metric, QAfterFilterCondition>
      milestoneNamesElementIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'milestoneNames',
        value: '',
      ));
    });
  }

  QueryBuilder<Metric, Metric, QAfterFilterCondition>
      milestoneNamesElementIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'milestoneNames',
        value: '',
      ));
    });
  }

  QueryBuilder<Metric, Metric, QAfterFilterCondition>
      milestoneNamesLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'milestoneNames',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<Metric, Metric, QAfterFilterCondition> milestoneNamesIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'milestoneNames',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<Metric, Metric, QAfterFilterCondition>
      milestoneNamesIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'milestoneNames',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<Metric, Metric, QAfterFilterCondition>
      milestoneNamesLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'milestoneNames',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<Metric, Metric, QAfterFilterCondition>
      milestoneNamesLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'milestoneNames',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<Metric, Metric, QAfterFilterCondition>
      milestoneNamesLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'milestoneNames',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<Metric, Metric, QAfterFilterCondition> milestonesDoneIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'milestonesDone',
      ));
    });
  }

  QueryBuilder<Metric, Metric, QAfterFilterCondition>
      milestonesDoneIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'milestonesDone',
      ));
    });
  }

  QueryBuilder<Metric, Metric, QAfterFilterCondition>
      milestonesDoneElementEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'milestonesDone',
        value: value,
      ));
    });
  }

  QueryBuilder<Metric, Metric, QAfterFilterCondition>
      milestonesDoneLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'milestonesDone',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<Metric, Metric, QAfterFilterCondition> milestonesDoneIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'milestonesDone',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<Metric, Metric, QAfterFilterCondition>
      milestonesDoneIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'milestonesDone',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<Metric, Metric, QAfterFilterCondition>
      milestonesDoneLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'milestonesDone',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<Metric, Metric, QAfterFilterCondition>
      milestonesDoneLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'milestonesDone',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<Metric, Metric, QAfterFilterCondition>
      milestonesDoneLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'milestonesDone',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<Metric, Metric, QAfterFilterCondition> motivationIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'motivation',
      ));
    });
  }

  QueryBuilder<Metric, Metric, QAfterFilterCondition> motivationIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'motivation',
      ));
    });
  }

  QueryBuilder<Metric, Metric, QAfterFilterCondition> motivationElementEqualTo(
      int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'motivation',
        value: value,
      ));
    });
  }

  QueryBuilder<Metric, Metric, QAfterFilterCondition>
      motivationElementGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'motivation',
        value: value,
      ));
    });
  }

  QueryBuilder<Metric, Metric, QAfterFilterCondition> motivationElementLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'motivation',
        value: value,
      ));
    });
  }

  QueryBuilder<Metric, Metric, QAfterFilterCondition> motivationElementBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'motivation',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Metric, Metric, QAfterFilterCondition> motivationLengthEqualTo(
      int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'motivation',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<Metric, Metric, QAfterFilterCondition> motivationIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'motivation',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<Metric, Metric, QAfterFilterCondition> motivationIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'motivation',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<Metric, Metric, QAfterFilterCondition> motivationLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'motivation',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<Metric, Metric, QAfterFilterCondition>
      motivationLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'motivation',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<Metric, Metric, QAfterFilterCondition> motivationLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'motivation',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<Metric, Metric, QAfterFilterCondition> nameIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'name',
      ));
    });
  }

  QueryBuilder<Metric, Metric, QAfterFilterCondition> nameIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'name',
      ));
    });
  }

  QueryBuilder<Metric, Metric, QAfterFilterCondition> nameEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Metric, Metric, QAfterFilterCondition> nameGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Metric, Metric, QAfterFilterCondition> nameLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Metric, Metric, QAfterFilterCondition> nameBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'name',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Metric, Metric, QAfterFilterCondition> nameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Metric, Metric, QAfterFilterCondition> nameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Metric, Metric, QAfterFilterCondition> nameContains(String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Metric, Metric, QAfterFilterCondition> nameMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'name',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Metric, Metric, QAfterFilterCondition> nameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'name',
        value: '',
      ));
    });
  }

  QueryBuilder<Metric, Metric, QAfterFilterCondition> nameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'name',
        value: '',
      ));
    });
  }

  QueryBuilder<Metric, Metric, QAfterFilterCondition> progressDoneIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'progressDone',
      ));
    });
  }

  QueryBuilder<Metric, Metric, QAfterFilterCondition> progressDoneIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'progressDone',
      ));
    });
  }

  QueryBuilder<Metric, Metric, QAfterFilterCondition>
      progressDoneElementEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'progressDone',
        value: value,
      ));
    });
  }

  QueryBuilder<Metric, Metric, QAfterFilterCondition> progressDoneLengthEqualTo(
      int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'progressDone',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<Metric, Metric, QAfterFilterCondition> progressDoneIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'progressDone',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<Metric, Metric, QAfterFilterCondition> progressDoneIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'progressDone',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<Metric, Metric, QAfterFilterCondition>
      progressDoneLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'progressDone',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<Metric, Metric, QAfterFilterCondition>
      progressDoneLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'progressDone',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<Metric, Metric, QAfterFilterCondition> progressDoneLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'progressDone',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<Metric, Metric, QAfterFilterCondition>
      progressTimeIntervalEqualTo(TimeInterval value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'progressTimeInterval',
        value: value,
      ));
    });
  }

  QueryBuilder<Metric, Metric, QAfterFilterCondition>
      progressTimeIntervalGreaterThan(
    TimeInterval value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'progressTimeInterval',
        value: value,
      ));
    });
  }

  QueryBuilder<Metric, Metric, QAfterFilterCondition>
      progressTimeIntervalLessThan(
    TimeInterval value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'progressTimeInterval',
        value: value,
      ));
    });
  }

  QueryBuilder<Metric, Metric, QAfterFilterCondition>
      progressTimeIntervalBetween(
    TimeInterval lower,
    TimeInterval upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'progressTimeInterval',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Metric, Metric, QAfterFilterCondition> progressValuesIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'progressValues',
      ));
    });
  }

  QueryBuilder<Metric, Metric, QAfterFilterCondition>
      progressValuesIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'progressValues',
      ));
    });
  }

  QueryBuilder<Metric, Metric, QAfterFilterCondition>
      progressValuesElementEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'progressValues',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Metric, Metric, QAfterFilterCondition>
      progressValuesElementGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'progressValues',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Metric, Metric, QAfterFilterCondition>
      progressValuesElementLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'progressValues',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Metric, Metric, QAfterFilterCondition>
      progressValuesElementBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'progressValues',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Metric, Metric, QAfterFilterCondition>
      progressValuesElementStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'progressValues',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Metric, Metric, QAfterFilterCondition>
      progressValuesElementEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'progressValues',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Metric, Metric, QAfterFilterCondition>
      progressValuesElementContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'progressValues',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Metric, Metric, QAfterFilterCondition>
      progressValuesElementMatches(String pattern,
          {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'progressValues',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Metric, Metric, QAfterFilterCondition>
      progressValuesElementIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'progressValues',
        value: '',
      ));
    });
  }

  QueryBuilder<Metric, Metric, QAfterFilterCondition>
      progressValuesElementIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'progressValues',
        value: '',
      ));
    });
  }

  QueryBuilder<Metric, Metric, QAfterFilterCondition>
      progressValuesLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'progressValues',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<Metric, Metric, QAfterFilterCondition> progressValuesIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'progressValues',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<Metric, Metric, QAfterFilterCondition>
      progressValuesIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'progressValues',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<Metric, Metric, QAfterFilterCondition>
      progressValuesLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'progressValues',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<Metric, Metric, QAfterFilterCondition>
      progressValuesLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'progressValues',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<Metric, Metric, QAfterFilterCondition>
      progressValuesLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'progressValues',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<Metric, Metric, QAfterFilterCondition> relevanceIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'relevance',
      ));
    });
  }

  QueryBuilder<Metric, Metric, QAfterFilterCondition> relevanceIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'relevance',
      ));
    });
  }

  QueryBuilder<Metric, Metric, QAfterFilterCondition> relevanceElementEqualTo(
      int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'relevance',
        value: value,
      ));
    });
  }

  QueryBuilder<Metric, Metric, QAfterFilterCondition>
      relevanceElementGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'relevance',
        value: value,
      ));
    });
  }

  QueryBuilder<Metric, Metric, QAfterFilterCondition> relevanceElementLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'relevance',
        value: value,
      ));
    });
  }

  QueryBuilder<Metric, Metric, QAfterFilterCondition> relevanceElementBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'relevance',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Metric, Metric, QAfterFilterCondition> relevanceLengthEqualTo(
      int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'relevance',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<Metric, Metric, QAfterFilterCondition> relevanceIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'relevance',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<Metric, Metric, QAfterFilterCondition> relevanceIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'relevance',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<Metric, Metric, QAfterFilterCondition> relevanceLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'relevance',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<Metric, Metric, QAfterFilterCondition>
      relevanceLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'relevance',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<Metric, Metric, QAfterFilterCondition> relevanceLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'relevance',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<Metric, Metric, QAfterFilterCondition> resultsIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'results',
      ));
    });
  }

  QueryBuilder<Metric, Metric, QAfterFilterCondition> resultsIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'results',
      ));
    });
  }

  QueryBuilder<Metric, Metric, QAfterFilterCondition> resultsElementEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'results',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Metric, Metric, QAfterFilterCondition> resultsElementGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'results',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Metric, Metric, QAfterFilterCondition> resultsElementLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'results',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Metric, Metric, QAfterFilterCondition> resultsElementBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'results',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Metric, Metric, QAfterFilterCondition> resultsElementStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'results',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Metric, Metric, QAfterFilterCondition> resultsElementEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'results',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Metric, Metric, QAfterFilterCondition> resultsElementContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'results',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Metric, Metric, QAfterFilterCondition> resultsElementMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'results',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Metric, Metric, QAfterFilterCondition> resultsElementIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'results',
        value: '',
      ));
    });
  }

  QueryBuilder<Metric, Metric, QAfterFilterCondition>
      resultsElementIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'results',
        value: '',
      ));
    });
  }

  QueryBuilder<Metric, Metric, QAfterFilterCondition> resultsLengthEqualTo(
      int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'results',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<Metric, Metric, QAfterFilterCondition> resultsIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'results',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<Metric, Metric, QAfterFilterCondition> resultsIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'results',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<Metric, Metric, QAfterFilterCondition> resultsLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'results',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<Metric, Metric, QAfterFilterCondition> resultsLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'results',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<Metric, Metric, QAfterFilterCondition> resultsLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'results',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<Metric, Metric, QAfterFilterCondition> setbackNamesIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'setbackNames',
      ));
    });
  }

  QueryBuilder<Metric, Metric, QAfterFilterCondition> setbackNamesIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'setbackNames',
      ));
    });
  }

  QueryBuilder<Metric, Metric, QAfterFilterCondition>
      setbackNamesElementEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'setbackNames',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Metric, Metric, QAfterFilterCondition>
      setbackNamesElementGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'setbackNames',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Metric, Metric, QAfterFilterCondition>
      setbackNamesElementLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'setbackNames',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Metric, Metric, QAfterFilterCondition>
      setbackNamesElementBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'setbackNames',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Metric, Metric, QAfterFilterCondition>
      setbackNamesElementStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'setbackNames',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Metric, Metric, QAfterFilterCondition>
      setbackNamesElementEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'setbackNames',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Metric, Metric, QAfterFilterCondition>
      setbackNamesElementContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'setbackNames',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Metric, Metric, QAfterFilterCondition>
      setbackNamesElementMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'setbackNames',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Metric, Metric, QAfterFilterCondition>
      setbackNamesElementIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'setbackNames',
        value: '',
      ));
    });
  }

  QueryBuilder<Metric, Metric, QAfterFilterCondition>
      setbackNamesElementIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'setbackNames',
        value: '',
      ));
    });
  }

  QueryBuilder<Metric, Metric, QAfterFilterCondition> setbackNamesLengthEqualTo(
      int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'setbackNames',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<Metric, Metric, QAfterFilterCondition> setbackNamesIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'setbackNames',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<Metric, Metric, QAfterFilterCondition> setbackNamesIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'setbackNames',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<Metric, Metric, QAfterFilterCondition>
      setbackNamesLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'setbackNames',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<Metric, Metric, QAfterFilterCondition>
      setbackNamesLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'setbackNames',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<Metric, Metric, QAfterFilterCondition> setbackNamesLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'setbackNames',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<Metric, Metric, QAfterFilterCondition>
      setbackTimeIntervalStagesIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'setbackTimeIntervalStages',
      ));
    });
  }

  QueryBuilder<Metric, Metric, QAfterFilterCondition>
      setbackTimeIntervalStagesIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'setbackTimeIntervalStages',
      ));
    });
  }

  QueryBuilder<Metric, Metric, QAfterFilterCondition>
      setbackTimeIntervalStagesElementEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'setbackTimeIntervalStages',
        value: value,
      ));
    });
  }

  QueryBuilder<Metric, Metric, QAfterFilterCondition>
      setbackTimeIntervalStagesElementGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'setbackTimeIntervalStages',
        value: value,
      ));
    });
  }

  QueryBuilder<Metric, Metric, QAfterFilterCondition>
      setbackTimeIntervalStagesElementLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'setbackTimeIntervalStages',
        value: value,
      ));
    });
  }

  QueryBuilder<Metric, Metric, QAfterFilterCondition>
      setbackTimeIntervalStagesElementBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'setbackTimeIntervalStages',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Metric, Metric, QAfterFilterCondition>
      setbackTimeIntervalStagesLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'setbackTimeIntervalStages',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<Metric, Metric, QAfterFilterCondition>
      setbackTimeIntervalStagesIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'setbackTimeIntervalStages',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<Metric, Metric, QAfterFilterCondition>
      setbackTimeIntervalStagesIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'setbackTimeIntervalStages',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<Metric, Metric, QAfterFilterCondition>
      setbackTimeIntervalStagesLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'setbackTimeIntervalStages',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<Metric, Metric, QAfterFilterCondition>
      setbackTimeIntervalStagesLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'setbackTimeIntervalStages',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<Metric, Metric, QAfterFilterCondition>
      setbackTimeIntervalStagesLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'setbackTimeIntervalStages',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<Metric, Metric, QAfterFilterCondition> storyIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'storyId',
      ));
    });
  }

  QueryBuilder<Metric, Metric, QAfterFilterCondition> storyIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'storyId',
      ));
    });
  }

  QueryBuilder<Metric, Metric, QAfterFilterCondition> storyIdEqualTo(
      int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'storyId',
        value: value,
      ));
    });
  }

  QueryBuilder<Metric, Metric, QAfterFilterCondition> storyIdGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'storyId',
        value: value,
      ));
    });
  }

  QueryBuilder<Metric, Metric, QAfterFilterCondition> storyIdLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'storyId',
        value: value,
      ));
    });
  }

  QueryBuilder<Metric, Metric, QAfterFilterCondition> storyIdBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'storyId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Metric, Metric, QAfterFilterCondition> targetIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'target',
      ));
    });
  }

  QueryBuilder<Metric, Metric, QAfterFilterCondition> targetIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'target',
      ));
    });
  }

  QueryBuilder<Metric, Metric, QAfterFilterCondition> targetEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'target',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Metric, Metric, QAfterFilterCondition> targetGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'target',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Metric, Metric, QAfterFilterCondition> targetLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'target',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Metric, Metric, QAfterFilterCondition> targetBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'target',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Metric, Metric, QAfterFilterCondition> targetStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'target',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Metric, Metric, QAfterFilterCondition> targetEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'target',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Metric, Metric, QAfterFilterCondition> targetContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'target',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Metric, Metric, QAfterFilterCondition> targetMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'target',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Metric, Metric, QAfterFilterCondition> targetIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'target',
        value: '',
      ));
    });
  }

  QueryBuilder<Metric, Metric, QAfterFilterCondition> targetIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'target',
        value: '',
      ));
    });
  }
}

extension MetricQueryObject on QueryBuilder<Metric, Metric, QFilterCondition> {}

extension MetricQueryLinks on QueryBuilder<Metric, Metric, QFilterCondition> {}

extension MetricQuerySortBy on QueryBuilder<Metric, Metric, QSortBy> {
  QueryBuilder<Metric, Metric, QAfterSortBy> sortByName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.asc);
    });
  }

  QueryBuilder<Metric, Metric, QAfterSortBy> sortByNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.desc);
    });
  }

  QueryBuilder<Metric, Metric, QAfterSortBy> sortByProgressTimeInterval() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'progressTimeInterval', Sort.asc);
    });
  }

  QueryBuilder<Metric, Metric, QAfterSortBy> sortByProgressTimeIntervalDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'progressTimeInterval', Sort.desc);
    });
  }

  QueryBuilder<Metric, Metric, QAfterSortBy> sortByStoryId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'storyId', Sort.asc);
    });
  }

  QueryBuilder<Metric, Metric, QAfterSortBy> sortByStoryIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'storyId', Sort.desc);
    });
  }

  QueryBuilder<Metric, Metric, QAfterSortBy> sortByTarget() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'target', Sort.asc);
    });
  }

  QueryBuilder<Metric, Metric, QAfterSortBy> sortByTargetDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'target', Sort.desc);
    });
  }
}

extension MetricQuerySortThenBy on QueryBuilder<Metric, Metric, QSortThenBy> {
  QueryBuilder<Metric, Metric, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<Metric, Metric, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<Metric, Metric, QAfterSortBy> thenByName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.asc);
    });
  }

  QueryBuilder<Metric, Metric, QAfterSortBy> thenByNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.desc);
    });
  }

  QueryBuilder<Metric, Metric, QAfterSortBy> thenByProgressTimeInterval() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'progressTimeInterval', Sort.asc);
    });
  }

  QueryBuilder<Metric, Metric, QAfterSortBy> thenByProgressTimeIntervalDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'progressTimeInterval', Sort.desc);
    });
  }

  QueryBuilder<Metric, Metric, QAfterSortBy> thenByStoryId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'storyId', Sort.asc);
    });
  }

  QueryBuilder<Metric, Metric, QAfterSortBy> thenByStoryIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'storyId', Sort.desc);
    });
  }

  QueryBuilder<Metric, Metric, QAfterSortBy> thenByTarget() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'target', Sort.asc);
    });
  }

  QueryBuilder<Metric, Metric, QAfterSortBy> thenByTargetDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'target', Sort.desc);
    });
  }
}

extension MetricQueryWhereDistinct on QueryBuilder<Metric, Metric, QDistinct> {
  QueryBuilder<Metric, Metric, QDistinct> distinctByMilestoneNames() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'milestoneNames');
    });
  }

  QueryBuilder<Metric, Metric, QDistinct> distinctByMilestonesDone() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'milestonesDone');
    });
  }

  QueryBuilder<Metric, Metric, QDistinct> distinctByMotivation() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'motivation');
    });
  }

  QueryBuilder<Metric, Metric, QDistinct> distinctByName(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'name', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Metric, Metric, QDistinct> distinctByProgressDone() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'progressDone');
    });
  }

  QueryBuilder<Metric, Metric, QDistinct> distinctByProgressTimeInterval() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'progressTimeInterval');
    });
  }

  QueryBuilder<Metric, Metric, QDistinct> distinctByProgressValues() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'progressValues');
    });
  }

  QueryBuilder<Metric, Metric, QDistinct> distinctByRelevance() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'relevance');
    });
  }

  QueryBuilder<Metric, Metric, QDistinct> distinctByResults() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'results');
    });
  }

  QueryBuilder<Metric, Metric, QDistinct> distinctBySetbackNames() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'setbackNames');
    });
  }

  QueryBuilder<Metric, Metric, QDistinct>
      distinctBySetbackTimeIntervalStages() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'setbackTimeIntervalStages');
    });
  }

  QueryBuilder<Metric, Metric, QDistinct> distinctByStoryId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'storyId');
    });
  }

  QueryBuilder<Metric, Metric, QDistinct> distinctByTarget(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'target', caseSensitive: caseSensitive);
    });
  }
}

extension MetricQueryProperty on QueryBuilder<Metric, Metric, QQueryProperty> {
  QueryBuilder<Metric, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<Metric, List<String>?, QQueryOperations>
      milestoneNamesProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'milestoneNames');
    });
  }

  QueryBuilder<Metric, List<bool>?, QQueryOperations> milestonesDoneProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'milestonesDone');
    });
  }

  QueryBuilder<Metric, List<int>?, QQueryOperations> motivationProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'motivation');
    });
  }

  QueryBuilder<Metric, String?, QQueryOperations> nameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'name');
    });
  }

  QueryBuilder<Metric, List<bool>?, QQueryOperations> progressDoneProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'progressDone');
    });
  }

  QueryBuilder<Metric, TimeInterval, QQueryOperations>
      progressTimeIntervalProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'progressTimeInterval');
    });
  }

  QueryBuilder<Metric, List<String>?, QQueryOperations>
      progressValuesProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'progressValues');
    });
  }

  QueryBuilder<Metric, List<int>?, QQueryOperations> relevanceProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'relevance');
    });
  }

  QueryBuilder<Metric, List<String>?, QQueryOperations> resultsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'results');
    });
  }

  QueryBuilder<Metric, List<String>?, QQueryOperations> setbackNamesProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'setbackNames');
    });
  }

  QueryBuilder<Metric, List<int>?, QQueryOperations>
      setbackTimeIntervalStagesProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'setbackTimeIntervalStages');
    });
  }

  QueryBuilder<Metric, int?, QQueryOperations> storyIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'storyId');
    });
  }

  QueryBuilder<Metric, String?, QQueryOperations> targetProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'target');
    });
  }
}
