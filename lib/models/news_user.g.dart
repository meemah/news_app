// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'news_user.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class NewsUserAdapter extends TypeAdapter<NewsUser> {
  @override
  final int typeId = 1;

  @override
  NewsUser read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return NewsUser(
      email: fields[0] as String,
      userName: fields[1] as String,
      userKeyString: fields[3] as String,
      encrpytedPassword: fields[2] as String,
    );
  }

  @override
  void write(BinaryWriter writer, NewsUser obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.email)
      ..writeByte(1)
      ..write(obj.userName)
      ..writeByte(2)
      ..write(obj.encrpytedPassword)
      ..writeByte(3)
      ..write(obj.userKeyString);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is NewsUserAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
