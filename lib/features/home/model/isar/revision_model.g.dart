// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'revision_model.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetRevisionModelCollection on Isar {
  IsarCollection<RevisionModel> get revisionModels => this.collection();
}

const RevisionModelSchema = CollectionSchema(
  name: r'RevisionModel',
  id: -7353059834818220587,
  properties: {
    r'dateCreation': PropertySchema(
      id: 0,
      name: r'dateCreation',
      type: IsarType.dateTime,
    ),
    r'dateModification': PropertySchema(
      id: 1,
      name: r'dateModification',
      type: IsarType.dateTime,
    ),
    r'description': PropertySchema(
      id: 2,
      name: r'description',
      type: IsarType.string,
    ),
    r'group': PropertySchema(id: 3, name: r'group', type: IsarType.string),
    r'rating': PropertySchema(
      id: 4,
      name: r'rating',
      type: IsarType.int,
      enumMap: _RevisionModelratingEnumValueMap,
    ),
    r'revisionDate': PropertySchema(
      id: 5,
      name: r'revisionDate',
      type: IsarType.dateTime,
    ),
    r'title': PropertySchema(id: 6, name: r'title', type: IsarType.string),
  },

  estimateSize: _revisionModelEstimateSize,
  serialize: _revisionModelSerialize,
  deserialize: _revisionModelDeserialize,
  deserializeProp: _revisionModelDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {},

  getId: _revisionModelGetId,
  getLinks: _revisionModelGetLinks,
  attach: _revisionModelAttach,
  version: '3.3.0',
);

int _revisionModelEstimateSize(
  RevisionModel object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.description;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.group;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  bytesCount += 3 + object.title.length * 3;
  return bytesCount;
}

void _revisionModelSerialize(
  RevisionModel object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeDateTime(offsets[0], object.dateCreation);
  writer.writeDateTime(offsets[1], object.dateModification);
  writer.writeString(offsets[2], object.description);
  writer.writeString(offsets[3], object.group);
  writer.writeInt(offsets[4], object.rating?.index);
  writer.writeDateTime(offsets[5], object.revisionDate);
  writer.writeString(offsets[6], object.title);
}

RevisionModel _revisionModelDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = RevisionModel();
  object.dateCreation = reader.readDateTime(offsets[0]);
  object.dateModification = reader.readDateTime(offsets[1]);
  object.description = reader.readStringOrNull(offsets[2]);
  object.group = reader.readStringOrNull(offsets[3]);
  object.id = id;
  object.rating =
      _RevisionModelratingValueEnumMap[reader.readIntOrNull(offsets[4])];
  object.revisionDate = reader.readDateTimeOrNull(offsets[5]);
  object.title = reader.readString(offsets[6]);
  return object;
}

