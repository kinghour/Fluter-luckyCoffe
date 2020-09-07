class Data {
    String dateAdd;
    String dateUpdate;
    int id;
    bool isUse;
    String key;
    int level;
    String name;
    int paixu;
    int pid;
    String type;
    int userId;

    Data({this.dateAdd, this.dateUpdate, this.id, this.isUse, this.key, this.level, this.name, this.paixu, this.pid, this.type, this.userId});

    factory Data.fromJson(Map<String, dynamic> json) {
        return Data(
            dateAdd: json['dateAdd'], 
            dateUpdate: json['dateUpdate'], 
            id: json['id'], 
            isUse: json['isUse'], 
            key: json['key'], 
            level: json['level'], 
            name: json['name'], 
            paixu: json['paixu'], 
            pid: json['pid'], 
            type: json['type'], 
            userId: json['userId'], 
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['dateAdd'] = this.dateAdd;
        data['dateUpdate'] = this.dateUpdate;
        data['id'] = this.id;
        data['isUse'] = this.isUse;
        data['key'] = this.key;
        data['level'] = this.level;
        data['name'] = this.name;
        data['paixu'] = this.paixu;
        data['pid'] = this.pid;
        data['type'] = this.type;
        data['userId'] = this.userId;
        return data;
    }
}