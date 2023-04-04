// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profil_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ProfilModelAdapter extends TypeAdapter<ProfilModel> {
  @override
  final int typeId = 1;

  @override
  ProfilModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ProfilModel(
      login: fields[1] as String,
      id: fields[2] as int,
      nodeId: fields[3] as String,
      avatarUrl: fields[4] as String,
      gravatarId: fields[5] as String,
      url: fields[6] as String,
      htmlUrl: fields[7] as String,
      followersUrl: fields[8] as String,
      followingUrl: fields[9] as String,
      gistsUrl: fields[10] as String,
      starredUrl: fields[11] as String,
      subscriptionsUrl: fields[12] as String,
      organizationsUrl: fields[13] as String,
      reposUrl: fields[14] as String,
      eventsUrl: fields[15] as String,
      receivedEventsUrl: fields[16] as String,
      type: fields[17] as String,
      siteAdmin: fields[18] as bool,
      name: fields[19] as String,
      company: fields[20] as String,
      blog: fields[21] as String,
      location: fields[22] as String,
      email: fields[23] as dynamic,
      hireable: fields[24] as dynamic,
      bio: fields[25] as String,
      twitterUsername: fields[26] as dynamic,
      publicRepos: fields[27] as int,
      publicGists: fields[28] as int,
      followers: fields[29] as int,
      following: fields[30] as int,
      createdAt: fields[31] as DateTime,
      updatedAt: fields[32] as DateTime,
    );
  }

  @override
  void write(BinaryWriter writer, ProfilModel obj) {
    writer
      ..writeByte(32)
      ..writeByte(1)
      ..write(obj.login)
      ..writeByte(2)
      ..write(obj.id)
      ..writeByte(3)
      ..write(obj.nodeId)
      ..writeByte(4)
      ..write(obj.avatarUrl)
      ..writeByte(5)
      ..write(obj.gravatarId)
      ..writeByte(6)
      ..write(obj.url)
      ..writeByte(7)
      ..write(obj.htmlUrl)
      ..writeByte(8)
      ..write(obj.followersUrl)
      ..writeByte(9)
      ..write(obj.followingUrl)
      ..writeByte(10)
      ..write(obj.gistsUrl)
      ..writeByte(11)
      ..write(obj.starredUrl)
      ..writeByte(12)
      ..write(obj.subscriptionsUrl)
      ..writeByte(13)
      ..write(obj.organizationsUrl)
      ..writeByte(14)
      ..write(obj.reposUrl)
      ..writeByte(15)
      ..write(obj.eventsUrl)
      ..writeByte(16)
      ..write(obj.receivedEventsUrl)
      ..writeByte(17)
      ..write(obj.type)
      ..writeByte(18)
      ..write(obj.siteAdmin)
      ..writeByte(19)
      ..write(obj.name)
      ..writeByte(20)
      ..write(obj.company)
      ..writeByte(21)
      ..write(obj.blog)
      ..writeByte(22)
      ..write(obj.location)
      ..writeByte(23)
      ..write(obj.email)
      ..writeByte(24)
      ..write(obj.hireable)
      ..writeByte(25)
      ..write(obj.bio)
      ..writeByte(26)
      ..write(obj.twitterUsername)
      ..writeByte(27)
      ..write(obj.publicRepos)
      ..writeByte(28)
      ..write(obj.publicGists)
      ..writeByte(29)
      ..write(obj.followers)
      ..writeByte(30)
      ..write(obj.following)
      ..writeByte(31)
      ..write(obj.createdAt)
      ..writeByte(32)
      ..write(obj.updatedAt);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ProfilModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
