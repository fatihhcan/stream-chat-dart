class Serialization {
  static Map<String, dynamic> moveKeysToRoot(
      Map<String, dynamic> json, List<String> topLevelFields) {
    if (json == null) {
      return json;
    }
    var clone = Map<String, dynamic>.from(json);
    clone['extraData'] = Map<String, dynamic>();

    json?.keys?.forEach((key) {
      if (!topLevelFields.contains(key)) {
        clone['extraData'][key] = clone.remove(key);
      }
    });

    return clone;
  }

  static Map<String, dynamic> moveKeysToMapInPlace(
      Map<String, dynamic> intermediateMap, List<String> topLevelFields) {
    if (intermediateMap == null) {
      return intermediateMap;
    }

    var clone = Map<String, dynamic>.from(intermediateMap);
    Map<String, dynamic> extraData = clone.remove('extraData');

    extraData?.keys?.forEach((key) {
      if (!topLevelFields.contains(key)) {
        clone[key] = extraData[key];
      }
    });

    return clone;
  }
}