P _revisionModelDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readDateTime(offset)) as P;
    case 1:
      return (reader.readDateTime(offset)) as P;
    case 2:
      return (reader.readStringOrNull(offset)) as P;
    case 3:
      return (reader.readStringOrNull(offset)) as P;
    case 4:
      return (_RevisionModelratingValueEnumMap[reader.readIntOrNull(offset)])
          as P;
    case 5:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 6:
      return (reader.readString(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

const _RevisionModelratingEnumValueMap = {
  'poor': 0,
  'fair': 1,
  'good': 2,
  'excellent': 3,
};
const _RevisionModelratingValueEnumMap = {
  0: RevisionRatingType.poor,
  1: RevisionRatingType.fair,
  2: RevisionRatingType.good,
  3: RevisionRatingType.excellent,
};

Id _revisionModelGetId(RevisionModel object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _revisionModelGetLinks(RevisionModel object) {
  return [];
}

void _revisionModelAttach(
  IsarCollection<dynamic> col,
  Id id,
  RevisionModel object,
) {
  object.id = id;
}

extension RevisionModelQueryWhereSort
    on QueryBuilder<RevisionModel, RevisionModel, QWhere> {
  QueryBuilder<RevisionModel, RevisionModel, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension RevisionModelQueryWhere
    on QueryBuilder<RevisionModel, RevisionModel, QWhereClause> {
  QueryBuilder<RevisionModel, RevisionModel, QAfterWhereClause> idEqualTo(
    Id id,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(lower: id, upper: id));
    });
  }

  QueryBuilder<RevisionModel, RevisionModel, QAfterWhereClause> idNotEqualTo(
    Id id,
  ) {
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

  QueryBuilder<RevisionModel, RevisionModel, QAfterWhereClause> idGreaterThan(
    Id id, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<RevisionModel, RevisionModel, QAfterWhereClause> idLessThan(
    Id id, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<RevisionModel, RevisionModel, QAfterWhereClause> idBetween(
    Id lowerId,
    Id upperId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.between(
          lower: lowerId,
          includeLower: includeLower,
          upper: upperId,
          includeUpper: includeUpper,
        ),
      );
    });
  }
}

extension RevisionModelQueryFilter
    on QueryBuilder<RevisionModel, RevisionModel, QFilterCondition> {
  QueryBuilder<RevisionModel, RevisionModel, QAfterFilterCondition>
  dateCreationEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'dateCreation', value: value),
      );
    });
  }

  QueryBuilder<RevisionModel, RevisionModel, QAfterFilterCondition>
  dateCreationGreaterThan(DateTime value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'dateCreation',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<RevisionModel, RevisionModel, QAfterFilterCondition>
  dateCreationLessThan(DateTime value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'dateCreation',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<RevisionModel, RevisionModel, QAfterFilterCondition>
  dateCreationBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'dateCreation',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<RevisionModel, RevisionModel, QAfterFilterCondition>
  dateModificationEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'dateModification', value: value),
      );
    });
  }

  QueryBuilder<RevisionModel, RevisionModel, QAfterFilterCondition>
  dateModificationGreaterThan(DateTime value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'dateModification',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<RevisionModel, RevisionModel, QAfterFilterCondition>
  dateModificationLessThan(DateTime value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'dateModification',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<RevisionModel, RevisionModel, QAfterFilterCondition>
  dateModificationBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'dateModification',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<RevisionModel, RevisionModel, QAfterFilterCondition>
  descriptionIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'description'),
      );
    });
  }

  QueryBuilder<RevisionModel, RevisionModel, QAfterFilterCondition>
  descriptionIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'description'),
      );
    });
  }

  QueryBuilder<RevisionModel, RevisionModel, QAfterFilterCondition>
  descriptionEqualTo(String? value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'description',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<RevisionModel, RevisionModel, QAfterFilterCondition>
  descriptionGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'description',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<RevisionModel, RevisionModel, QAfterFilterCondition>
  descriptionLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'description',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<RevisionModel, RevisionModel, QAfterFilterCondition>
  descriptionBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'description',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<RevisionModel, RevisionModel, QAfterFilterCondition>
  descriptionStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'description',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<RevisionModel, RevisionModel, QAfterFilterCondition>
  descriptionEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'description',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<RevisionModel, RevisionModel, QAfterFilterCondition>
  descriptionContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'description',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<RevisionModel, RevisionModel, QAfterFilterCondition>
  descriptionMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'description',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<RevisionModel, RevisionModel, QAfterFilterCondition>
  descriptionIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'description', value: ''),
      );
    });
  }

  QueryBuilder<RevisionModel, RevisionModel, QAfterFilterCondition>
  descriptionIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'description', value: ''),
      );
    });
  }

  QueryBuilder<RevisionModel, RevisionModel, QAfterFilterCondition>
  groupIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'group'),
      );
    });
  }

  QueryBuilder<RevisionModel, RevisionModel, QAfterFilterCondition>
  groupIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'group'),
      );
    });
  }

  QueryBuilder<RevisionModel, RevisionModel, QAfterFilterCondition>
  groupEqualTo(String? value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'group',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<RevisionModel, RevisionModel, QAfterFilterCondition>
  groupGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'group',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<RevisionModel, RevisionModel, QAfterFilterCondition>
  groupLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'group',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<RevisionModel, RevisionModel, QAfterFilterCondition>
  groupBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'group',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<RevisionModel, RevisionModel, QAfterFilterCondition>
  groupStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'group',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<RevisionModel, RevisionModel, QAfterFilterCondition>
  groupEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'group',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<RevisionModel, RevisionModel, QAfterFilterCondition>
  groupContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'group',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<RevisionModel, RevisionModel, QAfterFilterCondition>
  groupMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'group',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<RevisionModel, RevisionModel, QAfterFilterCondition>
  groupIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'group', value: ''),
      );
    });
  }

  QueryBuilder<RevisionModel, RevisionModel, QAfterFilterCondition>
  groupIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'group', value: ''),
      );
    });
  }

  QueryBuilder<RevisionModel, RevisionModel, QAfterFilterCondition> idEqualTo(
    Id value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'id', value: value),
      );
    });
  }

  QueryBuilder<RevisionModel, RevisionModel, QAfterFilterCondition>
  idGreaterThan(Id value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'id',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<RevisionModel, RevisionModel, QAfterFilterCondition> idLessThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'id',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<RevisionModel, RevisionModel, QAfterFilterCondition> idBetween(
    Id lower,
    Id upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'id',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<RevisionModel, RevisionModel, QAfterFilterCondition>
  ratingIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'rating'),
      );
    });
  }

  QueryBuilder<RevisionModel, RevisionModel, QAfterFilterCondition>
  ratingIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'rating'),
      );
    });
  }

  QueryBuilder<RevisionModel, RevisionModel, QAfterFilterCondition>
  ratingEqualTo(RevisionRatingType? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'rating', value: value),
      );
    });
  }

  QueryBuilder<RevisionModel, RevisionModel, QAfterFilterCondition>
  ratingGreaterThan(RevisionRatingType? value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'rating',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<RevisionModel, RevisionModel, QAfterFilterCondition>
  ratingLessThan(RevisionRatingType? value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'rating',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<RevisionModel, RevisionModel, QAfterFilterCondition>
  ratingBetween(
    RevisionRatingType? lower,
    RevisionRatingType? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'rating',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<RevisionModel, RevisionModel, QAfterFilterCondition>
  revisionDateIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'revisionDate'),
      );
    });
  }

  QueryBuilder<RevisionModel, RevisionModel, QAfterFilterCondition>
  revisionDateIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'revisionDate'),
      );
    });
  }

  QueryBuilder<RevisionModel, RevisionModel, QAfterFilterCondition>
  revisionDateEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'revisionDate', value: value),
      );
    });
  }

  QueryBuilder<RevisionModel, RevisionModel, QAfterFilterCondition>
  revisionDateGreaterThan(DateTime? value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'revisionDate',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<RevisionModel, RevisionModel, QAfterFilterCondition>
  revisionDateLessThan(DateTime? value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'revisionDate',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<RevisionModel, RevisionModel, QAfterFilterCondition>
  revisionDateBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'revisionDate',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<RevisionModel, RevisionModel, QAfterFilterCondition>
  titleEqualTo(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'title',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<RevisionModel, RevisionModel, QAfterFilterCondition>
  titleGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'title',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<RevisionModel, RevisionModel, QAfterFilterCondition>
  titleLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'title',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<RevisionModel, RevisionModel, QAfterFilterCondition>
  titleBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'title',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<RevisionModel, RevisionModel, QAfterFilterCondition>
  titleStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'title',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<RevisionModel, RevisionModel, QAfterFilterCondition>
  titleEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'title',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<RevisionModel, RevisionModel, QAfterFilterCondition>
  titleContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'title',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<RevisionModel, RevisionModel, QAfterFilterCondition>
  titleMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'title',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<RevisionModel, RevisionModel, QAfterFilterCondition>
  titleIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'title', value: ''),
      );
    });
  }

  QueryBuilder<RevisionModel, RevisionModel, QAfterFilterCondition>
  titleIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'title', value: ''),
      );
    });
  }
}

