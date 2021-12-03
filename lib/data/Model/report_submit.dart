class ReportSubmitModel {
  String? name;
  String? phone;
  String? email;
  String? workAddress;
  String? age;
  String? occupation;
  String? specialization;
  String? reportType;
  String? addressAssault;
  String? maritalStatus;
  String? religion;
  String? nationalism;
  String? nationality;
  String? url;
  String? description;
  String? dateAssault;

  ReportSubmitModel(
      {this.name,
      this.phone,
      this.email,
      this.workAddress,
      this.age,
      this.occupation,
      this.specialization,
      this.reportType,
      this.addressAssault,
      this.maritalStatus,
      this.religion,
      this.nationalism,
      this.nationality,
      this.url,
      this.description,
      this.dateAssault});

  ReportSubmitModel.fromJson(Map<String?, dynamic> json) {
    name = json['name'];
    phone = json['phone'];
    email = json['email'];
    workAddress = json['work_address'];
    age = json['age'];
    occupation = json['occupation'];
    specialization = json['specialization'];
    reportType = json['report_type'];
    addressAssault = json['address_assault'];
    maritalStatus = json['marital_status'];
    religion = json['religion'];
    nationalism = json['nationalism'];
    nationality = json['nationality'];
    url = json['url'];
    description = json['description'];
    dateAssault = json['date_assault'];
  }

  Map<String?, dynamic> toJson() {
    final Map<String?, dynamic> data = new Map<String?, dynamic>();
    data['name'] = this.name;
    data['phone'] = this.phone;
    data['email'] = this.email;
    data['work_address'] = this.workAddress;
    data['age'] = this.age;
    data['occupation'] = this.occupation;
    data['specialization'] = this.specialization;
    data['report_type'] = this.reportType;
    data['address_assault'] = this.addressAssault;
    data['marital_status'] = this.maritalStatus;
    data['religion'] = this.religion;
    data['nationalism'] = this.nationalism;
    data['nationality'] = this.nationality;
    data['url'] = this.url;
    data['description'] = this.description;
    data['date_assault'] = this.dateAssault;
    return data;
  }
}
