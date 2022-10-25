class TAlert {
  int? pkIId;
  String? sCode;
  String? sName;
  String? dValue;
  String? iType;
  String? sIcon;
  bool? bEnabled;
  String? dtCreatedDate;
  String? dtModifiedDate;
  String? dtDeletedDate;

  TAlert(
      {this.pkIId,
        this.sCode,
        this.sName,
        this.dValue,
        this.iType,
        this.sIcon,
        this.bEnabled,
        this.dtCreatedDate,
        this.dtModifiedDate,
        this.dtDeletedDate});

  TAlert.fromJson(Map<String, dynamic> json) {
    pkIId = json['pk_i_id'];
    sCode = json['s_code'];
    sName = json['s_name'];
    dValue = json['d_value'];
    iType = json['i_type'];
    sIcon = json['s_icon'];
    bEnabled = json['b_enabled'];
    dtCreatedDate = json['dt_created_date'];
    dtModifiedDate = json['dt_modified_date'];
    dtDeletedDate = json['dt_deleted_date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['pk_i_id'] = this.pkIId;
    data['s_code'] = this.sCode;
    data['s_name'] = this.sName;
    data['d_value'] = this.dValue;
    data['i_type'] = this.iType;
    data['s_icon'] = this.sIcon;
    data['b_enabled'] = this.bEnabled;
    data['dt_created_date'] = this.dtCreatedDate;
    data['dt_modified_date'] = this.dtModifiedDate;
    data['dt_deleted_date'] = this.dtDeletedDate;
    return data;
  }
}