extension RevisionModelQueryObject
    on QueryBuilder<RevisionModel, RevisionModel, QFilterCondition> {}

extension RevisionModelQueryLinks
    on QueryBuilder<RevisionModel, RevisionModel, QFilterCondition> {}

extension RevisionModelQuerySortBy
    on QueryBuilder<RevisionModel, RevisionModel, QSortBy> {
  QueryBuilder<RevisionModel, RevisionModel, QAfterSortBy>
  sortByDateCreation() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dateCreation', Sort.asc);
    });
  }

  QueryBuilder<RevisionModel, RevisionModel, QAfterSortBy>
  sortByDateCreationDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dateCreation', Sort.desc);
    });
  }

  QueryBuilder<RevisionModel, RevisionModel, QAfterSortBy>
  sortByDateModification() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dateModification', Sort.asc);
    });
  }

  QueryBuilder<RevisionModel, RevisionModel, QAfterSortBy>
  sortByDateModificationDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dateModification', Sort.desc);
    });
  }

  QueryBuilder<RevisionModel, RevisionModel, QAfterSortBy> sortByDescription() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'description', Sort.asc);
    });
  }

  QueryBuilder<RevisionModel, RevisionModel, QAfterSortBy>
  sortByDescriptionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'description', Sort.desc);
    });
  }

  QueryBuilder<RevisionModel, RevisionModel, QAfterSortBy> sortByGroup() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'group', Sort.asc);
    });
  }

  QueryBuilder<RevisionModel, RevisionModel, QAfterSortBy> sortByGroupDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'group', Sort.desc);
    });
  }

  QueryBuilder<RevisionModel, RevisionModel, QAfterSortBy> sortByRating() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'rating', Sort.asc);
    });
  }

  QueryBuilder<RevisionModel, RevisionModel, QAfterSortBy> sortByRatingDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'rating', Sort.desc);
    });
  }

  QueryBuilder<RevisionModel, RevisionModel, QAfterSortBy>
  sortByRevisionDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'revisionDate', Sort.asc);
    });
  }

  QueryBuilder<RevisionModel, RevisionModel, QAfterSortBy>
  sortByRevisionDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'revisionDate', Sort.desc);
    });
  }

  QueryBuilder<RevisionModel, RevisionModel, QAfterSortBy> sortByTitle() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'title', Sort.asc);
    });
  }

  QueryBuilder<RevisionModel, RevisionModel, QAfterSortBy> sortByTitleDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'title', Sort.desc);
    });
  }
}

