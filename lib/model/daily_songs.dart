class DailySongsData {
  int code;
  Data data;

  DailySongsData({this.code, this.data});

  DailySongsData.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['code'] = this.code;
    if (this.data != null) {
      data['data'] = this.data.toJson();
    }
    return data;
  }
}

class Data {
  List<DailySongs> dailySongs;

  Data({this.dailySongs});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['dailySongs'] != null) {
      dailySongs = new List<DailySongs>();
      json['dailySongs'].forEach((v) {
        dailySongs.add(new DailySongs.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.dailySongs != null) {
      data['dailySongs'] = this.dailySongs.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class DailySongs {
  String name;
  int id;
  int pst;
  int t;
  List<Ar> ar;
  List<String> alia;
  int pop;
  int st;
  String rt;
  int fee;
  int v;
  Null crbt;
  String cf;
  Al al;
  int dt;
  H h;
  H m;
  H l;
  Null a;
  String cd;
  int no;
  Null rtUrl;
  int ftype;
  List<Null> rtUrls;
  int djId;
  int copyright;
  int sId;
  int mark;
  int originCoverType;
  OriginSongSimpleData originSongSimpleData;
  int single;
  Null noCopyrightRcmd;
  int rtype;
  Null rurl;
  int mst;
  int cp;
  int mv;
  int publishTime;
  String reason;
  Privilege privilege;
  String alg;

  DailySongs(
      {this.name,
        this.id,
        this.pst,
        this.t,
        this.ar,
        this.alia,
        this.pop,
        this.st,
        this.rt,
        this.fee,
        this.v,
        this.crbt,
        this.cf,
        this.al,
        this.dt,
        this.h,
        this.m,
        this.l,
        this.a,
        this.cd,
        this.no,
        this.rtUrl,
        this.ftype,
        this.rtUrls,
        this.djId,
        this.copyright,
        this.sId,
        this.mark,
        this.originCoverType,
        this.originSongSimpleData,
        this.single,
        this.noCopyrightRcmd,
        this.rtype,
        this.rurl,
        this.mst,
        this.cp,
        this.mv,
        this.publishTime,
        this.reason,
        this.privilege,
        this.alg});

  DailySongs.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    id = json['id'];
    pst = json['pst'];
    t = json['t'];
    if (json['ar'] != null) {
      ar = new List<Ar>();
      json['ar'].forEach((v) {
        ar.add(new Ar.fromJson(v));
      });
    }
    alia = json['alia'].cast<String>();
    pop = json['pop'];
    st = json['st'];
    rt = json['rt'];
    fee = json['fee'];
    v = json['v'];
    crbt = json['crbt'];
    cf = json['cf'];
    al = json['al'] != null ? new Al.fromJson(json['al']) : null;
    dt = json['dt'];
    h = json['h'] != null ? new H.fromJson(json['h']) : null;
    m = json['m'] != null ? new H.fromJson(json['m']) : null;
    l = json['l'] != null ? new H.fromJson(json['l']) : null;
    a = json['a'];
    cd = json['cd'];
    no = json['no'];
    rtUrl = json['rtUrl'];
    ftype = json['ftype'];
    djId = json['djId'];
    copyright = json['copyright'];
    sId = json['s_id'];
    mark = json['mark'];
    originCoverType = json['originCoverType'];
    originSongSimpleData = json['originSongSimpleData'] != null
        ? new OriginSongSimpleData.fromJson(json['originSongSimpleData'])
        : null;
    single = json['single'];
    noCopyrightRcmd = json['noCopyrightRcmd'];
    rtype = json['rtype'];
    rurl = json['rurl'];
    mst = json['mst'];
    cp = json['cp'];
    mv = json['mv'];
    publishTime = json['publishTime'];
    reason = json['reason'];
    privilege = json['privilege'] != null
        ? new Privilege.fromJson(json['privilege'])
        : null;
    alg = json['alg'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['id'] = this.id;
    data['pst'] = this.pst;
    data['t'] = this.t;
    if (this.ar != null) {
      data['ar'] = this.ar.map((v) => v.toJson()).toList();
    }
    data['alia'] = this.alia;
    data['pop'] = this.pop;
    data['st'] = this.st;
    data['rt'] = this.rt;
    data['fee'] = this.fee;
    data['v'] = this.v;
    data['crbt'] = this.crbt;
    data['cf'] = this.cf;
    if (this.al != null) {
      data['al'] = this.al.toJson();
    }
    data['dt'] = this.dt;
    if (this.h != null) {
      data['h'] = this.h.toJson();
    }
    if (this.m != null) {
      data['m'] = this.m.toJson();
    }
    if (this.l != null) {
      data['l'] = this.l.toJson();
    }
    data['a'] = this.a;
    data['cd'] = this.cd;
    data['no'] = this.no;
    data['ftype'] = this.ftype;
    data['djId'] = this.djId;
    data['copyright'] = this.copyright;
    data['s_id'] = this.sId;
    data['mark'] = this.mark;
    data['originCoverType'] = this.originCoverType;
    if (this.originSongSimpleData != null) {
      data['originSongSimpleData'] = this.originSongSimpleData.toJson();
    }
    data['single'] = this.single;
    data['noCopyrightRcmd'] = this.noCopyrightRcmd;
    data['rtype'] = this.rtype;
    data['rurl'] = this.rurl;
    data['mst'] = this.mst;
    data['cp'] = this.cp;
    data['mv'] = this.mv;
    data['publishTime'] = this.publishTime;
    data['reason'] = this.reason;
    if (this.privilege != null) {
      data['privilege'] = this.privilege.toJson();
    }
    data['alg'] = this.alg;
    return data;
  }
}

class Ar {
  int id;
  String name;
  List<Null> tns;
  List<Null> alias;

  Ar({this.id, this.name, this.tns, this.alias});

  Ar.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    return data;
  }
}

class Al {
  int id;
  String name;
  String picUrl;
  List<Null> tns;
  String picStr;
  int pic;

  Al({this.id, this.name, this.picUrl, this.tns, this.picStr, this.pic});

  Al.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    picUrl = json['picUrl'];
    picStr = json['pic_str'];
    pic = json['pic'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['picUrl'] = this.picUrl;
    data['pic_str'] = this.picStr;
    data['pic'] = this.pic;
    return data;
  }
}

class H {
  int br;
  int fid;
  int size;
  int vd;

  H({this.br, this.fid, this.size, this.vd});

  H.fromJson(Map<String, dynamic> json) {
    br = json['br'];
    fid = json['fid'];
    size = json['size'];
    vd = json['vd'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['br'] = this.br;
    data['fid'] = this.fid;
    data['size'] = this.size;
    data['vd'] = this.vd;
    return data;
  }
}

class OriginSongSimpleData {
  int songId;
  String name;
  List<Artists> artists;
  Artists albumMeta;

  OriginSongSimpleData({this.songId, this.name, this.artists, this.albumMeta});

  OriginSongSimpleData.fromJson(Map<String, dynamic> json) {
    songId = json['songId'];
    name = json['name'];
    if (json['artists'] != null) {
      artists = new List<Artists>();
      json['artists'].forEach((v) {
        artists.add(new Artists.fromJson(v));
      });
    }
    albumMeta = json['albumMeta'] != null
        ? new Artists.fromJson(json['albumMeta'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['songId'] = this.songId;
    data['name'] = this.name;
    if (this.artists != null) {
      data['artists'] = this.artists.map((v) => v.toJson()).toList();
    }
    if (this.albumMeta != null) {
      data['albumMeta'] = this.albumMeta.toJson();
    }
    return data;
  }
}

class Artists {
  int id;
  String name;

  Artists({this.id, this.name});

  Artists.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    return data;
  }
}

class Privilege {
  int id;
  int fee;
  int payed;
  int st;
  int pl;
  int dl;
  int sp;
  int cp;
  int subp;
  bool cs;
  int maxbr;
  int fl;
  bool toast;
  int flag;
  bool preSell;
  int playMaxbr;
  int downloadMaxbr;
  FreeTrialPrivilege freeTrialPrivilege;
  List<ChargeInfoList> chargeInfoList;

  Privilege(
      {this.id,
        this.fee,
        this.payed,
        this.st,
        this.pl,
        this.dl,
        this.sp,
        this.cp,
        this.subp,
        this.cs,
        this.maxbr,
        this.fl,
        this.toast,
        this.flag,
        this.preSell,
        this.playMaxbr,
        this.downloadMaxbr,
        this.freeTrialPrivilege,
        this.chargeInfoList});

  Privilege.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    fee = json['fee'];
    payed = json['payed'];
    st = json['st'];
    pl = json['pl'];
    dl = json['dl'];
    sp = json['sp'];
    cp = json['cp'];
    subp = json['subp'];
    cs = json['cs'];
    maxbr = json['maxbr'];
    fl = json['fl'];
    toast = json['toast'];
    flag = json['flag'];
    preSell = json['preSell'];
    playMaxbr = json['playMaxbr'];
    downloadMaxbr = json['downloadMaxbr'];
    freeTrialPrivilege = json['freeTrialPrivilege'] != null
        ? new FreeTrialPrivilege.fromJson(json['freeTrialPrivilege'])
        : null;
    if (json['chargeInfoList'] != null) {
      chargeInfoList = new List<ChargeInfoList>();
      json['chargeInfoList'].forEach((v) {
        chargeInfoList.add(new ChargeInfoList.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['fee'] = this.fee;
    data['payed'] = this.payed;
    data['st'] = this.st;
    data['pl'] = this.pl;
    data['dl'] = this.dl;
    data['sp'] = this.sp;
    data['cp'] = this.cp;
    data['subp'] = this.subp;
    data['cs'] = this.cs;
    data['maxbr'] = this.maxbr;
    data['fl'] = this.fl;
    data['toast'] = this.toast;
    data['flag'] = this.flag;
    data['preSell'] = this.preSell;
    data['playMaxbr'] = this.playMaxbr;
    data['downloadMaxbr'] = this.downloadMaxbr;
    if (this.freeTrialPrivilege != null) {
      data['freeTrialPrivilege'] = this.freeTrialPrivilege.toJson();
    }
    if (this.chargeInfoList != null) {
      data['chargeInfoList'] =
          this.chargeInfoList.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class FreeTrialPrivilege {
  bool resConsumable;
  bool userConsumable;

  FreeTrialPrivilege({this.resConsumable, this.userConsumable});

  FreeTrialPrivilege.fromJson(Map<String, dynamic> json) {
    resConsumable = json['resConsumable'];
    userConsumable = json['userConsumable'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['resConsumable'] = this.resConsumable;
    data['userConsumable'] = this.userConsumable;
    return data;
  }
}

class ChargeInfoList {
  int rate;
  Null chargeUrl;
  Null chargeMessage;
  int chargeType;

  ChargeInfoList(
      {this.rate, this.chargeUrl, this.chargeMessage, this.chargeType});

  ChargeInfoList.fromJson(Map<String, dynamic> json) {
    rate = json['rate'];
    chargeUrl = json['chargeUrl'];
    chargeMessage = json['chargeMessage'];
    chargeType = json['chargeType'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['rate'] = this.rate;
    data['chargeUrl'] = this.chargeUrl;
    data['chargeMessage'] = this.chargeMessage;
    data['chargeType'] = this.chargeType;
    return data;
  }
}

class RecommendReasons {
  int songId;
  String reason;

  RecommendReasons({this.songId, this.reason});

  RecommendReasons.fromJson(Map<String, dynamic> json) {
    songId = json['songId'];
    reason = json['reason'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['songId'] = this.songId;
    data['reason'] = this.reason;
    return data;
  }
}
