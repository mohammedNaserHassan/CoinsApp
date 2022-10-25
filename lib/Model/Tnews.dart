class Tnews {
  int? pkIId;
  String? sTitle;
  String? sImage;
  String? sDescription;
  bool? bEnabled;
  String? dtCreatedDate;
  String? dtModifiedDate;
  String? dtDeletedDate;

  Tnews(
      {this.pkIId,
        this.sTitle,
        this.sImage,
        this.sDescription,
        this.bEnabled,
        this.dtCreatedDate,
        this.dtModifiedDate,
        this.dtDeletedDate});

  Tnews.fromJson(Map<String, dynamic> json) {
    pkIId = json['pk_i_id'];
    sTitle = json['s_title'];
    sImage = json['s_image'];
    sDescription = json['s_description'];
    bEnabled = json['b_enabled'];
    dtCreatedDate = json['dt_created_date'];
    dtModifiedDate = json['dt_modified_date'];
    dtDeletedDate = json['dt_deleted_date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['pk_i_id'] = this.pkIId;
    data['s_title'] = this.sTitle;
    data['s_image'] = this.sImage;
    data['s_description'] = this.sDescription;
    data['b_enabled'] = this.bEnabled;
    data['dt_created_date'] = this.dtCreatedDate;
    data['dt_modified_date'] = this.dtModifiedDate;
    data['dt_deleted_date'] = this.dtDeletedDate;
    return data;
  }
}