extension RevisionModelQuerySortThenBy
    on QueryBuilder<RevisionModel, RevisionModel, QSortThenBy> {
  QueryBuilder<RevisionModel, RevisionModel, QAfterSortBy>
  thenByDateCreation() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dateCreation', Sort.asc);
    });
  }

  QueryBuilder<RevisionModel, RevisionModel, QAfterSortBy>
  thenByDateCreationDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dateCreation', Sort.desc);
    });
  }

  QueryBuilder<RevisionModel, RevisionModel, QAfterSortBy>
  thenByDateModification() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dateModification', Sort.asc);
    });
  }

  QueryBuilder<RevisionModel, RevisionModel, QAfterSortBy>
  thenByDateModificationDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dateModification', Sort.desc);
    });
  }

  QueryBuilder<RevisionModel, RevisionModel, QAfterSortBy> thenByDescription() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'description', Sort.asc);
    });
  }

  QueryBuilder<RevisionModel, RevisionModel, QAfterSortBy>
  thenByDescriptionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'description', Sort.desc);
    });
  }

  QueryBuilder<RevisionModel, RevisionModel, QAfterSortBy> thenByGroup() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'group', Sort.asc);
    });
  }

  QueryBuilder<RevisionModel, RevisionModel, QAfterSortBy> thenByGroupDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'group', Sort.desc);
    });
  }

  QueryBuilder<RevisionModel, RevisionModel, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<RevisionModel, RevisionModel, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<RevisionModel, RevisionModel, QAfterSortBy> thenByRating() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'rating', Sort.asc);
    });
  }

  QueryBuilder<RevisionModel, RevisionModel, QAfterSortBy> thenByRatingDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'rating', Sort.desc);
    });
  }

  QueryBuilder<RevisionModel, RevisionModel, QAfterSortBy>
  thenByRevisionDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'revisionDate', Sort.asc);
    });
  }

  QueryBuilder<RevisionModel, RevisionModel, QAfterSortBy>
  thenByRevisionDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'revisionDate', Sort.desc);
    });
  }

  QueryBuilder<RevisionModel, RevisionModel, QAfterSortBy> thenByTitle() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'title', Sort.asc);
    });
  }

  QueryBuilder<RevisionModel, RevisionModel, QAfterSortBy> thenByTitleDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'title', Sort.desc);
    });
  }
}

extension RevisionModelQueryWhereDistinct
    on QueryBuilder<RevisionModel, RevisionModel, QDistinct> {
  QueryBuilder<RevisionModel, RevisionModel, QDistinct>
  distinctByDateCreation() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'dateCreation');
    });
  }

  QueryBuilder<RevisionModel, RevisionModel, QDistinct>
  distinctByDateModification() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'dateModification');
    });
  }

  QueryBuilder<RevisionModel, RevisionModel, QDistinct> distinctByDescription({
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'description', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<RevisionModel, RevisionModel, QDistinct> distinctByGroup({
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'group', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<RevisionModel, RevisionModel, QDistinct> distinctByRating() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'rating');
    });
  }

  QueryBuilder<RevisionModel, RevisionModel, QDistinct>
  distinctByRevisionDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'revisionDate');
    });
  }

  QueryBuilder<RevisionModel, RevisionModel, QDistinct> distinctByTitle({
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'title', caseSensitive: caseSensitive);
    });
  }
}

extension RevisionModelQueryProperty
    on QueryBuilder<RevisionModel, RevisionModel, QQueryProperty> {
  QueryBuilder<RevisionModel, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<RevisionModel, DateTime, QQueryOperations>
  dateCreationProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'dateCreation');
    });
  }

  QueryBuilder<RevisionModel, DateTime, QQueryOperations>
  dateModificationProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'dateModification');
    });
  }

  QueryBuilder<RevisionModel, String?, QQueryOperations> descriptionProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'description');
    });
  }

  QueryBuilder<RevisionModel, String?, QQueryOperations> groupProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'group');
    });
  }

  QueryBuilder<RevisionModel, RevisionRatingType?, QQueryOperations>
  ratingProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'rating');
    });
  }

  QueryBuilder<RevisionModel, DateTime?, QQueryOperations>
  revisionDateProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'revisionDate');
    });
  }

  QueryBuilder<RevisionModel, String, QQueryOperations> titleProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'title');
    });
  }
}
