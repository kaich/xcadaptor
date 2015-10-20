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

* 适配9.0的ssl

    ```ruby
	xcadaptor adapt ios 9.0 --category ssl
	```
* 适配9.0的bitcode
   
   ```ruby
   xcadaptor adapt ios 9.0 --category bitcode
   ```
如果要全部执行ios9.0的适配，请不要添加option参数

	```ruby
	xcadaptor adapt ios 9.0
	```


## Contributing

1. Fork it ( https://github.com/[my-github-username]/xcadaptor/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
