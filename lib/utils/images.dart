class Images {
  static String get anggur => 'anggur@4x'.png;
  static String get apel => 'apel@4x'.png;
  static String get awan_petir => 'awan_petir'.png;
  static String get ayam => 'Ayam@4x'.png;
  static String get babi4x => 'babi@4x'.png;
  static String get bebek4x => 'bebek@4x'.png;
  static String get bekatul => 'bekatul@4x'.png;
  static String get berawan => 'berawan'.png;
  static String get bg_calcu => 'bg_calcu'.jpg;
  static String get bg_profile => 'bg_profile'.png;
  static String get buah_naga => 'buah naga@4x'.png;
  static String get cerah => 'cerah'.png;
  static String get decor_profile => 'decor_profile'.png;
  static String get delima => 'delima@4x'.png;
  static String get diskon => 'diskon'.png;
  static String get empty => 'empty'.jpg;
  static String get empty_profile => 'empty_profile'.png;
  static String get farm_02 => 'farm_02'.jpg;
  static String get ffl => 'ffl'.jpg;
  static String get gembok => 'gembok'.png;
  static String get gr_gradient => 'gr_gradient'.png;
  static String get gr_gradient2 => 'gr_gradient2'.png;
  static String get gradient => 'gradient'.jfif;
  static String get grimis => 'grimis'.png;
  static String get Group_41568 => 'Group 41568'.png;
  static String get Group_41569 => 'Group 41569'.png;
  static String get hujan => 'hujan'.png;
  static String get hujan_angin => 'hujan angin'.png;
  static String get kambing => 'kambing@4x'.png;
  static String get kambing_1 => 'kambing_1@4x'.png;
  static String get kuda => 'kuda@4x'.png;
  static String get light_rain => 'light_rain'.jfif;
  static String get logo => 'logo'.png;
  static String get logo_only => 'logo_only'.png;
  static String get photoMainprofile => 'photoMainprofile'.png;
  static String get pir => 'pir@4x'.png;
  static String get pisang => 'pisang@4x'.png;
  static String get pupuk_cair => 'pupuk cair@4x'.png;
  static String get pupuk_kandang => 'pupuk kandang@4x'.png;
  static String get pupuk_kering => 'pupuk kering@4x'.png;
  static String get right_row_icon => 'right_row_icon'.png;
  static String get rumput4x => 'rumput@4x'.png;
  static String get sapi => 'sapi@4x'.png;
  static String get semangka => 'semangka@4x'.png;
  static String get udanjilak => 'udanjilak'.png;

  static String get babi => 'babi'.icpng;
  static String get bebek => 'bebek'.icpng;
  static String get bukit => 'bukil'.icpng;
  static String get home => 'home (1)'.icpng;
  static String get jagung => 'jaggung@4x'.icpng;
  static String get konsentrat => 'konsentrat@4x'.icpng;
  static String get pakanbabi => 'pakanbabi'.icpng;
  static String get rumput => 'Rumput@4x'.icpng;
  static String get tetees2 => 'tetees2'.icpng;
  static String get cuaca01 => 'cuaca01'.png;
  static String get cuaca02 => 'cuaca02'.png;
}

extension on String {
  String get png => 'assets/images/$this.png';
  String get icpng => 'assets/images/iconpakan/$this.png';
  String get jpg => 'assets/images/$this.jpg';
  String get jfif => 'assets/images/$this.jfif';
}
