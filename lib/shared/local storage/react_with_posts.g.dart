// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'react_with_posts.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ReactWithPostsAdapter extends TypeAdapter<ReactWithPosts> {
  @override
  final int typeId = 0;

  @override
  ReactWithPosts read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ReactWithPosts(
      upReact: fields[0] as int,
      downReact: fields[1] as int,
      postId: fields[2] as String,
    );
  }

  @override
  void write(BinaryWriter writer, ReactWithPosts obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.upReact)
      ..writeByte(1)
      ..write(obj.downReact)
      ..writeByte(2)
      ..write(obj.postId);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ReactWithPostsAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
