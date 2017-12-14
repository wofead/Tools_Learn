### SVN的初始化学习
1. 创建版本库：TortoiseSVN → Create Repository here...——>C:\svn_repos,svn版本库文件夹，之后会生成，trunk等框架文件
1. 导入项目：TortoiseSVN → Import...——>C:\Projects\Widget1 ，项目文件夹,将项目导入到版本库中
1. 检出工作副本：TortoiseSVN → Checkout...——>file:///c:/svn_repos/trunk/Widget1，新建工作空间，将版本库里面的项目checkout到工作目录
1. 如果修改了文件，可以通过比较差异来查看与远程库中的不同
1. 如果添加了新文件，要先用add添加，相应的删除要是用svn的delete
1. revert 回退版本
