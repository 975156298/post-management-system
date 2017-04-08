class UserInformationController < ApplicationController
  before_action :check_cookies, only: [:index, :get_user_info, :update]
  def index
    @hobby_infos = hobby_info
    @degree_infos = degree_info
    @height_infos = height_info
    @star_infos = stars
    @address_infos = address
    @work_infos = works
  end

  def get_all_user
    @user_all = UserInformation.all
    render :json => {data: @user_all}
  end

  def get_user_info
    user_info = UserInformation.find_by_user(cookies[:user])
    render :json =>{date: user_info}
  end

  def update
    user_info = UserInformation.find_by_user(cookies[:user])
    p "-----------------user"
    p user_info
    if user_info
      user_info.update(update_info)
      return render :json => {status: 200}
    end
    render :json => {status: 'sss'}
  end

  def update_password
    user_info = UserInformation.find_by_user(cookies[:user])
    if user_info
      user_info.update({password: params[:password]})
      return render :json => {status: 200}
    end
  end

  def delete_user
    UserInformation.find_by_user('zhuxuey').delete
    for note in NoteInfo.where(user_id: params[:user_id])
      note.delete
    end
  end

  private

  def update_info
    {
        name: params[:name],
        height: params[:height],
        star: params[:star],
        sex: params[:sex],
        birthday_time: params[:birthday_time].to_time,
        age: Time.new(params[:birthday_time]).year,
        work:params[:work],
        contact: params[:phone],
        address: params[:address],
        degree: params[:degree],
        hobby: params[:hobby]
    }
  end

  def hobby_info
    [
        {kind: '生活', tastes: ['投资理财', '数码产品', '旅游','花草','宠物','做饭','烘焙']},
        {kind: '体育', tastes: ['游泳','跑步','篮球','滑雪','瑜伽','羽毛球','野外露营','台球','健身','足球','爬山']},
        {kind: '休闲', tastes: ['游戏','摄影','钓鱼','歌舞话剧','阅读','电影','音乐','酒吧/KTV','麻将','书法/绘画']},
        {kind: '乐器', tastes: ['钢琴','小提琴','大提琴','吉他','双簧管']}
    ]
  end

  def degree_info
    [
        '高中以下','高中','专科','本科','研究生','博士'
    ]
  end

  def height_info
    [
        '1.50以下','1.51~1.55','1.56~1.60','1.60~1.65','1.66~1.70','1.71~1.75','1.76~1.80','1.81~1.85','1.86以上'
    ]
  end

  def stars
    [
        '白羊座', '金牛座', '双子座', '巨蟹座', '狮子座', '处女座', '天秤座', '天蝎座', '射手座', '摩羯座', '水瓶座', '双鱼座'
    ]
  end

  def address
    [
        {province:"北京市", address: ["东城区", "西城区", "崇文区", "宣武区", "朝阳区", "丰台区", "石景山区", "海淀区", "门头沟区",
                                   "房山区", "通州区", "顺义区", "昌平区", "大兴区", "怀柔区", "平谷区", "密云县", "延庆县"]},
        {province: "天津市", address: ["和平区", "河东区", "河西区", "南开区", "河北区", "红桥区", "塘沽区", "汉沽区", "大港区",
                                    "东丽区", "西青区", "津南区", "北辰区", "武清区", "宝坻区", "宁河县", "静海县", "蓟县"]},
        {province:"上海市", address: ["黄浦区", "卢湾区", "徐汇区", "长宁区", "静安区", "普陀区", "闸北区", "虹口区",
                                   "杨浦区", "闵行区", "宝山区", "嘉定区", "浦东新区", "金山区", "松江区", "青浦区", "南汇区", "奉贤区", "崇明县"]},
        {province: "重庆市", address: ["万州区", "涪陵区", "渝中区", "大渡口区", "江北区", "沙坪坝区", "九龙坡区", "南岸区", "北碚区", "万盛区", "双桥区", "渝北区", "巴南区", "黔江区", "长寿区", "綦江县", "潼南县", "铜梁县",
                                    "大足县", "荣昌县", "璧山县", "梁平县", "城口县", "丰都县", "垫江县", "武隆县", "忠县", "开县", "云阳县", "奉节县", "巫山县",
                                    "巫溪县", "石柱土家族自治县", "秀山土家族苗族自治县", "酉阳土家族苗族自治县", "彭水苗族土家族自治县", "江津市", "合川市", "永川市", "南川市"]},
        {province:"黑龙江省", address: ["哈尔滨市", "齐齐哈尔市", "鸡西市", "鹤岗市", "双鸭山市", "大庆市", "伊春市", "佳木斯市", "七台河市", "牡丹江市", "黑河市", "绥化市", "大兴安岭地区"]},
        {province: "吉林省", address: ["长春市", "吉林市", "四平市", "辽源市", "通化市", "白山市", "松原市", "白城市", "延边朝鲜族自治州"]},
        {province:"辽宁省", address: ["沈阳市", "大连市", "鞍山市", "抚顺市", "本溪市", "丹东市", "锦州市", "营口市", "阜新市", "辽阳市", "盘锦市", "铁岭市", "朝阳市", "葫芦岛市"]},
        {province:"河北省", address: ["石家庄市", "唐山市", "秦皇岛市", "邯郸市", "邢台市", "保定市", "张家口市", "承德市", "沧州市", "廊坊市", "衡水市"]},
        {province:"山西省", address: ["太原市", "大同市", "阳泉市", "长治市", "晋城市", "朔州市", "晋中市", "运城市", "忻州市", "临汾市", "吕梁市"]},
        {province: "青海省", address: ["西宁市", "海东地区", "海北藏族自治州", "黄南藏族自治州", "海南藏族自治州", "果洛藏族自治州", "玉树藏族自治州", "海西蒙古族藏族自治州"]},
        {province:"山东省", address: ["济南市", "青岛市", "淄博市", "枣庄市", "东营市", "烟台市", "潍坊市", "济宁市", "泰安市", "威海市", "日照市", "莱芜市", "临沂市", "德州市", "聊城市", "滨州市", "菏泽市"]},
        {province:"河南省", address: ["郑州市", "开封市", "洛阳市", "平顶山市", "安阳市", "鹤壁市", "新乡市", "焦作市", "濮阳市", "许昌市", "漯河市", "三门峡市", "南阳市", "商丘市", "信阳市", "周口市", "驻马店市", "济源市"]},
        {province:"江苏省", address: ["南京市", "无锡市", "徐州市", "常州市", "苏州市", "南通市", "连云港市", "淮安市", "盐城市", "扬州市", "镇江市", "泰州市", "宿迁市"]},
        {province:"安徽省", address: ["合肥市", "芜湖市", "蚌埠市", "淮南市", "马鞍山市", "淮北市", "铜陵市", "安庆市", "黄山市", "滁州市", "阜阳市", "宿州市", "巢湖市", "六安市","亳州市", "池州市", "宣城市"]},
        {province:"浙江省", address: ["杭州市", "宁波市", "温州市", "嘉兴市", "湖州市", "绍兴市", "金华市", "衢州市", "舟山市", "台州市", "丽水市"]},
        {province:"福建省", address: ["福州市", "厦门市", "莆田市", "三明市", "泉州市", "漳州市", "南平市", "龙岩市", "宁德市"]},
        {province:"江西省", address: ["南昌市", "景德镇市", "萍乡市", "九江市", "新余市", "鹰潭市", "赣州市", "吉安市", "宜春市", "抚州市", "上饶市"]},
        {province:"湖南省", address: ["长沙市", "株洲市", "湘潭市", "衡阳市", "邵阳市", "岳阳市", "常德市", "张家界市", "益阳市", "郴州市", "永州市", "怀化市", "娄底市", "湘西土家族苗族自治州"]},
        {province:"湖北省", address: ["武汉市", "黄石市", "十堰市", "宜昌市", "襄樊市", "鄂州市", "荆门市", "孝感市", "荆州市", "黄冈市", "咸宁市", "随州市", "恩施土家族苗族自治州", "仙桃市", "潜江市", "天门市", "神农架林区"]},
        {province:"广东省", address: ["广州市", "韶关市", "深圳市", "珠海市", "汕头市", "佛山市", "江门市", "湛江市", "茂名市", "肇庆市", "惠州市", "梅州市", "汕尾市", "河源市", "阳江市", "清远市", "东莞市", "中山市", "潮州市", "揭阳市", "云浮市"]},
        {province:"台湾", address: ["台北市", "新北市", "桃园市", "台中市", "台南市", "高雄市", "基隆市", "新竹市", "嘉义市"]},
        {province:"海南省", address: ["海口市", "三亚市", "五指山市", "琼海市", "儋州市", "文昌市", "万宁市", "东方市", "定安县"]},
        {province:"甘肃省", address: ["兰州市", "嘉峪关市", "金昌市", "白银市", "天水市", "武威市", "张掖市", "平凉市", "酒泉市", "庆阳市", "定西市", "陇南市", "临夏回族自治州", "甘南藏族自治州"]},
        {province:"陕西省", address: ["西安市", "铜川市", "宝鸡市", "咸阳市", "渭南市", "延安市", "汉中市", "榆林市", "安康市"]},
        {province: "四川省", address: ["成都市", "自贡市", "攀枝花市", "泸州市", "德阳市", "绵阳市", "广元市", "遂宁市", "内江市", "乐山市", "南充市", "眉山市", "宜宾市", "广安市", "达州市",
                                    "雅安市", "巴中市", "资阳市", "阿坝藏族羌族自治州", "甘孜藏族自治州", "凉山彝族自治州"]},
        {province:"贵州省", address: ["贵阳市", "六盘水市", "遵义市", "安顺市", "铜仁地区", "黔西南布依族苗族自治州", "毕节地区", "黔东南苗族侗族自治州", "黔南布依族苗族自治州"]},
        {province: "云南省", address: ["昆明市", "曲靖市", "玉溪市", "保山市", "昭通市", "丽江市", "思茅市", "临沧市", "楚雄彝族自治州", "红河哈尼族彝族自治州", "文山壮族苗族自治州",
                                    "西双版纳傣族自治州", "大理白族自治州", "德宏傣族景颇族自治州", "怒江傈僳族自治州", "迪庆藏族自治州"]},
        {province:"内蒙古自治区", address: ["呼和浩特市", "包头市", "乌海市", "赤峰市", "通辽市", "鄂尔多斯市", "呼伦贝尔市", "巴彦淖尔市", "乌兰察布市", "兴安盟", "锡林郭勒盟", "阿拉善盟"]},
        {province:"新疆维吾尔自治区", address: ["乌鲁木齐市", "克拉玛依市", "吐鲁番地区", "哈密地区", "昌吉回族自治州", "博尔塔拉蒙古自治州", "巴音郭楞蒙古自治州", "阿克苏地区", "克孜勒苏柯尔克孜自治州", "喀什地区", "和田地区",
                                        "伊犁哈萨克自治州", "塔城地区", "阿勒泰地区", "石河子市", "阿拉尔市", "图木舒克市", "五家渠市"]},
        {province:"西藏自治区", address: ["拉萨市", "昌都地区", "山南地区", "日喀则地区", "那曲地区", "阿里地区", "林芝地区"]},
        {province:"宁夏回族自治区", address: ["银川市", "石嘴山市", "吴忠市", "固原市", "中卫市"]},
        {province:"广西壮族自治区", address: ["南宁市", "柳州市", "桂林市", "梧州市", "北海市", "防城港市", "钦州市", "贵港市", "玉林市", "百色市", "贺州市", "河池市", "来宾市", "崇左市"]},
        {province:"香港", address: ["香港岛", "九龙", "新界"]},
        {province:"澳门", address: ["花地玛堂区（北区）", "圣安多尼堂区（花王堂区）", "大堂区", "望德堂区", "风顺堂区", "嘉模堂区（氹仔）", "圣方济各堂区（环路）", "路氹城", "澳门新城区"]}
    ]
  end

  def works
    [{kind:"经营管理类", work: ["总裁/总经理/CEO", "行政总监", "技术总监CTO/总工", "人力资源总监", "财务总监CFO/总会计师", "首席信息官CIO", "首席运营官/COO", "市场/营销总监", "联盟经理"]},
     {kind:"公关/市场营销类",work: ["公关经理", "公关专员", "市场经理/营销经理", "渠道经理", "产品/品牌经理", "市场助理/专员", "市场营销/推广/合作", "客户代表/营销代表", "市场策划", "市场分析/调研", "CI设计与策划", "广告文案/媒体策划/设计"]},
     {kind:"贸易/销售/业务类",work: ["国内贸易", "国外贸易/涉外业务", "跟单员", "报关员", "销售经理/区域经理/商务经理", "销售工程师/销售代表", "销售助理/业务员", "商务代表/商务助理/业务助理"]},
     {kind:"财务类",work: ["财务经理", "会计主管", "注册会计师", "会计", "出纳", "审计经理/主管/专员", "注册审计师", "统计", "计划", "稽核", "财务分析", "成本分析/核算"]},
     {kind:"行政/人力资源管理类",work: ["行政经理/主管", "行政专员/行政秘书/助理", "办公室主任", "人力资源经理/专员/助理", "培训经理/专员/助理", "招聘经理/专员/助理", "薪酬福利经理/专员/助理", "绩效考核经理/专员/助理"]},
     {kind:"文职类",work: ["图书情报/资料/文档管理", "文秘/高级文员", "资料/文档撰写/编辑", "计算机操作员/打字员/文员/校对", "前台/接待员/礼仪", "收发员/话务员/后勤", "英语翻译", "日语翻译", "法语翻译", "德语翻译", "韩语翻译", "其它语种"]},
     {kind:"客户服务类",work: ["客户服务经理", "技术支持/客户培训", "售前/售后服务", "热线咨询", "客户关系处理", "客户分析", "投诉处理"]},
     {kind:"工厂类",work: ["厂长/副厂长", "厂务管理", "车间主任/拉长", "产品开发", "品质管理", "采购管理", "仓储管理", "物料管理", "设备管理", "安全管理", "配色美工", "计划/调度/协调员", "PMC/SMT技术员", "生产控制文员"]},
     {kind:"计算机/互联网类",work: ["技术主管/项目经理", "信息经理/内容主管/栏目主持", "程序员/软件工程师", "系统集成/支持", "系统分析员", "硬件开发工程师/硬件工程师", "软件测试工程师", "硬件测试工程师", "网站/电子商务开发",
                             "网络工程师", "网站策划", "网页设计与制作", "网站美工/电脑美工", "网站编辑", "数据库开发与管理",
                             "系统/网络管理及维护", "系统/网络/信息安全", "多媒体设计与开发", "计算机辅助设计与绘图"]},
     {kind:"电子/通讯类",work: ["技术主管/项目经理", "电子工程师", "无线电工程师", "电子元器件工程师", "电路设计/电子测试/半导体技术", "单片机/DSL/DSP/底层软件开发", "广播视听设备工程师", "电子/电器维修工程师", "电子测试工程师", "电子技术员", "工艺工程师", "仪器/仪表/测量工程师", "绘图工程师", "通讯/通信工程师"]},
     {kind:"机械类",work: ["机械工程师/模具设计", "机械制图工程师", "机械制造工程师", "机电工程师", "结构工程师", "注塑/电镀工程师", "机电技术员"]},
     {kind:"规划/建筑/建材类",work: ["城镇规划设计", "风景园林规划设计", "园艺工程师", "建筑设计", "土木建筑/工民建", "绘图/建筑制图", "结构工程师", "测绘工程师", "施工管理", "工程监理", "工程预决算", "装饰/安装工程师",
                              "道桥设计与施工", "港口与航道设计与施工", "水电/管道工程师", "给排水工程师", "制冷暖通工程师", "智能楼宇设计与施工", "岩土工程师/地下工程", "安全注册主任", "安全员", "建材"]},
     {kind:"房地产/物业管理类",work: ["房地产开发/策划", "房地产经纪", "房地产评估/交易", "房地产销售", "物业管理经理/主管/主任", "物业管理员/助理"]},
     {kind: "金融/经济",work: ["银行会计", "储蓄员", "信贷/信贷风险控制", "银行国际业务", "投资银行", "外汇", "建筑审计", "证券经纪人", "证券投资顾问", "操盘手/交易员", "行业分析", "股评", "期货/股票经纪", "投资管理/顾问", "资产评估", "融资", "保险经纪人/保险业务员", "拍卖师"]},
     {kind: "设计类",work: ["平面设计", "动画设计", "产品外观设计", "装璜美术设计/室内外设计", "服装设计", "广告设计", "珠宝设计", "展览设计", "家具设计", "工艺品设计", "形象设计"]},
     {kind:"法律类",work: ["律师", "法律顾问", "法律助理"]},
     {kind:"酒店/餐饮类",work: ["酒店经理/餐馆经理", "大堂副理/楼面经理", "领班", "厨师", "服务员", "咨客"]},
     {kind:"物流/交通运输类",work: ["物流经理/主管", "货运仓储经理/主管", "船务", "运输管理/调度"]},
     {kind:"商场类",work: ["商场经理/主管", "业务经理/主任", "店面设计/陈列", "店长", "营业员/导购员/店员", "收银员", "促销员", "物价员"]},
     {kind: "电气/电力类",work: ["电力拖动与自动控制", "电机与电器", "电力工程师/电气", "电路布线设计", "智能大厦/综合布线/弱电", "灯饰研发工程师", "光源/照明", "变压器/磁电工程师", "家用电器研发", "家用电器维修"]},
     {kind:"咨询/顾问类",work: ["企业管理咨询", "企业管理顾问", "信息咨询/中介", "培训师"]},
     {kind:"化工/生物类",work: ["化工生产工程师", "精细化工工程师", "高分子材料工程师", "化工制药", "化验员/检验员", "化工生产技术员", "生物工程"]},
     {kind: "文化/教育/体育类/艺术类",work: ["图书情报/资料/文档管理", "高等教育", "中等教育", "小学教育/幼儿教育/保育员", "职业教育/培训/家教", "体育教练/健美教练", "模特", "舞蹈", "声乐", "器乐"]},
     {kind: "医疗卫生/护理/保健类",work: ["西医", "中医", "心理医生", "兽医/宠物医生", "医疗技术/医学检验师", "药剂师", "麻醉师", "护理人员/护士", "卫生防疫", "妇幼保健", "针灸推拿"]},
     {kind: "新闻/出版/传媒类",work: ["总编/主编", "文字编辑", "美术编辑/美工", "记者/新闻采编", "摄影录制", "节目主持/DJ/播音", "演员", "影视策划/制作", "音效师"]},
     {kind:"公众服务类",work: ["保安/消防员", "快递员", "旅游/导游", "声讯", "按摩师/美容/美发", "家政", "裁缝", "环卫工"]},
     {kind:"印刷/染织类",work: ["印刷主管", "印刷技工", "版房制版师傅", "晒版师", "染织类"]},
     {kind:"技工类",work: ["机器冷加工", "机器热加工","装配工", "叉车工", "汽车修理工", "司机", "水/木/漆工", "电工", "空调工/电梯工/锅炉工"]},
     {kind:"其他专业类",work: ["食品类", "造纸类", "家具制造类", "农林牧渔/水利类", "地质/矿产类", "环境保护/监测/治理类"]}
    ]
  end
end
