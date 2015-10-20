module Xcadaptor

  require_relative '../../project_method'

  class Urlscheme

    def self.run
       project =Xcadaptor::Project.new 
       info_plist = project.info_plist
       key = 'LSApplicationQueriesSchemes'
       scheme_value = info_plist[key]
       if !scheme_value
         info_plist[key] = scheme_array
         puts "add [#{key}] in plist\n"
         project.save
       end 
    end


    def self.scheme_array
      [
        "wechat",
        "weixin", #weixin
        "sinaweibohd",
        "sinaweibo",
        "sinaweibosso",
        "weibosdk",
        "weibosdk2.5", #sina 
        "mqqapi",
        "mqq",
        "mqqOpensdkSSoLogin",
        "mqqconnect",
        "mqqopensdkdataline",
        "mqqopensdkgrouptribeshare",
        "mqqopensdkfriend",
        "mqqopensdkapi",
        "mqqopensdkapiV2",
        "mqqopensdkapiV3",
        "mqzoneopensdk",
        "wtloginmqq",
        "wtloginmqq2",
        "mqqwpa",
        "mqzone",
        "mqzonev2",
        "mqzoneshare",
        "wtloginqzone",
        "mqzonewx",
        "mqzoneopensdkapiV2",
        "mqzoneopensdkapi19",
        "mqzoneopensdkapi",
        "mqzoneopensdk",#qq
        "alipay",
        "alipayshare", #支付宝
        "yixin",
        "yixinopenapi", #易信
      ]
    end

  end

end
