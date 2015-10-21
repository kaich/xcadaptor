# Xcadaptor

TODO: Write a gem description

## Installation

Add this line to your application's Gemfile:

install it yourself as:

    $ gem install xcadaptor

## Usage

TODO: Write usage instructions here	

苹果每次系统更新，ios工程配置等或多或少的需要适配。这个命令行简单的实现适配

主要适配方面：

* 工程文件配置. 例如ios9中的bitcode.
* info.plist里面的配置的更改.例如ios9中NSAppTransportSecurity的添加
* 特定文件名称更改。例如：icon和启动图的图片名称更改
* 特定问题。这种类型会给出解决方法的具体连接，或者给出操作方法。

现有功能：	

###IOS 9.0 适配 
从ios8到ios 9.0适配主要可以参考[iOS9AdaptationTips](https://github.com/ChenYilong/iOS9AdaptationTips),里面又详细的适配教程。该`Xcadaptor`工具主要实现了如下:

* 适配9.0的ssl,具体各个参数使用[App Transport Security Technote](https://developer.apple.com/library/prerelease/ios/technotes/App-Transport-Security-Technote/)

    ```ruby
	xcadaptor adapt ios 9.0 --category ssl
	```
* 适配9.0的bitcode
   
   ```ruby
   xcadaptor adapt ios 9.0 --category bitcode
   ```
* 适配9.0的url scheme

	```ruby
	xcadaptor adapt ios 9.0 --category urlscheme
	```
如果要全部执行ios9.0的适配，请不要添加option参数

	```ruby
	xcadaptor adapt ios 9.0
	```

`在项目的根目录中执行以上命令`

###配置
添加了`xcadaptor config`命令，目前值支持ios9的 ssl

* 配置ssl. 默认情况下如果有NSAppTransportSecurity就不会覆盖。
	* -b是黑名单可以任何形式访问，
	* -w是白名单就是必须要通过ssl访问。
	* -f 是强制覆盖。覆盖原来的NSAppTransportSecurity配置
  
  ```ruby
  xcadaptor config ssl -b www.baidu.com www.aisi.com www.google.com  -w tengxun.com -f
  ```


## Contributing

1. Fork it ( https://github.com/[my-github-username]/xcadaptor/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
