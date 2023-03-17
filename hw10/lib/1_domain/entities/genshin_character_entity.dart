class GenshinCharacterEntity {
  GenshinCharacterEntity(this.id, this.name, this.title, this.vision,
      this.weapon, this.nation, this.description, this.rarity);

  final String id, name, title, vision, weapon, nation, description;
  final int rarity;

  factory GenshinCharacterEntity.fromJson(Map<String, dynamic> json) {
    return GenshinCharacterEntity(
        json['id'],
        json['name'] ?? '',
        json['title'] ?? '',
        json['vision'] ?? '',
        json['weapon'] ?? '',
        json['nation'] ?? '',
        json['description' ?? ''],
        json['rarity'] ?? 0);
  }
}
