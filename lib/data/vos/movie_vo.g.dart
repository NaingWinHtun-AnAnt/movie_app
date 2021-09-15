// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_vo.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class MovieVOAdapter extends TypeAdapter<MovieVO> {
  @override
  final int typeId = 7;

  @override
  MovieVO read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return MovieVO(
      adult: fields[0] as bool?,
      backDropPath: fields[1] as String?,
      belongsToCollection: fields[2] as CollectionVO?,
      budget: fields[3] as double?,
      genres: (fields[4] as List?)?.cast<GenreVO>(),
      homepage: fields[5] as String?,
      genreIds: (fields[6] as List?)?.cast<int>(),
      id: fields[7] as int,
      imdbId: fields[8] as String?,
      originalLanguage: fields[9] as String?,
      originalTitle: fields[10] as String?,
      overView: fields[11] as String?,
      popularity: fields[12] as double?,
      posterPath: fields[13] as String?,
      productionCompanies: (fields[14] as List?)?.cast<ProductionCompanyVO>(),
      productionCountries: (fields[15] as List?)?.cast<ProductionCountryVO>(),
      revenue: fields[16] as double?,
      runtime: fields[17] as int?,
      releaseDate: fields[18] as String?,
      spokenLanguages: (fields[19] as List?)?.cast<SpokenLanguageVO>(),
      status: fields[20] as String?,
      tagLine: fields[21] as String?,
      title: fields[22] as String?,
      video: fields[23] as bool?,
      voteAverage: fields[24] as double?,
      voteCount: fields[25] as int?,
      isNowPlaying: fields[26] as bool,
      isPopular: fields[28] as bool,
      isTopRated: fields[27] as bool,
    );
  }

  @override
  void write(BinaryWriter writer, MovieVO obj) {
    writer
      ..writeByte(29)
      ..writeByte(0)
      ..write(obj.adult)
      ..writeByte(1)
      ..write(obj.backDropPath)
      ..writeByte(2)
      ..write(obj.belongsToCollection)
      ..writeByte(3)
      ..write(obj.budget)
      ..writeByte(4)
      ..write(obj.genres)
      ..writeByte(5)
      ..write(obj.homepage)
      ..writeByte(6)
      ..write(obj.genreIds)
      ..writeByte(7)
      ..write(obj.id)
      ..writeByte(8)
      ..write(obj.imdbId)
      ..writeByte(9)
      ..write(obj.originalLanguage)
      ..writeByte(10)
      ..write(obj.originalTitle)
      ..writeByte(11)
      ..write(obj.overView)
      ..writeByte(12)
      ..write(obj.popularity)
      ..writeByte(13)
      ..write(obj.posterPath)
      ..writeByte(14)
      ..write(obj.productionCompanies)
      ..writeByte(15)
      ..write(obj.productionCountries)
      ..writeByte(16)
      ..write(obj.revenue)
      ..writeByte(17)
      ..write(obj.runtime)
      ..writeByte(18)
      ..write(obj.releaseDate)
      ..writeByte(19)
      ..write(obj.spokenLanguages)
      ..writeByte(20)
      ..write(obj.status)
      ..writeByte(21)
      ..write(obj.tagLine)
      ..writeByte(22)
      ..write(obj.title)
      ..writeByte(23)
      ..write(obj.video)
      ..writeByte(24)
      ..write(obj.voteAverage)
      ..writeByte(25)
      ..write(obj.voteCount)
      ..writeByte(26)
      ..write(obj.isNowPlaying)
      ..writeByte(27)
      ..write(obj.isTopRated)
      ..writeByte(28)
      ..write(obj.isPopular);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MovieVOAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MovieVO _$MovieVOFromJson(Map<String, dynamic> json) {
  return MovieVO(
    adult: json['adult'] as bool?,
    backDropPath: json['backdrop_path'] as String?,
    belongsToCollection: json['belongs_to_collection'] == null
        ? null
        : CollectionVO.fromJson(
            json['belongs_to_collection'] as Map<String, dynamic>),
    budget: (json['budget'] as num?)?.toDouble(),
    genres: (json['genres'] as List<dynamic>?)
        ?.map((e) => GenreVO.fromJson(e as Map<String, dynamic>))
        .toList(),
    homepage: json['homepage'] as String?,
    genreIds:
        (json['genre_ids'] as List<dynamic>?)?.map((e) => e as int).toList(),
    id: json['id'] as int,
    imdbId: json['imdb_id'] as String?,
    originalLanguage: json['original_language'] as String?,
    originalTitle: json['original_title'] as String?,
    overView: json['overview'] as String?,
    popularity: (json['popularity'] as num?)?.toDouble(),
    posterPath: json['poster_path'] as String?,
    productionCompanies: (json['production_companies'] as List<dynamic>?)
        ?.map((e) => ProductionCompanyVO.fromJson(e as Map<String, dynamic>))
        .toList(),
    productionCountries: (json['production_countries'] as List<dynamic>?)
        ?.map((e) => ProductionCountryVO.fromJson(e as Map<String, dynamic>))
        .toList(),
    revenue: (json['revenue'] as num?)?.toDouble(),
    runtime: json['runtime'] as int?,
    releaseDate: json['release_date'] as String?,
    spokenLanguages: (json['spoken_languages'] as List<dynamic>?)
        ?.map((e) => SpokenLanguageVO.fromJson(e as Map<String, dynamic>))
        .toList(),
    status: json['status'] as String?,
    tagLine: json['tagline'] as String?,
    title: json['title'] as String?,
    video: json['video'] as bool?,
    voteAverage: (json['vote_average'] as num?)?.toDouble(),
    voteCount: json['vote_count'] as int?,
  );
}

Map<String, dynamic> _$MovieVOToJson(MovieVO instance) => <String, dynamic>{
      'adult': instance.adult,
      'backdrop_path': instance.backDropPath,
      'belongs_to_collection': instance.belongsToCollection,
      'budget': instance.budget,
      'genres': instance.genres,
      'homepage': instance.homepage,
      'genre_ids': instance.genreIds,
      'id': instance.id,
      'imdb_id': instance.imdbId,
      'original_language': instance.originalLanguage,
      'original_title': instance.originalTitle,
      'overview': instance.overView,
      'popularity': instance.popularity,
      'poster_path': instance.posterPath,
      'production_companies': instance.productionCompanies,
      'production_countries': instance.productionCountries,
      'revenue': instance.revenue,
      'runtime': instance.runtime,
      'release_date': instance.releaseDate,
      'spoken_languages': instance.spokenLanguages,
      'status': instance.status,
      'tagline': instance.tagLine,
      'title': instance.title,
      'video': instance.video,
      'vote_average': instance.voteAverage,
      'vote_count': instance.voteCount,
    };
